---
layout: page
order: 4
title: Activities
permalink: /activities
---

Here shall be the many activities I take part in.

I may use tags. Let's brainstorm a bit.

- Teaching
- Service
- Service-Reviewer
- Service-ProgramCommittee
- Service-Chair
- Service-Organiser
- Research
- Research-Visit
- Research-Publication
- Research-Talk
- Research-Demonstration
- Research-Conference
- Funding
- Software
- ...

Stay tuned.

{% for act in site.activities reversed %}
<div class="panel panel-default">
<div class="panel-heading">
<a href="{{ act.url | prepend: site.baseurl }}"> {{ act.date | date: "%-d %B %Y" }} - {{ act.title }} </a>
</div>
<div class="panel-body" markdown="1">
{{ act.content }}
</div>
</div>
{% endfor %}

