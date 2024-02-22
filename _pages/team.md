---
layout: page
title: Team
permalink: /team/
description: 
nav: true
nav_order: 1
---

<!-- pages/team.md -->
<!-- sort active members -->
{% assign names_sorted = "" | split: ',' %}
{% for member in site.data.team %}
  {% if member[1].alumni != true %}
    {% assign names_sorted = names_sorted | push: member[0] %}
  {% endif %}
{% endfor %}
{% assign names_sorted = names_sorted | sort_natural %}

<div class="team">
{% for name in names_sorted %}
  {% assign member = "" | split: ',' | push: name | push: site.data.team[name] %}
  {% include team/member.html member=member %}
{% endfor %}
</div>

<!-- display Alumni in their data listing order -->
<!-- could not manage to sort by alumni_date since Liquid does not allow modifying object w/o use of a plugin -->
<h2 class="alumni">Alumni</h2>
<div class="team alumni">
{% for member in site.data.team %}
  {% if member[1].alumni == true %}
    {% include team/member.html member=member %}
  {% endif %}
{% endfor %}
</div>