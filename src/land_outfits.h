/*
 * See Licensing and Copyright notice in naev.h
 */



#ifndef LAND_OUTFITS_H
#  define LAND_OUTFITS_H


#include "outfit.h"


void outfits_open( unsigned int wid );
void outfits_updateQuantities( unsigned int wid );
void outfits_update( unsigned int wid, char* str );
void outfits_updateEquipmentOutfits( void );

#endif /* LAND_OUTFITS_H */
