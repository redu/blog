$(function() {
    $("body").noisy({
        "intensity": 1,
        "size": "400",
        "opacity": 0.079,
        "fallback":"/images/t-noisy.png",
        "monochrome": true
    }).css("background-color", "#e6e6e6");
});

$(document).ready(function(){
  $(".about-us li:gt(4)").hide();

  $(".stop-here").click(function(){
    $(".about-us li:gt(4)").slideDown();
  });
});
