---
order: 4
title: Activities
permalink: /activities
---

Note: I have recently started making a small note for each of my work related activities.

This list is not exhaustive and specifically it covers almost nothing from before late 2016.

<!-- I intend to add my important past activities here as well, but it will probably take time. -->

<!-- <ul>
{% assign items_sorted = site.tags | sort: 'tag' %}
{% for item in items_sorted %}
<li><a href="{{ item.url | prepend: site.baseurl }}">{{ item.face }}</a></li>
{% endfor %}
</ul> -->

The following is a list of all entries.


<div class="wide_version">
    {% assign printed = [] %}
    <table class="table">
    {% for post in site.activities reversed %}
        {% assign thisYear = post.date | date: "%Y" %}
        {% unless printed contains thisYear %}
            <tr style="border:none">
                <th style="border:bottom; text-align:center" colspan="2">{{ thisYear }}</th>
            </tr>
        {% endunless %}
        {% assign printed = printed | append: thisYear %}
        <tr style="border:none">
            <th style="border:none; text-align:right; white-space:nowrap">{{ post.date | date: "%-d %B %Y" }}</th>
            <td style="border:none"><a href="{{ post.url }}">{{ post.title }}</a></td>
        </tr>
    {% endfor %}
    </table>
</div>

<div class="narrow_version">
    {% assign printed = [] %}
    <table class="table">
    {% for post in site.activities reversed %}
        {% assign thisYear = post.date | date: "%Y" %}
        {% unless printed contains thisYear %}
            <tr style="border:none">
                <th style="border:bottom; text-align:center" colspan="2">{{ thisYear }}</th>
            </tr>
        {% endunless %}
        {% assign printed = printed | append: thisYear %}
        <tr style="border:none">
            <th style="border:none; text-align:left; white-space:nowrap">{{ post.date | date: "%-d %B %Y" }}</th>
        </tr>
        <tr>
            <td style="border:none"><a href="{{ post.url }}">{{ post.title }}</a></td>
        </tr>
    {% endfor %}
    </table>
</div>
