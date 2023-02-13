---
title: "Home"
slug: "index"
redirect_from:
  - /main.html
layout: "main"
weight: 1
---
<input type="radio" id="pub" name="grouplist" checked="checked">
<input type="radio" id="rel" name="grouplist">
<label id="publabel" for="pub"><span>Article Publication</span></label>
<label id="rellabel" for="rel"><span>Earliest Release Date</span></label>
<section id="articlepub">
{%- assign articlepub = true -%}
{%- assign sorted = site.articles | sort: "publication" | reverse -%}
{%- for article in sorted -%}
  {%- include game.html -%}
{%- endfor -%}
{%- assign articlepub = false -%}
</section>
<section id="gamerelease">
{%- assign gamerelease = true -%}
{%- assign articles_grouped = site.articles | group_by: 'release-year' -%}
{%- assign sorted = articles_grouped | sort: 'name' -%}
{%- for group in sorted -%}
  <div class="year" id="year{{ group.name | round }}">
  {{- group.name | round -}}
  </div>
  {%- assign sorting = group.items | sort: 'release-month' -%}
  {%- for article in sorting -%}
    {%- include game.html -%}
  {%- endfor -%}
{%- endfor -%}
{%- assign gamerelease = false -%}
<script>
var imgs = document.getElementsByClassName('dmg-apee');
for (var i = 0; i < imgs.length; i++) {
  var num = Math.floor(Math.random() * 2 + 1);
  imgs[i].src = '/assets/dmg-apee/dmg-apee-start-' + num + '.png';
}
</script>