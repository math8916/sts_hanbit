<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">
<div class="panel panel-default">
  <div class="panel-heading">Account List</div>
  <div class="panel-body">
  </div>
<table id="account_list" class="table">
   <tr>
       <td>ID</td>
       <td>Name</td>
       <td>Account NO</td>
       <td>Money</td>
   
   </tr>
   <c:forEach var="account" items="${list}">
   <tr>
       <td>${account.id}</td>
       <td><a href="${context}/account.do?action=find_by_id&page=find_by_id&keyword=${account.id}">${account.name}</a></td>
       <td>${account.name}</td>
       <td>${account.accountNo}</td>
       <td>${account.money}</td>
      
   </tr>
   </c:forEach>
</table>
</div>


   <a id="account_content_a_account"><img id="account_content_img_account"/></a>
   <a id="account_content_a_home"><img id="account_content_img_home"/></a>
</div>