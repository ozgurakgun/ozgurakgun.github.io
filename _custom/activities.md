---
order: 4
title: Activities
permalink: /activities
---

I have recently started making a small note for my noteworthy work related activities.

This list is not exhaustive and specifically it covers almost nothing from before late 2016.

<div class="wide_version">
    {% assign printed = nil %}
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
    {% assign printed = nil %}
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
