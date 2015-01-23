$(document).ready(function(){
  $("#lancerS").click(function(){
    if($("#lancerC").hasClass("hidden")){
      $("#supporterC").addClass("hidden");
      $("#lancerC").removeClass("hidden");
      $("#supporterS").removeClass("current");
      $("#lancerS").addClass("current");
    }
  });

  $("#supporterS").click(function(){
    if($("#supporterC").hasClass("hidden")){
      $("#lancerC").addClass("hidden");
      $("#supporterC").removeClass("hidden");
      $("#lancerS").removeClass("current");
      $("#supporterS").addClass("current");
    }

  });


});