

#include "sound.h"

#include <sys/stat.h>

#include <AL/alc.h>

#include "SDL.h"
#include "SDL_thread.h"

#include "main.h"
#include "log.h"
#include "pack.h"
#include "music.h"


#define SOUND_PREFIX	"snd/sounds/"
#define SOUND_SUFFIX ".wav"


/*
 * gives the buffers a name
 */
typedef struct {
	char *name; /* buffer's name */
	ALuint buffer; /* assosciated OpenAL buffer */
} alSound;


#define VOICE_PLAYING		(1<<0)	/* voice is playing */
#define VOICE_LOOPING		(1<<1)	/* voice is looping */
#define voice_set(v,f)		((v)->flags |= f)
#define voice_is(v,f)		((v)->flags & f)


/*
 * global sound lock
 */
SDL_mutex *sound_lock;


/*
 * global device and contex
 */
static ALCcontext *al_context = NULL;
static ALCdevice *al_device = NULL;

/*
 * music player thread to assure streaming is perfect
 */
static SDL_Thread *music_player = NULL;


/*
 * list of sounds available (all preloaded into a buffer)
 */
static alSound *sound_list = NULL;
static int nsound_list = 0;


/*
 * currenty sources playing
 */
static alVoice **voice_stack = NULL;
static int nvoice_stack = 0;
static int mvoice_stack = 0;


/*
 * prototypes
 */
static int sound_makeList (void);
static int sound_load( ALuint *buffer, char *filename );
static void sound_free( alSound *snd );


/*
 * initializes the sound subsystem
 */
int sound_init (void)
{
	sound_lock = SDL_CreateMutex();

	SDL_mutexP( sound_lock );

	const ALchar* device = alcGetString( NULL, ALC_DEFAULT_DEVICE_SPECIFIER );
	DEBUG("OpenAL using device '%s'", device );

	/* opening the default device */
	al_device = alcOpenDevice(NULL);
	if (al_device == NULL) {
		WARN("Unable to open default sound device");
		return -1;
	}

	/* create the OpenAL context */
	al_context = alcCreateContext( al_device, NULL );
	if (al_context == NULL) {
		WARN("Unable to create OpenAL context");
		return -2;
	}

	/* clear the errors */
	alGetError(); 

	/* set active context */
	if (alcMakeContextCurrent( al_context )==AL_FALSE) {
		WARN("Failure to set default context");
		return -4;
	}

	/* set the master gain */
	alListenerf( AL_GAIN, .5 );

	alDistanceModel( AL_INVERSE_DISTANCE_CLAMPED );
	ALenum err = alGetError();
	DEBUG("%d", err);

	SDL_mutexV( sound_lock );

	/* load up all the sounds */
	sound_makeList();
	
	/* start the music server */
	music_init();
	music_player = SDL_CreateThread( music_thread, NULL );

	return 0;
}
/*
 * cleans up after the sound subsytem
 */
void sound_exit (void)
{
	int i;
	/* free the sounds */
	for (i=0; i<nsound_list; i++)
		sound_free( &sound_list[i] );
	free( sound_list );
	sound_list = NULL;
	nsound_list = 0;

	/* must stop the music before killing it, then thread should commit suicide */
	music_stop();
	music_kill();
	SDL_WaitThread( music_player, NULL );
	music_exit();

	SDL_mutexP( sound_lock );

	if (al_context) {
		alcMakeContextCurrent(NULL);
		alcDestroyContext( al_context );
	}
	if (al_device) alcCloseDevice( al_device );

	SDL_mutexV( sound_lock );
	SDL_DestroyMutex( sound_lock );
}


/*
 * gets the buffer to sound of name
 */
ALuint sound_get( char* name ) 
{
	int i;
	for (i=0; i<nsound_list; i++)
		if (strcmp(name, sound_list[i].name)==0)
			return sound_list[i].buffer;
	WARN("Sound '%s' not found in sound list", name);
	return 0;
}


/*
 * makes the list of available sounds
 */
static int sound_makeList (void)
{
	char** files;
	uint32_t nfiles,i;
	char tmp[64];
	int len;

	/* get the file list */
	files = pack_listfiles( data, &nfiles );

	/* load the profiles */
	for (i=0; i<nfiles; i++)
		if ((strncmp( files[i], SOUND_PREFIX, strlen(SOUND_PREFIX))==0) &&
				(strncmp( files[i] + strlen(files[i]) - strlen(SOUND_SUFFIX),
							 SOUND_SUFFIX, strlen(SOUND_SUFFIX))==0)) {

			/* grow the selection size */
			sound_list = realloc( sound_list, ++nsound_list*sizeof(alSound));

			/* remove the prefix and suffix */
			len = strlen(files[i]) - strlen(SOUND_SUFFIX SOUND_PREFIX);
			strncpy( tmp, files[i] + strlen(SOUND_PREFIX), len );
			tmp[len] = '\0';

			/* give it the new name */
			sound_list[nsound_list-1].name = strdup(tmp);
			sound_load( &sound_list[nsound_list-1].buffer, files[i] );
		}

	/* free the char* allocated by pack */
	for (i=0; i<nfiles; i++)
		free(files[i]);
	free(files);

	DEBUG("Loaded %d sound%c", nsound_list, (nsound_list==1)?' ':'s');

	return 0;
}


/*
 * loads a sound into the sound_list
 */
