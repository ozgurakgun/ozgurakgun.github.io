---
order: 1
title: Home
permalink: /
---

<div class="jumbotron">


<div class="wide_version">

<div class="row" style="display:flex; align-items:center;">

<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" markdown="1">

# Welcome!

I am Özgür Akgün. You have reached my personal website.

I am a Lecturer at the
[School of Computer Science](http://www.cs.st-andrews.ac.uk),
[University of St Andrews](http://www.st-andrews.ac.uk).

You are very welcome to explore these pages.
Have a look at my
[latest publications](/publications),
[software development experience](/software), and
[recent activities](/activities).  
You can also [contact me](/contact) if you like.

</div> <!-- col -->

<div id="ozgur_profile_img_div" class="pull-right">
    <img src="/assets/burn.jpg"
         class="ozgur_profile_img img-responsive img-rounded"
         style="width:100%;"
         alt="A handsome looking photo of Özgür">
</div>

</div> <!-- row -->

</div> <!-- wide_version -->


<div class="container narrow_version" markdown="1">

# Welcome!

I am Özgür Akgün. You have reached my personal website.

<img src="/assets/burn.jpg"
     class="ozgur_profile_img img-responsive img-rounded center-block"
     style="width:70%;"
     alt="A handsome looking photo of Özgür">

I am a Lecturer at the
[School of Computer Science](http://www.cs.st-andrews.ac.uk),
[University of St Andrews](http://www.st-andrews.ac.uk).

You are very welcome to explore these pages.
Have a look at my
[latest publications](/publications),
[software development experience](/software), and
[recent activities](/activities).  
You can also [contact me](/contact) if you like.

</div> <!-- narrow_version -->


</div>



<script type="text/javascript">
    $(function() {
        var h = new Date().getHours()
        if (h % 2 == 0) {
            $(".ozgur_profile_img").attr("src", "/assets/lanark.jpg")
        } else {
            $(".ozgur_profile_img").attr("src", "/assets/burn.jpg")
        }
        $(".ozgur_profile_img").show()
    });
</script>

