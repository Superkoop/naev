--[[
      MISSION: Kidnapped 2 (AKA Return the Kids)
      AUTHOR: Superkoop - John Koopman

      The second installment of the Kidnapped series. This mission consists or returning the children back to their respective planets on various dangerous systems. While the player is returning the children, the player will have to fight off enemies at each system.

--]]

lang = naev.lang()
if lang == "es" then
else
  --The course of action is that we start at home, go to Nartur to drop off one child, and commence to the next six systems/planets to drop off the rest of the children while having to fight off some mercenaries at each.
  homesys = "Arcturus"
  sysname1 = "Nartur"
  sysname2 = "Goddard"
  sysname3 = "Vlexon"
  sysname4 = "Tarsus"
  sysname5 = "Ingot"
  sysname6 = "Tau Prime"
  sysname7 = "Cygnus"
  
  planet1 = "Ian"
  planet2 = "Geron"
  planet3 = "Phee"
  planet4 = "Ginni"
  planet5 = "Ulios"
  planet6 = "Europea"
  planet7 = "Jaan"
  home = "Brooks"
  
  --Mission stuff
  mistitle = "Return the Kids"
  reward = "Very little"
  description = [[Return the children to their families on various planets.]]
  bar_desc = [[You see Andrew sitting at a table. He is eating some peanuts and looking at you with a smile. There is an empty chair across from him.]]
  
  title = {}
  text = {}
  osdmsg = {}
  flightmsg = {}
  broadcast = {}
  --Messages on landing
  title[1] = "The Lowdown"
  text[1] = [["%s, it's good to see you again!" Andrew says as he shakes your hand in greeting, and a waitress sets a drink in front of you with a smile. Andrew continues as you take a swig, "Since you've been away, my wife Janice and I have been putting together a little bit of a drop-off list for the children, so that we can get all of the children dropped off in the most convenient route. It most certainly will not be a quick trip, though these children really want to get home and I don't want to deprive them from their parents any longer than necessary. A lot of the children live on the same planets, but there are still about half a dozen stops."
  Andrew pauses for a moment to take a long drink, and with a deep sigh continues. "Also, I mentioned previously to you that I really want to try and get these dirt bags shut down, because there have been so many children and their families hurt I feel like I need to do something! So while we're out dropping off children, I've contacted some people that I know throughout the systems, and we'll pick them up as we drop off children. I know we've already asked so much of you, and you've already reunited my family, but we could truly use your flying skills again. But I must warn you, I have a feeling that we will run into some trouble; there is no way we will stay out of these people's radar for long. So I don't want us to leave unless you feel prepared to fight off a few mercenaries. So, do you feel prepared?" ]]
  
  title[2] = "First Stop %s"
  text[2] = [["Wonderful, we should get ready and leave as soon as possible." Andrew says, with a look of both excitement and worry in his eyes. A few moments go by as he takes a drink and appears to be thinking, before he continues. "Our first stop is %s in the %  system, there is just one child that lives over there, and I know it's pretty far from here, but I have some connections over there as well. So we might as well begin our journey!"]]
  
  title[3] = "One Down, Six to Go"
  text[3] = [[As you land on the planet, a little girl standing no higher than your hip runs up to you and embraces your leg in a tight hug. She quickly releases your leg and runs off the ship to meet up with her parents. Almost as soon as the little girl left the ship, a couple well dressed men board your ship, both carrying strangely shaped cases. When Andrew sees them, he greets them in a tight embrace like good friends. It appears as if this is only the beginning of a very eventful adventure. 
  Andrew walks over to you, "well things are off to a nice start, our next stop is the %s system, on planet %s. Though from what these guys tell me, we will be running into some trouble, but nothing you can't handle, I'm sure." As you continue preparing your ship you can only hope Andrew is right about being able to handle it.]]
  
  title[4] = "A Little Trouble"
  text[4] = [[Upon landing, Andrew comes up to you and shakes your hand and compliments you on your fine flying. After dropping off the children and picking up a man and woman on this planet, you are feeling quite confident about your skills. Taking a look down at the list that Andrew gave you, noting your next stop, you prepare to head over to the %s system.]]
  
  title[5] = "Fine Fighting"
  text[5] = [[As you bring the ship down to a solid landing, a few children come up to you and thank you for bringing them home. You assure them it's not a problem at all, and wish them well on all of their endeavors.
  Before the children get off of the ship however, they exchange hugs with the remaining children and wave goodbye before they are reunited with their families. After the children depart from the ship, you notice that the remaining youngsters look quite glum. Supposing that they are missing their families, you go over to them and comfort them. But when you start assuring them that they will be home as soon as possible, and won't have to deal with this anymore, a boy runs off crying. As you feel bad for the child, a girl comes over to you and says "mister, we are all extremely grateful for your help, and while we all miss our families terribly, what really hurts is having to leave our new friends now. You see, we've been away from our families for a long time, and the only people we have who understand us totally are each other. It hurts when the only people we have left, also leave..." As you begin understand, the little girl leaves to comfort her friend and you get back to prepping the ship. Feeling even another level of sympathy for the children, you soberly prepare to get over to the %s system.]]
  
  title[6] = "Rough Stuff"
  text[6] = [[After the ship is all powered down, one of the adult passengers you have been gaining since the first stop comes over to you, saying "That was some more fine flying, pilot. It seems as we continue, the pirates keep sending better and better fighters to take you down, but you keep plugging away. It's really quite impressive, though if they keep sending tougher and tougher guys, you can be sure they aren't going to give in easy. It's quite noble of you, but if I were you I would be wondering how the heck they know where we are going to stop next. I'm not saying they have an inside man, but it's something you might want to consider."
  After the guy walks away, and you watch more of these people with strange cases board your ship, you are starting to become a bit suspicious of them. Nevertheless, seeing Andrew greet them in such a friendly manner you aren't sure what to think, and decide it best to hold off on confronting anyone about this for now. As it is, you have a job to do; you better head over to %s to drop off a few more kids.]]
  
  title[7] = "Broke a Sweat"
  text[7] = [[After that last battle out there, you decide it would probably be best to talk with Andrew about this. Upon confronting Andrew about how strange it is that these mercenaries are always a step ahead of us somehow, he replies, "I was hoping it wasn't going to be a big deal, so I hadn't mentioned this earlier. But after our first stop, I noticed that I was missing my spare memory card for our trip. I had assumed that it wasn't a big deal, and it would turn up eventually, you know how these things are! Apparently, it's becoming a bigger deal than I thought it would be. I suppose I should have told you earlier, but I thought these recent skirmishes were just coincidence... I guess I was wrong, I'm sorry." 
  You forgive Andrew and assure him you will be able to handle what is left to come. Though you really are beginning to doubt your abilities, and you can only hope that you truly will be able to handle what is left to come. Before you take too much time to worry over this, you might as well get over to %s.]]
  
  title[8] = "One More Stop"
  text[8] = [[As you land, you let out a sigh of relief. That last battle was a tough one, and based on the faces of your passengers, you can tell they are starting to doubt your flying skills too. But there is just one more stop to go, you can handle one more stop, and you make sure to look confident if not for the passenger's sake, at least for your own sanity. The last stop is %s in %s, then we can get back to %s and take a breather.]]
  
  title[9] = "Let's Go Home"
  text[9] = [[As you wave off the last child, you breathe a deep sigh of relief for finally getting all of these children returned to their respective homes. Your ship took a bit of a beating too, but all of the kids are finally home and you can head back to %s to get some well needed rest, as well as drop off Andrew and this new gang of his (yours?), to plan the next phase of this adventure.]]
  
  title[10] = "Rest and Planning"
  text[10] = [["Well %s," says Andrew as you stand outside of your ship, "you have shown some impressive flying skills out there and have been an invaluable help to those children. Now I know this isn't much, but the parents of these children, myself included, have pooled together a bit of money. I know this isn't a whole lot of money, it's enough for gas and maybe could help repay you for damages that were done to your ship. We know that a ship isn't cheap, nor was it easy for you to go into those battles recently. Like I said, I'm sorry it's not much, but it's at least a token of our appreciation."
  As Andrew extends his hand with the credit chip in it, you wonder if you should really take this money. After all, this is the money of the parents who had had their children taken from them, it seems like people should be giving them money, not you. But it's a token of their appreciation, and it would be rude not to take it.
  What should you do?]]
  
  tookmoneytitle = "Spend it Wisely"
  tookmoneytext = [["I'm sure you will put the money to good use," said Andrew, "but at a time like this buying a few drinks would be a good use. After all of that fighting, I wouldn't blame you one bit.
  "Nevertheless," Andrew continued, "the fighting doesn't stop here. After picking up all of these great men and women, I can assure you that we will come out on top, and this human trafficking ring will be shut down!" While Andrew is on the subject of these mysterious people you've been picking up, you ask him who exactly these people are. Andrew chuckles a bit and replies "Well, these men and women are all in a very special business, and they all have a very special set of skills that will come in handy now. That set of skills is, namely, killing people. These people, along with myself, belong to a group of people that train to defend themselves and others.
  "I suppose you're wondering why the heck if we're so good at killing people, that we're asking for more of your help. Well, as it happens, none of us are pilots in any shape or form, we can kill people in hand to hand and just about every other planetary form of fighting, but none of us can fly well. But as long as we have you, I'm not worried at all, what with your flying skills and all.
  "But for now, I must be running! I want to spend as much time as possible gathering information and planning the demise of those kidnappers. So as soon as you are ready to get to action, be sure to come back, and we'll be around!"]]
  
  refusedmoneytitle = "That's So Kind"
  refusedmoneytext = [["Wow, are you sure you don't want the credits?" Andrew exclaimed, "This is so kind of you to do! I will return the credits back to the parents right away.
  "Nevertheless," Andrew continued, "the fighting doesn't stop here. After picking up all of these great men and women, I can assure you that we will come out on top, and this human trafficking ring will be shut down!" While Andrew is on the subject of these mysterious people you've been picking up, you ask him who exactly these people are. Andrew chuckles a bit and replies "Well, these men and women are all in a very special business, and they all have a very special set of skills that will come in handy now. That set of skills is, namely, killing people. These people, along with myself, belong to a group of people that train to defend themselves and others.
  "I suppose you're wondering why the heck if we're so good at killing people, that we're asking for more of your help. Well, as it happens, none of us are pilots in any shape or form, we can kill people in hand to hand and just about every other planetary form of fighting, but none of us can fly well. But as long as we have you, I'm not worried at all, what with your flying skills and all.
  "But for now, I must be running! I want to spend as much time as possible gathering information and planning the demise of those kidnappers. So as soon as you are ready to get to action, be sure to come back, and we'll be around!"]]
  
  choice1 = "Take the credits"
  choice2 = "Refuse the credits"
  
  refusetitle = "Later then"
  refusetext = [[Andrew gives you a grim smile, saying "It's perfectly understandable, we don't want to set out until you feel prepared, because it would only put the children at risk if we were captured... or killed. But I'll be around when you feel ready!"]]
  
  --OSD messages
  osdtitle = "Return the Kids"
  osdmsg[1] = "Fly to the %s system and land on planet %s"
  osdmsg[2] = "Fly back home to the %s system and land on planet %s"
  
  --In-Flight pop-up messages
  flighttitle = "Making Friends"
  flightmsg[1] = [[After %s of flight, most of the kids have settled in, and have gotten to know each other. Many of the kids are from different systems, but they seem to be making friends all the same. It sometimes seems like people throughout the systems could take a lesson from these children.]]
  
  --Overlay messages
  omsgtxt = "Destroy the enemies!"
  
  --Mercenary broadcasts
  broadcast[1] = [[We aren't going to let you get away with this!]]
  broadcast[2] = [[The boss isn't too happy with you, and neither are we.]]
  broadcast[3] = [[I'll be so rich after I get the bounty that's on you!]]
  broadcast[4] = [[You're going to die, sucker!]]
  broadcast[5] = [[I bet you think you're hot stuff; well you soon will be, literally!]]
  
end

--TODO: Consider forcing the player to defeat the enemies in each system before landing, this might also cause need to re-balance all of the battles.

function create() 
  misn.setNPC("Andrew", "youngbusinessman") --TODO:Get a custom portrait for Andrew
  misn.setDesc(bar_desc)
end

function accept()
  if not tk.yesno(title[1], text[1]:format(player.name())) then
    tk.msg(refusetitle, refusetext)
    abort()
  else
    tk.msg(title[2]:format(sysname1), text[2]:format(planet1, sysname1))
  
  misn.accept()
  misn.setTitle(mistitle)
  misn.setReward(reward)
  misn.setDesc(description)
  misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname1, planet1)})
  
  misn_mark = misn.markerAdd(system.get(sysname1), "low")
  thekids = misn.cargoAdd("The Rescued Children", 0)
  
  dropkid1 = false
  time = time.get()
  
  lhook = hook.land("land1", "land")
  jhook = hook.jumpin("jumpin1", "jumpin")
  gasland = hook.jumpin("gas_jump", "jumpin")
  
  --there are 36 jumps total for the mission, so let's compensate for that *2, plus 100k
  gasmoney = 0
  end
end

function gas_jump()
  gasmoney = gasmoney + 600
end

function land1()
  if planet.cur() == planet.get(planet1) and not dropkid1 then
    tk.msg(title[3], text[3]:format(sysname2, planet2))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname2, planet2)})
    misn.markerMove(misn_mark, system.get(sysname2))
    hook.rm(lhook)
    lhook = hook.land("land2", "land")
    dropkid1 = true
    dropkid2 = false
    madefriends = false
  end
end

function land2()
  if planet.cur() == planet.get(planet2) and dropkid1 and not dropkid2 then
    tk.msg(title[4], text[4]:format(sysname3))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname3, planet3)})
    misn.markerMove(misn_mark, system.get(sysname3))
    hook.rm(lhook)
    lhook = hook.land("land3", "land")
    dropkid2 = true
    dropkid3 = false
  end
end

function land3()
  if planet.cur() == planet.get(planet3) and dropkid2 and not dropkid3 then
    tk.msg(title[5], text[5]:format(sysname4))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname4, planet4)})
    misn.markerMove(misn_mark, system.get(sysname4))
    hook.rm(lhook)
    lhook = hook.land("land4", "land")
    dropkid3 = true
    dropkid4 = false
  end
end

function land4()
  if planet.cur() == planet.get(planet4) and dropkid3 and not dropkid4 then
    tk.msg(title[6], text[6]:format(sysname5))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname5, planet5)})
    misn.markerMove(misn_mark, system.get(sysname5))
    hook.rm(lhook)
    lhook = hook.land("land5", "land")
    dropkid4 = true
    dropkid5 = false
  end
