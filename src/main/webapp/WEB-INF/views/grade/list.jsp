<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">
<div class="panel panel-default">
  <div class="panel-heading">학생 목록</div>
 <table id="grade_list" class="table">

<style>
table {font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<div class="box" style='padding-top:0;width:90%' >
<ul class="list-group">
  <li class="list-group-item">홍 길 동</li>
  <li class="list-group-item">총학생수 : 120명</li>
</ul>
      <div class="panel panel-primary">
  <div class="panel-heading">학생 리스트</div>
<table id="grade_list_table">
  <tr>
       <th>ID</th>
       <th>이 름</th>
       <th>학년</th>
       <th>학점</th>
      
  </tr>
     <tr>
    <td>hong</td>
    <td><a class="name" >홍길동</a></td>
    <td>3 학년</td>
    <td>평균 학점 : 4.0</td>
    
  </tr>
    <tr>
    <td>hong</td>
    <td><a>김유신</a></td>
    <td>3 학년</td>
    <td>평균 학점 : 2.0</td>
    
  </tr>
    <tr>
    <td>hong</td>
    <td><a>김유신</a></td>
    <td>3 학년</td>
    <td>평균 학점 : 2.0</td>
    
  </tr>
</table>
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
   </div>
   <script type="text/javascript">
   $(function () {
	$('#grade_list_table .name').click(function() {controller.moveWithKey('member','admin_detail','kim')	});
	$('#grade_list_table .regist').click(function() {controller.moveWithKey('grade','g_regist','kim')	});
	$('#grade_list_table .update').click(function() {controller.moveWithKey('grade','g_update','kim')	});
});
   </script>