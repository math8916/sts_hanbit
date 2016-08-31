<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div style="text-align: center">	
	<%-- <%
	MemberService service = MemberServiceImpl.getInstanceImpl();
	if(service.getSession() == null ||service.getSession().getId()==null){
	%><h1>먼저 로그인을 해주세요</h1><br/>
		<a href="${context }/member/service/login.jsp">로그인 하시겠습니까?</a><br/><br/>
	<%
	}else{
	response.sendRedirect(null);
	}
	%> --%>
	<a href="${context }/member/main.jsp"><img src="${img }/member.png" alt="member" style="width:30px" /></a>
	<a href="${context }/public/main.jsp"><img src="${img }/home.png" alt="home" style="width:30px" /></a>
	</div>

