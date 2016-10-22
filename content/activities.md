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
- Service/Reviewer
- Service/PC member
- Service/Chair
- Service/Organiser
- Research
- Research/Visiting Scholar
- Research/Publication
- Research/Talk
- Research/Demonstration
- Research/Attending Conference
- Funding
- Software
- ...

Stay tuned.

<ul>
{% for act in site.activities %}
  <li> <a href="{{ act.url | prepend: site.baseurl }}"> link </a> {{ act.content }} </li>
{% endfor %}
</ul>
