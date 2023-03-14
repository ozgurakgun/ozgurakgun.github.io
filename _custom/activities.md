---
order: 4
title: Activities
permalink: /activities
---

Here you will find a list of activities that I have been engaged in lately.

I always think it's a good idea to maintain a page like this, but I am not very good at remembering to update it. So, while this list is not comprehensive, I believe it is representative and it shows a good coverage of the kind of activities I like to do.

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
