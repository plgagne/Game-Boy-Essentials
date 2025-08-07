---
title: "Conker’s Pocket Tales"
description: "The Forgotten Game Inside the Forgotten Game"
slug: "dmg-acre"
release-date: "1999-06-08"
release-year: "1999"
release-month: "06"
publication: ""
tags: [book4]
developers: "Rare"
---
Backward compatibility is popular with console manufacturers these days. You can buy older games in Sony or Microsoft's online stores, or just pop in an older disc from a PS4 or Xbox One and expect the game to run flawlessly on current consoles. This feat can be achieved because the PS5 and Xbox Series are upgraded versions of their predecessors, with AMD processors and graphic chips using a superset of the functionnality of the previous consoles. This means that a PS5 can seamlessly reduce its capabilities to become a PS4 (or a PS4 Pro) and run games flawlessly. While backward compatibility is now considered mundane, and players know what to expect when you tell them a console is *backwards compatible*, it was absolutely not the case in the early 90s. When the Game Boy Color was announced, Nintendo had two use cases they needed to explain. First, the Game Boy Color was fully backwards compatible with every Game Boy cartridge. That part was easy, but Nintendo were fighting against their own headwinds. After all, they were the ones who released the Super NES without any compatibility with the plain NES. To solve this problem, they called the console the Game Boy Color. Using the word Color was genius. It does not imply a new version of the console, it implies colors. Obviously. How they wrote it was genius as well. They kept the old wordmark, but added a completely bespoke Color wording right next to it. This again implied a color Game Boy, not an incompatible console like the Super NES.

{% comment %}
{% include figure.html filename="game-boy-color-wordmark" type="art" figcaption="The Game Boy Color wordmark." %}
{% endcomment %}

The second use case was far more complicated to explain. Nintendo had made it possible for games to be forward compatible. Forward compatibility means that a system will accept games made for a newer version of the hardware. This meant that a game with specific colour code for Game Boy Color could still play on the regular Game Boy. 

To explain this complex functionality, those forward compatible cartridges came in a black plastic housing that was the exact same shape as the original grey cartridges. This told people that the game inside was still a Game Boy game since the tradition was already established that a new console meant a new cartridge shape. Six months after the console’s release, Nintendo introduced a new cartridge shape when they released the first exclusive Game Boy Color title. They staggered the release of those two game types to simplify messaging. You first explain the console's forward compatibility, and six months later you can justify exclusive Color games that are not compatible with the original Game Boy.

They also explained each game's compatibility on the box's back. For exclusive Game Boy Color titles, a small triangle on its front proclaimed that it was *Only For Game Boy Color*. That triangle disappeared around 2001, when Nintendo clearly felt like it didn't matter anymore. *Pokémon Crystal* doesn't have the triangle, even though it is a Color exclusive title. In Japan they never used that little triangle, probably because locked cabinets in stores weren't common and people could easily manipulate a box and read its back.

Nintendo succeeded at communicating the message well, if a bit too well. The messaging was so succesful that people confidently believe falsehoods about black cartridges. That's why *Conker's Pocket Tales* is essential. Its weird technical workings allow us to really understand how backwards compatibility works on the Game Boy Color. After you've read my article, you will no longer believe falsehoods about black cartridges.

## More

*Conker's Pocket Tales* has been thoroughly eclipsed by the irreverent N64 classic *Conker's Bad Fur Day*. People might remember that Conker first appeared in *Diddy Kong Racing*, and that Rare then tried making a game featuring the little squirrel. The developers got tired of the premise and changed their happy-go-lucky squirrel collect-a-thon into a foul-mouthed romp. Most people will be clueless to the fact that while the cutesy N64 collect-a-thon starring Conker was abandoned, the Game Boy version was indeed finished and released! That's the lineage of *Conker's Pocket Tales*; it was the tie-in Game Boy game for the release of *Twelve Tales: Conker 64*. So its forgotten because the game it should have accompanied never saw the light of day. What's even more forgotten is the other game inside the game.

