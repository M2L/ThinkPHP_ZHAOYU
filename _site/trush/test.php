<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eee</title>


<script type="text/javascript" src="jquery.js"></script>
<style type="text/css">

.f {width:50px;height:50px;position:absolute}
.black {background:#000;top: 0; left: 0; bottom: 0; right: 0;margin:0 auto;}
.red {background:red;}
</style>

<script type="text/javascript">
$(document).ready(function(){


 $("div").click(function(){
  $(".black").fadeIn("slow");
  $(".red").fadeOut("slow");


 });


});
</script>


</head>

<body>
<div>click me!</div>
<div style="position:relative;margin-top:20px;height:3000px">
  <div  class="black f" style="display:none">

  </div>
  <div  class="red f" >

  </div>
</div>



</body>

</html>
