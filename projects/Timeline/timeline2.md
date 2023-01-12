---
title: "Timeline2"
slug: "timeline2"
layout: "page"
weight: 6
---
# Timeline2
<div id="timeline">
	<section id="timeline-all">
{%- assign timeline = site.data.timeline2 -%}
{% for object in timeline %}
	{%- assign release_list = object.releases -%}
	{% for separate_release in release_list %}
		{% assign temp = separate_release | sort %}
			{% assign final = final | concat: temp %}
	{% endfor %}
{% endfor %}
{% assign sorted_final = final | sort: "release date" %}
{% for object in sorted_final %}
<p>{{object}}</p>
{% endfor %}
</section>
</div>