The most common way people will play *Conker's Pocket Tales* in 2024 is by pirating it on a website somewhere. They'll play it directly in the browser on some fly-by-night website illegally offering roms in a Javascript emulator. If you play *Conker's Pocket Tales* this way, or with any device that is not an original Game Boy or a Super Game Boy, you will never realize that the game is unique amongst all Game Boy titles. If you're not aware that it's possible to get different results depending on your Game Boy type, you won't know that there are two games inside one signle cartridge. Here's the very first screen of the first level to show you what I mean.

{% comment %}
<div class="gallery">
{% include figure.html filename="" type="gb" figcaption="Game Boy" %}
{% include figure.html filename="" type="gb" figcaption="Game Boy Color" %}
</div>
{% endcomment %}

The game starts you in a completely different room? What's happening? There are two versions of *Conker's Pocket Tales*. A Game Boy version, and a Game Boy Color version. I do not mean that one is in black and white, and the other is in colour like almost every black cartridge. Or that some content is only accessible on Game Boy Color, like the Color Dungeon in *Link's Awakening DX*. I mean that the controls are similar, the graphics are confusingly similar, but that the levels are completely different giving you two different games. The easiest way I can describe it is that the cartridge features both the original Game Boy game and its Color sequel inside the same cartridge. Which version you get is not dependent on a menu; it depends on the system you're using.

*Conker's Pocket Tales* is a black cartridge, which means it's a game that will play on Game Boy and Game Boy Color. I hope I'm not going to surprise you when I tell you that the plastic housing has no bearing on how that promise is achieved. Everything happens inside the cartridge on the printed circuit, with the chips containing the code that decides what happens when you turn on your Game Boy. Programmers were able to write code that checked which kind of Game Boy was running the game. The programmer could then do whatever they wanted based on which console was playing their game. This is how *The Legend of Zelda: Link's Awakening DX* was able to give access to the new Color Dungeon when playing on, you guessed it, a Game Boy Color. The game itself knew if it was running on a classic grey brick, and would not give you access to the Color Dungeon.

Now imagine the cartridge making that dungeon decision at the very start of the game. If you're on a Game Boy, you can access the Game Boy game. If you're on a Game Boy Color, you can access the Game Boy Color game. That's how *Conker's Pocket Tales* works, and is not how most black cartridges work. How do the overhwelming majority of black cartridges work? Black cartridges are Game Boy games with extra code allowing a Game Boy Color to colour them properly. All those black cartridges that every Game Boy collector is adamant are not a part of their complete Game Boy collection? Those are all Game Boy games. They all use the ID code of the Game Boy, DMG. None of those black cartridges access the extra RAM of the Game Boy Color, nor do they use the doubled processor speed. The fact that they're backwards compatible even limits the number of colours they can display when played on a Game Boy Color. Sprites and tiles can choose amongst all the 56 colours of the console, but can only use 4 colours per sprite or tile.

*Conker's Pocket Tales* is a weird asterisk that doesn't fit in the common mold, instead choosing to present confusingly similar but still different content to both Game Boy types. Let's explore both versions in turn.

## The GB version
- The game has no continue. You die, you go back to your last save.
- Combat? What combat?
- Nothing redeemable. It's horrible.
- The big walnut says that you now have to beat their game. And then you're thrown to a game of aiming at targets. There are no connections to anything, it just happens. In that moment, I never felt more like the developers directly talking to me. Now play this minigame!
- Which door can you walk through? Guess!
{% include figure.html type="gb" filename="doors" %}
- You're just going from one thing to the other without anything interesting happening. The trees are all the same, the layout has nothing interesting. The characters just straight up tell you what to do.
- I can't justify playing any more of this boring game; let's switch to the Game Boy Color version.
- Uses the Donkey Kong Land sound effects.

Now let's switch to a Game Boy Color to try the other version of the game.

## A Completely Incompatible Save System

If you upgrade from a Game Boy to a Game Boy Color you are presented with this screen:
{% include figure.html filename="save" type="gb" %}

## My White Whale
I want to know if there exists a black cartridge that uses the extra processor speed or the increased memory size  of the Game Boy Colour.
