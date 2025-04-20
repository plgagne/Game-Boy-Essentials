---
title: "Home"
slug: "index"
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
{% assign sorted = site.articles | sort: "publication" | reverse %}
{% for article in sorted %}
  {% include game.html %}
{% endfor %}
</section>
<section class="list_release">
{% assign gamerelease = true %}
{% assign first_sort = site.articles | sort: "title" %}
{% assign sorted = first_sort | sort: "release-date" %}
{% assign year_steps = (1989..2007) %}
{% for year_stepper in year_steps %}
  {% assign year_written = false %}

  {% comment %} Step through all releases {% endcomment %}
  {% for article in sorted %}
    {% assign year_integer = article.release-date | date: "%Y" %}
    {% assign year_integer = year_integer | plus: 0 %}

    {% comment %} Stop if the year is larger than the position of the stepper {% endcomment %}
    {% if year_integer > year_stepper %}
      {% break %}
      {% else %}

      {% comment %} Start parsing if the year is correct {% endcomment %}
      {% if year_stepper == year_integer %}

        {% comment %} Open year HTML tags {% endcomment %}
        {% if year_written == false %}
          <div class="list_year" id="year{{ year_integer }}">{{ year_integer }}</div>
          {% assign year_written = true %}
        {% endif %}
        {% include game.html %}
      {% endif %}
    {% endif %}
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