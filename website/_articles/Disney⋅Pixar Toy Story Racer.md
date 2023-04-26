---
title: "Disney⋅Pixar Toy Story Racer"
description: "You Are a Child’s Plaything!"
slug: "cgb-bt5e"
redirect_from:
  - /2001/cgb-bt5e.html
release-date: "2001-02-01"
release-year: "2001"
release-month: "02"
publication: "2018-02-21"
tags: [book2]
developers: "Tiertex Design Studios"
---
# {{ page.title }}

- North American release in February 2001
- European release in March 2001
- Never released in Japan
- Published by Activision
- Developed by {{ page. developers }}

{% include figure.html type="boxart" figcaption="A Technical Curio in Cheap Clothing. Sorry about the price and ad on the box art. With this obscure a game, that’s the best I could find." %}

## {{ page.description }}

{% include figure.html type="gb" class="float left" %}
*Toy Story Racer* is a sham. It’s visually impressive but you won’t want to play it for more than ten minutes. However, those ten minutes are essential. You’ll be able to see the crazy stuff developers were doing on Game Boy by the end of its **very** long life. Stuff they **never should have released** because it wasn’t a good concept, but did anyway because it was still going to make money no matter what they released.

## Emulation

{% include figure.html type="gb" class="float right" %}
I first got acquainted with *Toy Story Racer* through emulation back when it was first released in 2001. I first came upon the rom of *Toy Story Racer* while the game was still in stores. By 2001, emulators for the Game Boy Color were mainstream; any kid could figure out how to download one and find a bunch of roms to play on a Windows PC. This was a very strange but understandable situation. The Game Boy Color was a low-power, simple machine based on 70s technology. This made it possible to emulate it with the humble PC hardware of the early 2000s **while it was still sold**. This was also the case for the Game Boy Advance, which was emulatable at least a year after its release even though it used a much more powerful ARM-based CPU. It happened to other consoles as well. The PlayStation, N64, and Dreamcast, for example, all had to live with emulation while they were still commercial concerns.

{% include figure.html type="gb" class="float left" %}
However, emulators were far from perfect. Games like *Toy Story Racer* that abused the system in weird ways to achieve strange effects failed to run on emulators of the day. I’ll always remember finding the rom of *Metal Gear Solid* for Game Boy Color two weeks after the game came out. I was so excited that I could play a thirty-dollar game for free. Unfortunately, the emulator would soft-lock when you reached the first elevator of the game. Was it just an emulator problem or a voluntary anti-piracy measure? Since emulators were taking programming shortcuts to achieve reasonable playing speeds, developers could write specific code that would run on Game Boy but stump emulators. All those shortcuts are gone from current Game Boy emulators; even the dingiest emulators feature 100% compatibility with commercial releases. Whatever the case may be, I promptly bought the game on Amazon.ca (in 2001!) after I had tried my rom with every GBC emulator I knew about. I guess the pirated rom was a very successful demo for me. *Toy Story Racer* suffered a different fate than *MGS*. It was interesting enough that I dug around the internet for a rom and downloaded it with a very slow 56k phone connection. But it wasn’t interesting enough that I bought the cartridge once I realized no emulator could properly play it. It stayed a unicorn; seldom seen but forever a dream. But a crappy unicorn it turns out to be. A one-trick pony in fact. The game is a 3D racing game at first glance, but a complete bamboozle after a minute of scrutiny. I mean, they can’t do a 3D racer on Game Boy Color for real, right? They have to cheat somewhere, right?

## A Lying Game

{% include figure.html type="gb" class="float right" %}
They certainly did. It uses simple pre-rendered backgrounds that it cycles through as quickly as the game can manage, creating the very crappy illusion that you are racing in locations featured in *Toy Story*. There’s a reason nobody else did this on any other console. First, there’s the problem of how quickly you can redraw the background. The Game Boy’s graphics processor is custom-built to push background elements that scroll and sprites that move around freely. It abuses the system’s graphics capabilities if instead of putting a static background in graphics memory and then moving it around, you push a different background to the graphics memory as soon as the previous one finished displaying. The Game Boy Color was not engineered to change to a completely different background every frame. But the point is moot because every background needs to be kept inside the cartridge as a picture, and that takes a lot of space fast! They simply had no space on the cartridge to do complex, impressive track graphics. So they obviously used tricks to reduce the memory footprint of their backgrounds by using simple colours and shapes, and repeating track segments, since cartridge space is at such a premium on Game Boy. The worst of those tricks is the tracks’ frame rate; the game changes the background at most 12 times a second and slows down the number of frames per second when your kart is not at full speed. It might have technically been able to manage a faster framerate but the slower your frame rate, the less images you need in memory. So they reduced the frame rate, repeated the same sections of the tracks *ad nauseam*, and ended up with something more akin to a photo montage than a racing game. But the second problem is what truly kills the game. Since the backgrounds are pre-rendered and displayed statically one after the other, it destroys any connection between the track and the karts. The only interaction you can have with the track is how fast it advances. Your character sprite is strictly going left and right on top of the track, and depending on where you are the game will push you left or right to **try** to establish a connection between the track and the character. It doesn’t work. Your sprite has no shadow, completely divorcing him from the background. That one could have easily been solved by adding a little dash of black. The big unsolvable problem is that your character’s angle is irreconcilable with the angle of the track.

There’s no way around it; strictly following a track and forcing you to steer left and right just does not work logically. A 2D, behind the vehicle racing game like *Out Run* uses the same point of view as this game but will twist and turn its track in accordance with what you’re doing. That can happen because *Out Run*’s environment is not pre-rendered; it is less visually complex but it’s reactive.

{% include figure.html type="pixel" figcaption="This is a picture from *Top Gear 2* on SNES which uses the same basic design philosophy as *Out Run*." %}

There are multiple ways to achieve a *behind the car* effect, but ultimately you are using 2D tiles in inventive ways. *Toy Story Racer* cannot do anything else but try and pretend like its parlour trick has an impact on your kart. In a certain portion of the track, let’s say the left third makes you spin if you’re there because there’s an obstacle, let’s say a door. Or this portion pushes your character to the left because the track is turning right, forcing you to counterbalance. You cannot shake the feeling that you’re interacting with pretend obstacles; as if you’re moving a toy kart back and forth on top of a TV during a race, because that’s basically what the game is.

## Conclusion

Why did they do it? Why didn’t they just do an overhead view like all the other racing games on Game Boy? Because they could. I’ve already talked about the *I Can’t Believe It’s Game Boy* category of games in my [*Heroes of Might & Magic*](/articles/cgb-auhe) article. Those games that came around during the last two years of the console’s life that made no sense on Game Boy yet existed. And some of them were even good! Those games were clearly the results of developers pushing a very well-understood system to its peak of functionality; to me it feels like they were flexing their programming muscles, showing off how far they could go.

The people at Tiertex Design certainly hoped it would differentiate them from *Wacky Races* or *Mickey’s Speedway USA*. I mean it definitely did, I’m talking about their game now. Did it sell better because of it though? I doubt it hurt, I doubt it helped. The Game Boy Color was still riding on the coattails of *Pokémon* mania and the risk/reward ratio seemed skewed in favour of licensed crap for kids. If your licensed crap had a crappy trick up its sleeve, why not give it a try? That’s the wonderful element of this game for me; they didn’t merely try something crappy, they shipped it to stores! I’m sure they weren’t the first developers to try a pre-rendered background for a racing game, but because they tried it on the Game Boy Color in 2000, the market was crazy enough that they could finish their attempt and put it on the market. After *can we technically make it* comes a second question, *is it fun*, and the answer to that question was a resounding no.
