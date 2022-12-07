---
title: "Game Name"
description: "Article Title"
slug: "dmg-"
release-year: ""
release-month: ""
publication-order: 
developers: "Developers"
---
# {{ page.title }}

- European release in month year
- North American release in
- Japanese release in
- Published by Publisher
- Developed by {{ page.developers }}

{% include figure.html type="boxart" figcaption="Write a witty comment to accompany the boxart." %}

## {{ page.description }}

{% include figure.html type="gb" class="float left" %}
Always start the article with an evocative screenshot on float left.

## Pictures

Every image is to be used inside a figure. !fig will autocomplete into what you need. Note that it will increment the name of the object by one for each one on the page with the following naming convention:

(slug)-(number).(filename)

Here's an explanation of what all the types and classes do and when to use them.

## Types

- boxart
- boxart-png
- gb (Game Boy PNG screenshots in native 160x144 resolution)
- pixel (any PNG game screenshot that is not strictly 160x144)
- art
- art-png
- audio

## Objects

You can use !object to autocomplete. You can use this for the following media types. The same numbering used for images is used for objects.

- pdf
- video (You need to use a file with an MP4 filename)
- audio (You need to use a file with an MP3 filename)

## Classes

- float (will set figure to float, needs to specify which side of the paragraph)
- left
- right

## Figcaption

It needs to be removed if you are not putting text underneath the image otherwise it will create unwanted padding.

## Gallery

You can also build a gallery by putting your declarations inside a div. Do not forget to include gallery as a class. Remember that galleries are an either/or proposition: either they all have figcaption or none of them do (this is a LaTeX constraint).

~~~ html
<div class="gallery-container">
{% include figure.html type="gb" class="gallery" %}
{% include figure.html type="gb" class="gallery" %}
</div>

<div class="gallery-container">
{% include figure.html type="gb" class="gallery" figcaption="" %}
{% include figure.html type="gb" class="gallery" figcaption="" %}
</div>
~~~

## Links

[links](articles/dmg-yt)

## Quote

<blockquote>
The review could start with a quote. You know, from a famous guy.
<p>— <cite><a href="http://www.imdb.com/character/ch0000672/quotes">Crazy hunch-backed old guy</a></cite></p>
</blockquote>

## Block Quotes

> Iwata: Tezuka-san and Nakago-san, you two, along with Shigeru Miyamoto-san were known as the *Golden Triangle*, or the *Kansai Manzai (comedy) Trio*. And with Miyamoto-san as the central creator, you developed the original *The Legend of Zelda* game while you were working on the first *Super Mario Bros.* But his involvement with *The Legend of Zelda: Link’s Awakening*, the first handheld *Zelda* game, wasn’t that extensive, was it?
>
> Tezuka: No.

## Table

| First Header | Second Header | Third Header | Fourth Header |
|-|-|-|-|
| First row     | Data          | Very long data entry | Last |
| Second row    | **Cell**      | *Cell*               ||
| Third row     ||||

Careful with tables, they need to be surrounded by lines on both the top and bottom to properly parse. And Kramdown tends to toy with them uselessly, always check that they are okay. LaTeX will only support a manual declaration of the number of columns. All the tables you have used previously are four columns wide, and so you have coded LaTeX to properly parse a table with that width.

## Bullet-point List

- item 1
- item 2
- item 3

## Numbered list

1. item 1
2. item 2
3. item 3
