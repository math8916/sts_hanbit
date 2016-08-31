<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul id="admin_nav" class="nav nav-tabs">
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
       회원 관리<span class="caret"></span>
    </a>
    <ul id="member_mgmt"  class="dropdown-menu">
				<li><a id="list" 	>목록</a></li>
				<li><a id="find_by" >검색</a></li>
				<li><a id="count" 	>학생수</a></li>
    </ul>
  </li>
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
      성적 관리 <span class="caret"></span>
    </a>
    <ul id="grade_mgmt" class="dropdown-menu">
    		
				<li><a href="#" id="a_update">수정</a></li>
				<li><a href="#" id="a_delete">삭제</a></li>
				<li><a href="#" id="a_list">목록</a></li>
				<li><a href="#" id="a_count">카운트</a></li>
				<li><a href="#" id="a_search">검색</a></li>
    </ul>
  </li>
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
      계좌관리 <span class="caret"></span>
    </a>
    <ul id="account_mgmt" class="dropdown-menu">
				<li><a id="b_delete" >해지</a></li>
				<li><a id="b_list" >전체조회</a></li>
				<li><a id="b_search" >조회(계좌)</a></li>
				<li><a id="b_count" >통장수</a></li>
    </ul>
  </li>
  
</ul>
<script>
$(function(){
	$('#admin_header').css('height','50px');
	$('.navbar-header').css('height','50px');
	$('#admin_header #exit').addClass('cursor');
	$('#admin_header #exit').click(function() {controller.home();});
	
});
</script>