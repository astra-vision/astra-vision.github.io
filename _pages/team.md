---
layout: page
title: Team
permalink: /team/
description: 
nav: true
nav_order: 1
---

<!-- pages/team.md -->
{% assign members_sorted = "" | split: ',' %}
{% for member in site.data.team %}
  {% assign members_sorted = members_sorted | push: member[0] %}
{% endfor %}
{% assign members_sorted = members_sorted | sort_natural %}

<div class="team">
{% for name in members_sorted %}
  {% assign member = "" | split: ',' | push: name | push: site.data.team[name] %}
  {% include team/member.html member=member %}
{% endfor %}
</div>