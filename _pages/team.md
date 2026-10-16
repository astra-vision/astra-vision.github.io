---
layout: page
title: Team
permalink: /team/
description: 
nav: true
nav_order: 1
---

<!-- pages/team.md -->
{% assign members = site.data.team | where_exp:"item","item.alumni != true" | sort_natural: "lastname" %}
{% assign alumni = site.data.team | where_exp:"item","item.alumni == true" | sort_natural: "lastname" %}
{% assign dated_alumni = alumni | where_exp: "item", "item.alumni_date != nil and item.alumni_date != ''" | sort: "alumni_date" | reverse %}
{% assign undated_alumni = alumni | where_exp: "item", "item.alumni_date == nil or item.alumni_date == ''" %}
{% assign alumni = undated_alumni | concat: dated_alumni %}

<div class="team">
{% for member in members %}
    {% include team/member.html member=member %}
{% endfor %}
</div>

<h2 class="alumni">Alumni</h2>
<ul class="alumni-list">
{% for member in alumni %}
    <li>
        {% if member.url and member.url != "" %}<a href="{{ member.url | escape }}" target="_blank" rel="noopener noreferrer">{{ member.firstname | escape }} {{ member.lastname | escape }}</a>{% else %}{{ member.firstname | escape }} {{ member.lastname | escape }}{% endif %}{% if member.position and member.position != "" %}, {{ member.position | escape }}{% endif %}{% if member.alumni_now and member.alumni_now != "" %} <span class="nowat">(now {{ member.alumni_now }})</span>{% endif %}
    </li>
{% endfor %}
</ul>
