<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div style="text-align: center">
		<div style="width: 300px; margin: 0 auto; text-align: left;">
				<h1>계좌관리</h1>
			<ol>
				<li><a id="b_regist"  	href="#">개설</a></li>
				<li><a id="b_deposit" 	href="#">입금</a></li>
				<li><a id="b_withdraw" 	href="#">출금</a></li>
				<li><a id="b_update" 		href="#">비번수정</a></li>
				<li><a id="b_delete" 		href="#">해지</a></li>
				<li><a id="b_list" 		href="#">전체조회</a></li>
				<li><a id="b_search" 		href="#">조회(계좌)</a></li>
				<li><a id="b_count" 		href="#">통장수</a></li>
			</ol>      		
		</div>
	<a href="${context }/public/main.jsp"><img src="${img }/home.png" alt="home" style="width:30px" /></a>
	</div>