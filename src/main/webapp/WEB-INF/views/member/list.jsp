<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">
<div class="panel panel-default">
  <div class="panel-heading">Student List</div>
  <div class="panel-body">
  </div>
<table id="member_list" class="table">
   <tr>
       <td>ID</td>
       <td>Name</td>
       <td>Regist Date</td>
       <td>Birth</td>
       <td>E-mail</td>
       <td>Phone</td>
   </tr>
   <c:forEach var="member" items="${list}">
   <tr>
       <td>${member.id}</td>
       <td><a href="${context}/member.do?action=find_by_id&page=find_by_id&keyword=${member.id}">${member.name}</a></td>
       <td>${member.regDate}</td>
       <td>${member.ssn}</td>
       <td>${member.email}</td>
       <td>${member.phone}</td>
   </tr>
   </c:forEach>
</table>
</div>


   <a id="member_content_a_member"><img id="member_content_img_member"/></a>
   <a id="member_content_a_home"><img id="member_content_img_home"/></a>
</div>