static int sound_load( ALuint *buffer, char *filename )
{
	void* wavdata;
	unsigned int size;
	ALenum err;

	/* get the file data buffer from packfile */
	wavdata = pack_readfile( DATA, filename, &size );

	SDL_mutexP( sound_lock );

	/* bind to OpenAL buffer */
	alGenBuffers( 1, buffer );
	alBufferData( *buffer, AL_FORMAT_MONO16, wavdata, size, 22050 );

	/* errors? */
	if ((err = alGetError()) != AL_NO_ERROR) {
		WARN("OpenAL error '%d' loading sound '%s'.", err, filename );
		return 0;
	}

	SDL_mutexV( sound_lock );

	/* finish */
	free( wavdata );
	return 0;
}
static void sound_free( alSound *snd )
{
	SDL_mutexP( sound_lock );

	if (snd->name) free(snd->name);
	alDeleteBuffers( 1, &snd->buffer );

	SDL_mutexV( sound_lock );
}


/*
 * updates the sounds and prioritizes sounds
 */
void sound_update (void)
{
	int i;

	/* TODO prioritize sounds */

	SDL_mutexP( sound_lock );

	for (i=0; i<nvoice_stack; i++) {
		if (voice_is(voice_stack[i], VOICE_PLAYING)) {

			/* update position */
			alSource3f( voice_stack[i]->source, AL_POSITION,
					voice_stack[i]->px, voice_stack[i]->py, 0. );
	/*		alSource3f( voice_stack[i]->source, AL_VELOCITY,
					voice_stack[i]->vx, voice_stack[i]->vy, 0. );*/
		}
	}

	SDL_mutexV( sound_lock );
}


/*
 * creates a dynamic moving voice
 */
alVoice* sound_addVoice( int priority, double px, double py,
		double vx, double vy, const ALuint buffer, const int looping )
{
	alVoice *voc;
	ALenum err;

	nvoice_stack++;
	if (nvoice_stack > mvoice_stack)
		voice_stack = realloc( voice_stack, ++mvoice_stack * sizeof(alVoice*) );
	
	voc = malloc(sizeof(alVoice));
	voice_stack[nvoice_stack-1] = voc;

	SDL_mutexP( sound_lock );

	/* try to grab a source */
	voc->source = 0;
	alGenSources( 1, &voc->source );
	err = alGetError();
	if (err != AL_NO_ERROR) voc->source = 0;

	/* set the data */
	voc->priority = priority;
	voc->start = SDL_GetTicks();
	voc->buffer = buffer;
	if (looping) voice_set( voc, VOICE_LOOPING );
	voc->px = px;
	voc->py = py;
/*	voc->vx = vx;
	voc->vy = vy; */
	
	/* set the source */
	if (voc->source) {
		alSourcei( voc->source, AL_BUFFER, buffer );

		/* distance model */
		alSourcef( voc->source, AL_MAX_DISTANCE, 1000. );
		alSourcef( voc->source, AL_REFERENCE_DISTANCE, 250. );

		alSourcei( voc->source, AL_SOURCE_RELATIVE, AL_FALSE );
		alSourcef( voc->source, AL_GAIN, 0.5 );
		alSource3f( voc->source, AL_POSITION, voc->px, voc->py, 0. );
/*		alSource3f( voc->source, AL_VELOCITY, voc->vx, voc->vy, 0. ); */
		if (voice_is( voc, VOICE_LOOPING ))
			alSourcei( voc->source, AL_LOOPING, AL_TRUE );
		else
			alSourcei( voc->source, AL_LOOPING, AL_FALSE );

		/* try to play the source */
		alSourcePlay( voc->source );
		err = alGetError();
		if (err == AL_NO_ERROR) voice_set( voc, VOICE_PLAYING );
		else DEBUG("source play failure");
	}

	SDL_mutexV( sound_lock );

	return voc;
}

/*
 * deletes the voice
 */
void sound_delVoice( alVoice* voice )
{
	ALint stat;
	int i;

	for (i=0; i<nvoice_stack; i++)
		if (voice == voice_stack[i])
			break;
	
	/* no match is found */
	if (i>=nvoice_stack) {
		WARN("Unable to find voice to free from stack");
		return;
	}

	if (voice->source) {
		SDL_mutexP( sound_lock );

		alGetSourcei( voice->source, AL_SOURCE_STATE, &stat );
		if (stat == AL_PLAYING) alSourceStop( voice->source );
		alDeleteSources( 1, &voice->source );
		voice->source = 0;

		SDL_mutexV( sound_lock );
	}

	free(voice_stack[i]);
	nvoice_stack--;
	for ( ; i<nvoice_stack; i++)
		voice_stack[i] = voice_stack[i+1];
}


void voice_update( alVoice* voice, double px, double py,
		double vx, double vy )
{
	voice->px = px;
	voice->py = py;
/*	voice->vx = vx;
	voice->vy = vy;*/
}


/*
 * sets the listener
 */
void sound_listener( double dir, double px, double py,
		double vx, double vy )
{
	SDL_mutexP( sound_lock );

	ALfloat ori[] = { 0., 0., 0.,  0., 0., 1. };
	ori[0] = cos(dir);
	ori[1] = sin(dir);
	alListenerfv( AL_ORIENTATION, ori );
	alListener3f( AL_POSITION, px, py, 0. );
/*	alListener3f( AL_VELOCITY, vx, vy, 0. );*/

	SDL_mutexV( sound_lock );
}