end

function land5()
  if planet.cur() == planet.get(planet5) and dropkid4 and not dropkid5 then
    tk.msg(title[7], text[7]:format(sysname6))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname6, planet6)})
    misn.markerMove(misn_mark, system.get(sysname6))
    hook.rm(lhook)
    lhook = hook.land("land6", "land")
    dropkid5 = true
    dropkid6 = false
  end
end

function land6()
  if planet.cur() == planet.get(planet6) and dropkid5 and not dropkid6 then
    tk.msg(title[8], text[8]:format(planet7, sysname7, home))
    misn.osdCreate(osdtitle, {osdmsg[1]:format(sysname7, planet7)})
    misn.markerMove(misn_mark, system.get(sysname7))
    hook.rm(lhook)
    lhook = hook.land("land7", "land")
    dropkid6 = true
    dropkid7 = false
  end
end

function land7()
  if planet.cur() == planet.get(planet7) and dropkid6 and not dropkid7 then
    tk.msg(title[9], text[9]:format(home))
    misn.osdCreate(osdtitle, {osdmsg[2]:format(homesys, home)})
    misn.markerMove(misn_mark, system.get(homesys))
    hook.rm(lhook)
    lhook = hook.land("land8", "land")
    dropkid7 = true
  end
end

function land8() -- TODO: make this choice have an effect on the fourth mission and the money the player earns then, so that the player will make significantly less money then than if they would have rejected this money.
  if planet.cur() == planet.get(home) and dropkid7 then
   credits = gasmoney + 100000 --100K plus money for gas.

   takemoney = tk.choice(title[10], text[10]:format(player.name()), choice1, choice2)
    
   if takemoney == 1 then
    tk.msg(tookmoneytitle, tookmoneytext)
    player.pay(credits)
   else
     tk.msg(refusedmoneytitle, refusedmoneytext)
   end
   misn.finish(true)
  end
