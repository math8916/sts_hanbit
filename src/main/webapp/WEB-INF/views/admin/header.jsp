<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav id="admin_header"class="navbar navbar-default" style= "height :50px">
  <div class="container-fluid box">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
     <img id="header_brand">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
       
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>

    
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <li style='margin-top:14px;margin-right:50px;font-weight: bold;'><span aria-hidden="true"></span>관리자 화면</li>
        <li><a id="exit" href="#"><span class="glyphicon glyphicon-log-out " aria-hidden="true"></span> 나가기</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">비밀번호변경</a></li>
            <li><a href="#">관리자 세부 변경</a></li>
            <li><a href="#">관리자 검색</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">유저 화면 가기</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<script>
$(function(){
	$('#admin_header').css('height','50px');
	$('.navbar-header').css('height','50px');
	$('#admin_header #exit').addClass('cursor');
	$('#admin_header #exit').click(function() {controller.home();});
});
</script>