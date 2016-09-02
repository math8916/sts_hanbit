<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<section id="grade_regist">
   <form id="grade_regist_form">
  
     <table id="subject_detail" class="table">
				<tr>
				<td rowspan="4" style="width:30%">
				<img src="${img}/choi1.jpg" alt="bank" width="104"
			height="142"> </td>
				<td style="width:20%" class="font_bold bg_color_yellow">이름</td>
				<td style="width:40%">최강</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">성별</td>
				<td>남</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">전공</td>
				<td>컴퓨터공학</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">학년</td>
				<td>3학년</td>
			</tr>
		</table>
     <div id="rd_major">
        <label for="ex1">과목 선택</label><br>
      
     </div>
      <div>
       <label for="ex1">Java</label>
       <div><input type="text" id="id" name="id" placeholder="점수입력"></div>
     </div>
     <div>
       <label for="ex1">Javascript</label>
       <div><input type="text" id="id" name="id" placeholder="점수입력"></div>
     </div>
     <div>
       <label for="ex1">SQL</label>
       <div><input type="text" id="id" name="id" placeholder="점수입력"></div>
     </div>
     <div>
       <label for="ex1">HTML</label>
       <div><input type="text" id="id" name="id" placeholder="점수입력"></div>
     </div>

  
      <input type="hidden" name="action" value="regist" />
      <input type="hidden" name="page" value="login" />
      <input id="bt_send" type="submit" value="전 송"/>
      <input id="bt_cancel" type="reset" value="취 소"/>
   </form>
</section>

<script type="text/javascript">
$(function() {
   $('#grade_regist').addClass('box');
   $('#grade_regist #bt_join').addClass('btn').addClass(' btn-primary');
   $('#grade_regist #bt_cancel').addClass('btn').addClass(' btn-danger');
   $('#grade_regist_form').addClass('form-horizontal');
   $('#grade_regist_form > div').addClass('form-group').addClass('form-group-lg');
   $('#grade_regist_form > div > label').addClass('col-sm-2').addClass('control-label');
   $('#grade_regist_form > div > div').addClass('col-sm-10');
   $('#grade_regist_form > div > div > input').addClass('form-control');
   $('#grade_regist #rd_major > label:gt(1)').addClass('radio-inline');
});
</script>