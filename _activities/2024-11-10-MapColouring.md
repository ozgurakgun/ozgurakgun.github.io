---
title: "Map colouring demo"
tags:
- Outreach
- Research
- Research-Demonstration
---

Every now and again I make small demos to use in teaching, outreach events, etc.

I rarely advertise these other than by giving people direct links where needed. Before today I had 3 such demos on this site: [kmeans](https://ozgurakgun.github.io/demos/kmeans/), [maze](https://ozgurakgun.github.io/demos/maze), [pow](https://ozgurakgun.github.io/demos/pow).

None of these demos use an actual constraint solver.

I developed a new demo this weekend for the [map colouring problem](https://ozgurakgun.github.io/demos/map/). This one does use conjure, via the [conjure as a service](https://github.com/conjure-cp/conjure-aas) project. The idea is to give people a blank canvas on which they draw a few paths. We then detect regions, extract a neighbourhood graph and colour this graph using CP. It is, of course, a simple problem to solve. Though I find people find this result unintuitive and when they first hear about it they have a tendency to try to construct a map that will require 5 colours. A bit like [the pickle gambit](https://www.youtube.com/watch?v=5pwG6RLCdoc) in that episode of Curb Your enthusiasm.

If you try hard enough I am sure you can break this demo - though I did put it through some rigourous *monkey testing* before releasing it.


<center>
    <img src="/files/OzanMapColouring.jpg"
         class="img-responsive img-rounded"
         style="height: 540px"
         alt="Ozan testing the map colouring demo">
</center>

There are a few other demos on the [conjure-cp demos](https://conjure-cp.github.io/demos/) page, those are developed by students. I particularly like the Task Allocation one and use it in my teaching.
