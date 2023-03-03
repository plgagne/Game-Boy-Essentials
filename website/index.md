---
title: "Home"
slug: "index"
redirect_from:
  - /main.html
layout: "main"
weight: 1
---
<input class="list_input" type="radio" id="pub" name="grouplist" checked="checked">
<input class="list_input" type="radio" id="rel" name="grouplist">
<label class="list_labelpublication" for="pub">
  <span class="list_span">Article Publication</span>
</label>
<label class="list_labelrelease" for="rel">
  <span class="list_span">Earliest Release Date</span>
</label>
<section class="list_publication">
{% assign articlepub = true %}
{% assign sorted = site.articles | sort: "publication" | reverse %}
{% for article in sorted %}
  {% include game.html %}
{% endfor %}
{% assign articlepub = false %}
</section>
<section class="list_release">
{% assign gamerelease = true %}
{% assign articles_grouped = site.articles | group_by: 'release-year' %}
{% assign sorted = articles_grouped | sort: 'name' %}
{% for group in sorted %}
  <div class="list_year" id="year{{ group.name | round }}">
  {{- group.name | round -}}
  </div>
  {% assign sorting = group.items | sort: 'release-month' %}
  {% for article in sorting %}
    {% include game.html %}
  {% endfor %}
{% endfor %}
{% assign gamerelease = false %}
<script>
var imgs = document.getElementsByClassName('dmg-apee');
for (var i = 0; i < imgs.length; i++) {
  var num = Math.floor(Math.random() * 2 + 1);
  imgs[i].src = '/assets/dmg-apee/dmg-apee-start-' + num + '.png';
}
</script>