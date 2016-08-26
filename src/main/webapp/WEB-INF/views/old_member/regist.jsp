<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="member_regist" >
	<form id="member_regist_form" >
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">이름</label>
			<div><input type="input_name"  id="inputEmail3"placeholder="Name"></div>
		</div>
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
				<div><input type="input_name"  id="inputEmail3"placeholder="ID"></div>
		</div>
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">Password</label>
				<div><input type="input_name"  id="inputEmail3"placeholder="PASSWOD"></div>
		</div>
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">SSN</label>
				<div><input type="input_name"  id="inputEmail3"placeholder="123456-1"></div>
		</div>
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
				<div><input type="input_name"  id="inputEmail3"placeholder="email@mail.com"></div>
		</div>
		<div >
			<label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
				<div>
			<input type="input_name"  id="inputEmail3"placeholder="010-1234-1234">
		</div>
		</br>
		<div id="rd_major">
		<label for="inputEmail3" class="col-sm-2 control-label">전 공</label>
		<label ><input type="radio"  name="major" value="computer">컴공학부</label>
		<label ><input type="radio"  name="major" value="mgmt"> 경영학부</label>
		<label ><input type="radio"  name="major" value="math"> 수학부</label>
		<label ><input type="radio"  name="major" value="eng"> 영문학부</label>
		</div>
		<div >
		<label for="inputEmail3" class="col-sm-2 control-label">수강 과목</label>
  
     
      <div class="ck_subject">
       
		<label ><input type="radio" name="subject" value="java"> 자바</label>
		<label ><input type="radio" name="subject" value="sql"> SQL</label>
		<label ><input type="radio" name="subject" value="cpp"> C++</label>
		<label ><input type="radio" name="subject" value="python"> 파이썬</label>
		<label ><input type="radio" name="subject" value="delphi"> 델파이</label>
		<label ><input type="radio" name="subject" value="html"> HTML<br/>
		</label></div>
      </div>
    </div>
		
		<input id="bt_join" type="submit" value="회원가입" />
		<input id="bt_cancel" type="reset" value="취소" />
		
		
	</form>	
		
</section>