end


function jumpin1()
  if system.cur() == system.get("Arcturus") and dropkid1 and not madefriends then
    hook.timer(1500, "making_friends")
  end
end

function making_friends()
  newtime = time.get() - time
  tk.msg(flighttitle, flightmsg[1]:format(newtime:str()))
  madefriends = true
  hook.rm(jhook)
  jhook = hook.jumpin("jumpin2", "jumpin")
end

function jumpin2() --3 hyenas - Goddard
  if system.cur() == system.get(sysname2) and dropkid1 and not dropkid2 then
    j2hye1 = pilot.addRaw("Hyena", "baddie_norun", planet.get("Geron"):pos() + vec2.new(500, 0), "Mercenary") [1]
    j2hye2 = pilot.addRaw("Hyena", "baddie_norun", planet.get("Geron"):pos() + vec2.new(510, 10), "Mercenary") [1]
    j2hye3 = pilot.addRaw("Hyena", "baddie_norun", planet.get("Geron"):pos() + vec2.new(520, 0), "Mercenary") [1]
    j2hye1:control()
    j2hye2:control()
    j2hye3:control()
    j2hye1:attack(player.pilot())
    j2hye2:attack(player.pilot())
    j2hye3:attack(player.pilot())
    j2hye1:rename("Pirate Mercenaries")
    j2hye2:rename("Pirate Mercenaries")
    j2hye3:rename("Pirate Mercenaries")
    
    hook.timer(1000, "j2cam")
    function j2cam()
      camera.set(j2hye2, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej2cam")
      function movej2cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j2hye3:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
    jhook = hook.jumpin("jumpin3", "jumpin")
  end  
end

function jumpin3() -- 2 hyenas, 1 sharks - Vlexon
  if system.cur() == system.get(sysname3) and dropkid2 and not dropkid3 then
    j3hye1 = pilot.addRaw("Hyena", "baddie_norun", planet.get("Phee"):pos() + vec2.new(0, 100), "Mercenary") [1]
    j3hye2 = pilot.addRaw("Hyena", "baddie_norun", planet.get("Phee"):pos() + vec2.new(10, 110), "Mercenary") [1]
    j3sha1 = pilot.addRaw("Shark", "baddie_norun", planet.get("Phee"):pos() + vec2.new(30, 110), "Mercenary")[1]
    j3hye1:control()
    j3hye2:control()
    j3sha1:control()
    j3hye1:attack(player.pilot())
    j3hye2:attack(player.pilot())
    j3sha1:attack(player.pilot())
    j3hye1:rename("Pirate Mercenaries")
    j3hye2:rename("Pirate Mercenaries")
    j3sha1:rename("Pirate Mercenaries")
    
    hook.timer(1000, "j3cam")
    function j3cam()
      camera.set(j3hye2, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej3cam")
      function movej3cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j3hye1:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
    jhook = hook.jumpin("jumpin4", "jumpin")
  end
end

function jumpin4() -- 2 sharks, 1 ancestor, 1 lancelot - Tarsus
  if system.cur() == system.get(sysname4) and dropkid3 and not dropkid4 then
    j4sha1 = pilot.addRaw("Shark", "baddie_norun", planet.get("Ginni"):pos() + vec2.new(120, 60), "Mercenary") [1]
    j4sha2 = pilot.addRaw("Shark", "baddie_norun", planet.get("Ginni"):pos() + vec2.new(130, 70), "Mercenary")[1]
    j4anc1 = pilot.addRaw("Ancestor", "baddie_norun", planet.get("Ginni"):pos() + vec2.new(140, 70), "Mercenary")[1]
    j4lan1 = pilot.addRaw("Lancelot", "baddie_norun", planet.get("Ginni"):pos() + vec2.new(150, 60), "Mercenary")[1]
    j4sha1:control()
    j4sha2:control()
    j4anc1:control()
    j4lan1:control()
    j4sha1:attack(player.pilot())
    j4sha2:attack(player.pilot())
    j4anc1:attack(player.pilot())
    j4lan1:attack(player.pilot())
    j4sha1:rename("Pirate Mercenaries")
    j4sha2:rename("Pirate Mercenaries")
    j4anc1:rename("Pirate Mercenaries")
    j4lan1:rename("Pirate Mercenaries")
    
    hook.timer(1000, "j4cam")
    function j4cam()
      camera.set(j4sha2, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej4cam")
      function movej4cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j4sha1:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
    jhook = hook.jumpin("jumpin5", "jumpin")
  end
end

function jumpin5() -- 1 shark, 2 lancelots - Ingot
  if system.cur() == system.get(sysname5) and dropkid4 and not dropkid5 then
    j5sha1 = pilot.addRaw("Shark", "baddie_norun", planet.get("Ulios"):pos() + vec2.new(100, 10), "Mercenary") [1]
    j5lan1 = pilot.addRaw("Lancelot", "baddie_norun", planet.get("Ulios"):pos() + vec2.new(150, 0), "Mercenary")[1]
    j5lan2 = pilot.addRaw("Lancelot", "baddie_norun", planet.get("Ulios"):pos() + vec2.new(160, 10), "Mercenary")[1]
    j5sha1:control()
    j5lan1:control()
    j5lan2:control()
    j5sha1:attack(player.pilot())
    j5lan1:attack(player.pilot())
    j5lan2:attack(player.pilot())
    j5sha1:rename("Pirate Mercenaries")
    j5lan1:rename("Pirate Mercenaries")
    j5lan2:rename("Pirate Mercenaries")
    
     hook.timer(1000, "j5cam")
    function j5cam()
      camera.set(j5lan1, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej5cam")
      function movej5cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j5sha1:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
    jhook = hook.jumpin("jumpin6", "jumpin")
  end
end

function jumpin6() -- 2 lancelots, 1 admonisher - Tau Prime
  if system.cur() == system.get(sysname6) and dropkid5 and not dropkid6 then
    j6lan1 = pilot.addRaw("Lancelot", "baddie", planet.get("Europea"):pos() + vec2.new(100, 40), "Mercenary") [1]
    j6lan2 = pilot.addRaw("Lancelot", "baddie", planet.get("Europea"):pos() + vec2.new(120, 50), "Mercenary") [1]
    j6adm1 = pilot.addRaw("Admonisher", "baddie", planet.get("Europea"):pos() + vec2.new(160, 50), "Mercenary")[1]
    j6lan1:control()
    j6lan2:control()
    j6adm1:control()
    j6lan1:attack(player.pilot())
    j6lan2:attack(player.pilot())
    j6adm1:attack(player.pilot())
    j6lan1:rename("Pirate Mercenaries")
    j6lan2:rename("Pirate Mercenaries")
    j6adm1:rename("Pirate Mercenaries")
    
    hook.timer(1000, "j6cam")
    function j6cam()
      camera.set(j6lan2, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej7cam")
      function movej7cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j6lan1:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
    jhook = hook.jumpin("jumpin7", "jumpin")
  end
end

function jumpin7() -- 1 lancelot, 1 vendetta, 1 admonisher - Cygnus
  if system.cur() == system.get(sysname7) and dropkid6 and not dropkid7 then
    j7lan1 = pilot.addRaw("Lancelot", "baddie", planet.get("Jaan"):pos() + vec2.new(100, 40), "Mercenary") [1]
    j7ven1 = pilot.addRaw("Vendetta", "baddie", planet.get("Jaan"):pos() + vec2.new(130, 40), "Mercenary") [1]
    j7adm1 = pilot.addRaw("Admonisher", "baddie", planet.get("Jaan"):pos() + vec2.new(160, 50), "Mercenary")[1]
    j7lan1:control()
    j7ven1:control()
    j7adm1:control()
    j7lan1:attack(player.pilot())
    j7ven1:attack(player.pilot())
    j7adm1:attack(player.pilot())
    j7lan1:rename("Pirate Mercenaries")
    j7ven1:rename("Pirate Mercenaries")
    j7adm1:rename("Pirate Mercenaries")
    
    hook.timer(1000, "j7cam")
    function j7cam()
      camera.set(j7ven1, true, 9000)
      overmsg = player.omsgAdd(omsgtxt, 7)
      hook.timer(5000, "movej7cam")
      function movej7cam()
	camera.set()
      end
      rndmsg = rnd.rnd(1,5)
      j7lan1:broadcast(broadcast[rndmsg], true)
    end
    hook.rm(jhook)
  end
end

function abort() -- TODO: consider adding some sort of penalty for aborting mission with children
  misn.finish(false)
end