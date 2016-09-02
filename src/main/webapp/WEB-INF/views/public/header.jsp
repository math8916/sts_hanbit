<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" style='height: 50px'>
   <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header"><a id="go_public_home"><img id="header_brand"></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
         <li><a id="free_board"><span class="glyphicon glyphicon-education" aria-hidden="true"></span>자유 게시판</a></a></li>
      <ul class="nav navbar-nav navbar-right">
         <li><a id="school_info"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>학교 소개<a></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li><a id="school_map"><span class="glyphicon glyphicon-road" aria-hidden="true"></span>오시는 길</a></li>
      </ul>
    
   </div>
   <!-- /.navbar-collapse -->
</nav>
 <script type="text/javascript">
   $(function () {
	$('#school_info').click(function() {controller.move('public','school_info')	});
	$('#school_map').click(function() {controller.move('public','school_map')	});
	$('#slider').click(function() {controller.move('public','slider')	});
	$('#free_board').click(function() {controller.move('public','free_board')	});
	$('#go_public_home').click(function() {controller.home()});
});
   </script>