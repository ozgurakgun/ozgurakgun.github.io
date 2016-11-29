---
order: 4
title: Activities
permalink: /activities
---

I have recently started making a small note for my work related activities.

I intend to add my important past activities here as well, but it will probably take time.

I attach tags to individual activity entries. The following is a list of all such tags.

<ul>
{% assign items_sorted = site.tags | sort: 'tag' %}
{% for item in items_sorted %}
<li><a href="{{ item.url | prepend: site.baseurl }}">{{ item.face }}</a></li>
{% endfor %}
</ul>

The following is a list of all activity entries.

<dl class="dl-horizontal">
{% for post in site.activities reversed %}
<dt>{{ post.date | date: "%-d %B %Y" }}</dt>
<dd><a href="{{ post.url }}">{{ post.title }}</a></dd>
{% endfor %}
</dl>

