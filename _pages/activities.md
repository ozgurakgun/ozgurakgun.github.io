---
layout: page
order: 4
title: Activities
permalink: /activities
---

I have recently started making a small note for my work related activities.

I intend to add my important past activities here as well, but it will probably take time.

I attach tags to individual activity entries. The following is a list of all such tags.

{% assign items_sorted = site.tags | sort: 'tag' %}
{% for item in items_sorted %}
- [{{ item.face }}]({{ item.url | prepend: site.baseurl }})
{% endfor %}

The following is a list of all activity entries.

{% for post in site.activities %}
- {{ post.date | date: "%-d %B %Y" }}: <a href="{{ post.url }}">{{ post.title }}</a>
{% endfor %}

