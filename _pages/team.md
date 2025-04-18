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

<div class="team">
{% for member in members %}
    {% include team/member.html member=member %}
{% endfor %}
</div>

<!-- display Alumni in their data listing order -->
<!-- could not manage to sort by alumni_date since Liquid does not allow modifying object w/o use of a plugin -->
<h2 class="alumni">Alumni</h2>
<div class="team alumni">
{% for member in alumni %}
    {% include team/member.html member=member %}
{% endfor %}
</div>