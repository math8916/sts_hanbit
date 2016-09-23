/*
========= META_GROUP ====
@AUTHOR : math89@gmail.com
@CREATE DATE : 2016-9-8
@UPDATE DATE : 2016-9-9
@DESC : 메타데이터
==============================
*/
var app=(function(){
		var init = function(context) {
			session.init(context);
			member.init();
			user.init();
			grade.init();
			nav.init();
			onCreate();
			admin.init();
		} ;
		var context= function() {return session.getContextPath();} ; 
		var js = function() {return session.getJavascriptPath('js');}
		var css = function() {return session.getCssPath('css');}
		var img = function() {return session.getImagePath('img');}
		var setContentView = function() {
			$('#header_brand').attr('src',app.img()+'/logo.png').css('width','70px').css('height','50px').css('alt','logo');
			$('#member_mang').attr('src',app.img()+'/member_magm.png').css('width','300px').css('height','300px').css('alt','logo');
			$('#grade_mang').attr('src',app.img()+'/grade_mang.jpg').css('width','300px').css('height','300px').css('alt','logo');
			$('#account_mang').attr('src',app.img()+'/account_management.jpg').css('width','300px').css('height','300px').css('alt','logo');
			$('#admin_content>h3').addClass('text_center');
			$('#footer').addClass('bottom').addClass('footer');
			$('#public_content').addClass('box');
			$('#public_content').addClass('cursor');
			$('#public_content_a_regist').text(' SIGN IN').click(function() {member.pub_signin_form();});	
			$('#public_content_a_login').text(' LOG IN').click(function() {member.pub_login_form();});	
			$('#public_content_a_admin').text(' ADMIN').click(function(){admin.check()});};
		var onCreate = function() {
			setContentView();
			$('#title').click(function(){controller.home();}) ;
			$('#a_member').click(function(){controller.move('member','main');});
			$('#a_grade').click(function(){controller.move('grade','main');});
			$('#a_account').click(function(){controller.move ('account','main');});
			$('#a_school').click(function(){controller.move ('','school_info');	});
			$('#free_board_list_table .name').click(function() {controller.moveWithKey('member','admin_detail','kim')	});
			$('#free_board_list_table .regist').click(function() {controller.moveWithKey('grade','g_regist','kim')	});
			$('#free_board_list_table .update').click(function() {controller.moveWithKey('grade','g_update','kim')	});
			$('#school_info').click(function() {controller.move('public','school_info')	});
			$('#school_map').click(function() {controller.move('public','school_map')	});
			$('#slider').click(function() {controller.move('public','slider')	});
			$('#free_board').click(function() {controller.move('public','free_board')	});
			$('#go_public_home').click(function() {controller.home()});
					};
		return{
			init : init,
			onCreate : onCreate,
			setContentView : setContentView,
			context : context,
			img : img,
			js : js,
			css : css
		};
		})();
var session =(function() {
	var init = function(context){
		sessionStorage.setItem('context',context);
		sessionStorage.setItem('js',context+'/resources/js');
		sessionStorage.setItem('css',context+'/resources/css');
		sessionStorage.setItem('img',context+'/resources/img');
	};
	var getContextPath = function(){return sessionStorage.getItem('context');};
	var getJavascriptPath = function(){return sessionStorage.getItem('js');};
	var getCssPath = function(){return sessionStorage.getItem('js');};
	var getImagePath = function(){return sessionStorage.getItem('img');};
	return {
		init : init,
		getContextPath : getContextPath,
		getJavascriptPath : getJavascriptPath,
		getCssPath : getCssPath,
		getImagePath : getImagePath
	};
	
})();

var controller = (function() {
					var _page,_directory
					var setPage = function(page) {this._page=page};
					var setDirectory = function(directory) {this._directory=directory};
					var setKey = function(key){this._key=key};
					var getPage = function() {return this._page;};
					var getDirectory = function() {return this._directory;};
					var getKey = function(){return this._key};
					
					return{
						setPage : setPage,
						setDirectory:setDirectory,
						getPage:getPage,
						getDirectory:getDirectory,
						setKey : setKey,
						getKey : getKey,
						moveWithKey : function(directory,page,key){
							setDirectory(directory);
							setPage(page);
							setKey(key);
							location.href = app.context()+'/'+getDirectory()+'/'+getPage()+'?key='+getKey();
						},
						move : function(directory,page,key) {
							setDirectory(directory);
							setPage(page);
							location.href=
								app.context()+'/'+getDirectory()+'/'+getPage()+'?key='+getKey();
						},
						home : function() {location.href=app.context()+'/'	}
					};
				})();
var util=(function() {
			return{
				isNumber : function(value) {
					 return typeof value === 'number' && isFinite(value);
				},
				pwChecker : function(value) {
					var pw_regex=/^.*(?=.{4,10})(?=.*[a-zA-Z0-9]).*$/;
					return pw_regex.test(value)?"yes":"no";
							
							
				}
			};
		})();	
var nav = (function(){
			   var init = function(){onCreate();};
			   var setContentView = function (){
			     
				   $('#nav ul').addClass('list_style_none').addClass('over_hidden').addClass('bg_color_black').css('margin','0').css('padding','0');
				      $('#nav li').addClass('float_left').addClass('display_inline').css('border-right','1px').css('solid','#bbb');
				      $('#nav li:last-child').css('border-right','none');
				      $('#nav li a').addClass('display_block').addClass('text_center').addClass('text-decoration_none').css('color','white').css('padding','14px 16px');
				      $('#nav li a:hover:not(.active)').addClass('bg_color_black');
				      $('#nav .active').addClass('bg_color_black');
			   };
			   var onCreate = function (){
			      setContentView();
			   };
			   return{
			   init:init
			   
		};
			})();
/*
=============== MAJOR_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :전공
=============== MAJOR ===============
*/
var major = (function(){})();
/*
=============== Student_js ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-20
@DESC :학생
=============== Student ===============
*/
var STUDENT_MAIN=
	'<section id="user_content_service" class="box section-padded">'
	+'<div><div class="row text-center title"><h2>Services</h2> '
	+'<h4 class="light muted">Achieve the best results with our wide variety of training options!</h4> '
	+'</div><div  class="row services"><div id="kaup" class="col-md-4"><div class="service"> '
	+'<div class="icon-holder">  '
	+'<img src="'+app.img()+'/icons/kaup.png" alt="" class="icon"> '
	+'</div>'
	+'<h4 class="heading">KAUP</h4> '
	+'<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>'
	+'</div> '
	+'</div>  '
	+'<div id="rock" class="col-md-4"> '
	+'<div class="service">  '
	+'<div class="icon-holder">   '
	+'<img src="'+app.img()+'/icons/rsp.png" alt="" class="icon"> '
	+'</div> '
	+'<h4 class="heading">MIX ROCK</h4>  '
	+'<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>'
	+'</div> '
	+'</div>  '
	+'<div id="lotto" class="col-md-4">         '
	+'<div class="service"> '
	+'<div class="icon-holder">   '
	+'<img src="'+app.img()+'/icons/lotto.png" alt="" class="icon">  '
	+'</div>  '
	+'<h4 class="heading">LOTTO DRAWING</h4> '
	+'<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>'
	+'</div> '
	+'</div>   '
	+'</div>  '
	+'</div> '
	+'<div class="cut cut-bottom"></div> '
	+'</section>     '
	+'<section id="user_content_subject" class="section gray-bg">  '
	+'<div class="container">  '
	+'<div class="row title text-center">     '
	+'<h2 class="margin-top">MAJOR SUBJECT</h2>   '
	+'<h4 class="light muted">TOP3</h4>    '
	+'</div>    '
	+'<div class="row">   '
	+'<div class="col-md-4">  '
	+'<div id ="major_subject_1" class="team text-center" value="java">  '
	+'<div class="cover" style="background:url('+app.img()+'/team/team-cover1.jpg"); background-size:cover;">'
	+'<div class="overlay text-center">     '
	+'<h3 class="white">수업료</h3>  '
	+'<h5 class="light light-white">1 - 5 sessions / month</h5>  '
	+'</div>    '
	+'</div>   '
	+'<img src='+app.img()+'/team/team3.jpg alt="Team Image" class="avatar">  '
	+'<div class="title">    '
	+'<h4>JAVA</h4>    '
	+'<h5 class="muted regular">Server programming </h5>   '
	+'</div>    '
	+'<input type="hidden" name="major_subject_1" value="java">   '
	+'<input  type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>  '
	+'</div>      '
	+'</div>    '
	+'<div class="col-md-4">   '
	+'<div id ="major_subject_2" class="team text-center">      '
	+'<div class="cover" style="background:url('+app.img()+'/team/team-cover2.jpg"); background-size:cover;">'
	+'<div class="overlay text-center">    '
	+'<h3 class="white">$수업료.00</h3>    '
	+'<h5 class="light light-white">1 - 5 sessions / month</h5>    '
	+'</div>      '
	+'</div>    '
	+'<img src='+app.img()+'/team/team1.jpg alt="Team Image" class="avatar">    '
	+'<div class="title">                             '
	+'<h4>Javascript</h4>               '
	+'<h5 class="muted regular">Server programming</h5>        '
	+'</div>                               '
	+'<input type="hidden" name="major_subject_2">          '
	+'<input  type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>  '
	+'</div>                         '
	+'</div>                         '
	+'<div class="col-md-4">            '
	+'<div id ="major_subject_3" class="team text-center">           '
	+'<div class="cover" style="background:url('+app.img()+'/team/team-cover3.jpg); background-size:cover;">       '
	+'<div class="overlay text-center">            '
	+'<h3 class="white">수업료</h3>              '
	+'<h5 class="light light-white">1 - 5 sessions / month</h5>     '
	+'</div>        '
	+'</div>        '
	+'<img src='+app.img()+'/team/team2.jpg alt="Team Image" class="avatar">     '
	+'<div class="title">  '
	+'<h4>SQL</h4>            '
	+'<h5 class="muted regular">Data </h5>   '
	+'</div>           '
	+'<input type="hidden" name="major_subject_3">           '
	+'<input type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>    '
	+'</div></div></div></div>'
	+'</section>'   
var user = (function(){
	var init = function() {
		$('#member_content_img_home').attr('src',app.img()+'/home.png');
		onCreate();
	};
	var setContentView = function() {
		$('#user_header').css('height','50px');
		$('.navbar-header').css('height','50px');	
	};
	var onCreate = function (){
		setContentView ();
	
	$('#bt_bom').click(function() {controller.move('','bom');},false);
	$('#bt_dom').click( function() {controller.move('','dom');}, false);
	$('#bt_kaup').click(function() {controller.move('','kaup');}, false);
	$('#bt_account').click( function() {controller.move('','account');}, false);
	$('#bt_deposit').click( function() {controller.move('','account');}, false);
	$('#bt_withdraw').click( function() {controller.move('','account');}, false);
	$('#a_regist').click(function() {location.href = controller.move('grade','regist');})
	$('#a_update').click(function() {location.href = controller.move('grade','update');});
	$('#a_delete').click(function() {location.href =controller.move('grade','delete');});
	$('#a_list').click(function() {	location.href = controller.move('grade','list')	;});
	$('#a_count').click(function() {location.href =controller.move('grade','count')	;});
	$('#a_search').click(function() {location.href =controller.move('grade','search');});
	$('#logined_header_brand').click(function() {location.href =controller.move('member','content');});
	$('#user_content_service #kaup').addClass('cursor').click(function(){controller.move('member','kaup');});
	$('#user_content_service #rock').addClass('cursor').click(function(){controller.move('member','rock');});
	$('#user_content_service #lotto').addClass('cursor').click(function(){controller.move('member','lotto');});
	var key = $('#user_content_subject #major_subject_1 input[type="hidden"]').val();
	$('#user_content_subject #major_subject_1').click(function () {controller.moveWithKey('subject','detail',key)});
	$('#user_content_subject #major_subject_2').click(function () {controller.moveWithKey('subject','detail',key)});
	$('#user_content_subject #major_subject_3').click(function () {controller.moveWithKey('subject','detail',key)});
	$('#user_header #logout').addClass('cursor').click(function() {controller.home();});
	$('#user_header #a_mypage').addClass('cursor').click(function() {controller.move('member','content');});
	$('#user_header #a_detail').addClass('cursor').click(function() {controller.move('member','detail');});
	$('#user_header #a_update').addClass('cursor').click(function() {controller.move('member','update');});
	$('#user_header #a_delete').addClass('cursor').click(function() {controller.move('member','delete');});
	$('#user_header #account li:eq(0) a').click(function () {controller.move('account','b_detail');});
	$('#user_header #account li:eq(1) a').click(function () {controller.move('account','b_regist');});
	$('#user_header #account li:eq(2) a').click(function () {controller.move('account','b_transaction');});
	$('#user_header #account li:eq(3) a').click(function () {controller.move('account','b_regist');});
	$('#user_header #grade li:eq(0) a').click(function () {controller.move('grade','g_detail');});
	$('#user_header #grade li:eq(1) a').click(function () {controller.move('grade','g_search');});
	$('#go_user_home').click(function () {controller.move('member','content');});
	};
	return{
		init:init,
			
		
	};
})();
/*
=============== ADMIN_js ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-20
@DESC :학생
=============== ADMIN ===============
*/
var admin= (function () {
	var _pass;
	var getPass= function() {return this._pass;};
	var setPass= function(pass) {this._pass=pass;};
	var init = function(){onCreate();};
	var setContentView = function (){
		$('#admin_header').css('height','50px');
		$('.navbar-header').css('height','50px');
		$('#admin_header #exit').addClass('cursor');
	};
	var onCreate = function(){
		setContentView();
		$('#admin_nav #member_mgmt #list').click(function(){controller.move('member','list');});
		$('#admin_nav #member_mgmt #find_by').click(function(){controller.move('member','find_by');});
		$('#admin_nav #member_mgmt #count').click(function(){controller.move('member','count');});
		$('#admin_nav #account_mgmt #b_delete').click(function(){controller.move('account','b_delete');});
		$('#admin_nav #account_mgmt #b_list').click(function(){controller.move('account','b_list');});
		$('#admin_nav #account_mgmt #b_search').click(function(){controller.move('account','b_search');});
		$('#admin_nav #account_mgmt #b_count').click(function(){controller.move('account','b_count');});
		$('#admin_nav #grade_mgmt #g_regist').click(function(){controller.move('grade','g_regist');});
		$('#admin_nav #grade_mgmt #g_update').click(function(){controller.move('grade','g_update');});
		$('#admin_nav #grade_mgmt #g_delete').click(function(){controller.move('grade','g_delete');});
		$('#admin_nav #grade_mgmt #g_list').click(function(){controller.move('grade','g_list');});
		$('#admin_nav #grade_mgmt #g_count').click(function(){controller.move('grade','g_count');});
		$('#admin_nav #grade_mgmt #g_search').click(function(){controller.move('grade','g_search');});
		$('#admin_header #exit').click(function() {controller.home();});
		$('#admin_header #go_admin_home').click(function() {controller.move('admin','main');});
		$('#g_regist').click(function () {alert("등록으로 이동 합니다");controller.move('member','list')});
		$('#g_update').click(function () {alert("등록으로 이동 합니다");controller.move('member','list')});
	};
	return {
init:init,
getPass : getPass,
setpass : setPass,

check : function() {
	setPass(1);
	var isAdmin = window.confirm('관리자입니까? :');
	if (!isAdmin) {
		alert('관리자만 접근 가능합니다');
	} else {
		var password = prompt('관리자 비번을 입력해라');
		if (password == getPass()) {
			controller.move('admin', 'main');}
		else {
			alert('비번이 틀림')
		}
	}
}
};

})();
/*
=============== PROF_JS  ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :학생
=======================================
*/
var LOGIN_FORM=
	'<section class="box">'
	+'<form id = "member_login_form" class="form-signin">'
	+'<h2 class="form-signin-heading">Please sign in</h2>'
	+'<label for="inputEmail" class="sr-only">Email address</label>'
	+'<input type="text" id="id" name="id"  class="form-control" placeholder="ID" required autofocus>'
	+' <label for="inputPassword" class="sr-only">Password</label>'
	+'<input type="password" id="pw" name="pw" class="form-control" placeholder="Password" required>'
	+' <input type="hidden" name="context"  >'
	+' <div class="checkbox">'
	+' <label> <input type="checkbox" name="remember_me" value="remember-me"> Remember me</label>'
	+'</div><input id="login_btn" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</input>'
	+'</form></section>';
var SIGN_UP_FORM =
		'<section class="box"><form id="member_regist_form" >'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">이름</label><div><input type="input_name"  id="inputEmail3"placeholder="Name"></div></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">ID</label><div id="id_box"><input type="text"  id="id" placeholder="ID"><input type="button" id="check_dup" value="중복체크"/></div></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">Password</label><div><input type="password"  name="password" id="password" placeholder="8자리이상 입력해주세요"></div></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">Password 확인</label><div><input type="password" name="chpass"  id="chpass" placeholder="8자리이상 입력해주세요"></div></div>'
		+'<div>  <font name="check" size="2" color="red"></font> </div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">SSN</label><div><input type="input_name"  id="inputEmail3"placeholder="123456-1"></div></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">E-mail</label><div><input type="input_name"  id="inputEmail3"placeholder="email@mail.com"></div></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">Phone</label>'
		+'<div><input type="input_name"  id="inputEmail3"placeholder="010-1234-1234"></div></br>'
		+'<div id="rd_major">'
		+'<label for="inputEmail3" class="col-sm-2 control-label">전 공</label>'
		+'<label ><input type="radio"  name="major" value="computer">컴공학부</label>'
		+'<label ><input type="radio"  name="major" value="mgmt"> 경영학부</label>'
		+'<label ><input type="radio"  name="major" value="math"> 수학부</label>'
		+'<label ><input type="radio"  name="major" value="eng"> 영문학부</label></div>'
		+'<div ><label for="inputEmail3" class="col-sm-2 control-label">수강 과목</label>'
		+'<div class="ck_subject">'
       	+'<label ><input type="radio" name="subject" value="java"> 자바</label>'
		+'<label ><input type="radio" name="subject" value="sql"> SQL</label>'
		+'<label ><input type="radio" name="subject" value="cpp"> C++</label>'
		+'<label ><input type="radio" name="subject" value="python"> 파이썬</label>'
		+'<label ><input type="radio" name="subject" value="delphi"> 델파이</label>'
		+'<label ><input type="radio" name="subject" value="html"> HTML<br/>'
		+'</label></div></div></div>'
		+'<input id="bt_join" type="submit" value="회원가입" />'
		 +' <input id="bt_cancel" type="reset" value="취소" /></form></section>';
var DETAIL_FORM=
	'<div class="box">'
	+'<h1>회원상세정보</h1>'
	+'<table id="member_detail">'
	+'<tr>'
	+'<td rowspan="7" style="width:30%">'
	+'<img id="img" src="'+app.img()+'/" alt="며느리" width="104" height="142"> </td>'
	+'<td style="width:20%" class="font_bold bg_color_yellow">ID</td>'
	+'<td id="id" style="width:40%"></td>'
	+'</tr>'
	+'<tr>'
	+'<td class="font_bold bg_color_yellow">비밀번호</td>'
	+'<td id="u_pw"></td>'
	+'</tr>'
	+'<tr>'
	+'<td class="font_bold bg_color_yellow">이 름</td>'
	+'<td id="name"></td>'
	+'</tr>'
	+'<tr>'
	+'<td class="font_bold bg_color_yellow">성 별</td>'
	+'<td id="gender"></td>'
	+'</tr>'
	+'<tr>'
	+'<td class="font_bold bg_color_yellow">이메일</td>'
	+'<td id="email"></td>'
	+'</tr>'
	+'<tr>'
	+'<td class="font_bold bg_color_yellow">전공과목</td>'
	+'<td  id="major"></td>'
	+'</tr>'
	+'<tr>'
	+'<td  class="font_bold bg_color_yellow">수강과목</td>'
	+'<td id="subject" colspan="2"></td>'
	+'</tr>'
	+'<tr>'
	+'<td  class="font_bold bg_color_yellow">생년월일</td>'
	+'<td id="birth" colspan="2"></td>'
	+'</tr>'
	+'<tr>'
	+'<td  class="font_bold bg_color_yellow">등록일</td>'
	+'<td id="regdate" colspan="2"></td>'
	+'</tr>'
	+'</table>'
	+'<br />'
	+'<p>'
	+'</p>'
	+'<div id="bt_box"><input id="go_update" type="button" value ="내정보 수정 " /><input id="unregist" type="button" value ="회원탈퇴 " /></div></div>';
var UNREGIST_FORM=
	'<div class="box">'
	+'<h3>탈퇴하시려면 비밀번호를 다시 입력해 주세요</h3>'
	+'<form id="member_delete_form" class="navbar-form navbar-left" role="search">'
	+'<div class="form-group">'
	+'<input id="u_pw" type="text" class="form-control" placeholder="PASSWORD">'
	+'</div>'
	+'<button id="unregist_bt" type="submit" class="btn btn-default" value="탈 퇴">Submit</button>'
	+'</form>'
	+'</div>';
var member = (function() {
	var _name,_ssn,_gender,_age;
	var setAge=function(age){this.age=age;}
	var setName=function(name){this.name=name;}
	var setSsn=function(ssn){this.ssn=ssn;}
	var setGender=function(gender){this.gender=gender;}
	var getAge=function(age){this.age=age;}
	var getName=function(name){this.name=name;}
	var getSsn=function(ssn){this.ssn=ssn;}
	var getGender=function(gender){this.gender=gender;}
	var init = function(){onCreate()};
	var setContentView = function() {
		   $('#member_content_img_home').attr('src',app.img()+'/home.png').css('width','30px').css('alt','home');
		   $('#member_content_a_home').click(function(){controller.home()});
		   $('#member_content').addClass('box').addClass('font_size_20px').addClass('cursor');
		   $('#member_content>article>').css('width','300px')
		   .addClass('center').addClass('text_left')
		   .css('font-size','20px');
		   $('#member_content>h1').text('MEMBER MGMT');
		   $('#member_content_ol>li>a').addClass('remove_underline');
		   $('#member_content_ol>li:first>a').text('SING UP');
		   $('#member_content_ol>li:nth-child(2)>a').text('MY PAGE');
		   $('#member_content_ol>li:nth-child(3)>a').text('UPDATE');
		   $('#member_content_ol>li:nth-child(4)>a').text('DELETE');
		   $('#member_content_ol>li:nth-child(5)>a').text('LOGIN');
		   $('#member_content_ol>li:nth-child(6)>a').text('LOGOUT');
		   $('#member_content_ol>li:nth-child(7)>a').text('LIST');
		   $('#member_content_ol>li:nth-child(8)>a').text('SEARH');
		   $('#member_content_ol>li:nth-child(9)>a').text('COUNT');
		   $('#member_regist').addClass('box');
		   
		   $('#member_regist span').addClass('bg_color_yellow').addClass('float_left').addClass('text_left').css('width','200px');
		   $('#member_regist #bt_join').addClass('btn').addClass('btn-primary');
		   $('#member_regist #bt_cancel').addClass('btn').addClass('btn-danger');
		   $('#member_regist #bt_dup').addClass('btn').addClass('btn-danger');
		   $('#member_regist_form').addClass('form-horizontal');
		   $('#member_regist_form > div').addClass('form-group').addClass('form-group-lg');
		   $('#member_regist_form > div > label').addClass('col-sm-2').addClass('control-label');
		   $('#member_regist_form > div > div').addClass('col-sm-10');
		   $('#member_regist_form > div > div > input').addClass('form-control');
		   $('#member_regist_form #rd_major >label:gt(0)').addClass('radio-inline');
		   $('#member_regist_form #ck_subject').addClass('checkbox');
		   $('#member_regist_form #ck_subject >label').addClass('checkbox-inline');
		   $('#member_find_form').attr('action',app.context()+'/member/search');
		   $('#member_find_form input[type="hidden"]').attr('name','context')
		   .attr('value',app.context());
			
	};
	var onCreate = function() {
		setContentView();
		$('#regist').click(function(){location.href=controller.move('member','regist')})
		$('#find_by_id').click(function(){location.href=controller.move('member','find_by_id')})
		$('#update').click(function(){location.href=controller.move('member','update')})
		$('#delete').click(function(){location.href=controller.move('member','delete')})
		$('#login').click(function(){location.href=controller.move('member','login')})
		$('#logout').click(function(){location.href=controller.move('member','logout')})
		$('#list').click(function(){location.href=controller.move('member','list')})
		$('#find_by').click(function(){location.href=controller.move('member','find_by')})
		$('#count').click(function(){location.href=controller.move('member','count')})
		$('#member_find_form input[type="submit"]').click(function(){('#member_find_form').submit();});
		$('#member_list_table .name').click(function() {controller.moveWithKey('member','admin_detail','kim')	});
		$('#member_list_table .regist').click(function() {controller.moveWithKey('grade','g_regist','kim')	});
		$('#member_list_table .update').click(function() {controller.moveWithKey('grade','g_update','kim')	});
		$('#member_login_form').attr('method','post').attr('action',app.context()+'/member/login');
		$('#member_login_form input[type="hidden"]').attr('value',app.context());
		$('#member_login_form input[type="submit"]').click(function() {('#member_login_form').submit();})

	};

	return{
		setSsn : setSsn,
		setName : setName,
		setAge : setAge,
		setGender : setGender,
		getName : getName,
		getAge : getAge,
		getSsn : getSsn,
		getGender : getGender,
		init : init,
		pub_login_form:function(){
			
				$('#pub_article').html(LOGIN_FORM);
				$('#login_btn').click(function(e){
					e.preventDefault();
					
				$.ajax({
					url : app.context()+'/member/login',
					type : 'POST',
					data : {'id':$('#id').val(),'pw':$('#pw').val()},
					dataType : 'json',
					success : function(data){
						if(data.id=="NONE"){
						alert('아이디나 비번이 일치 하지 않습니다.');
						}else{
							/*alert('welcome .' +data.name);*/
							                                                                                                                                          
							$('#pub_header').empty().load(app.context()+'/member/logined/header');                                                                                                                
							$('#pub_article').html(STUDENT_MAIN);
							$('#logout').on('click',function(){location.href = app.context()+'/member/logout';});
						}                                                                                                                                                    
					},
					error : function(xhr,status,msg){
						alert("로그인 실패"+msg);  
					}
				});
			});
		},
		pub_signin_form:function(){
			
				$('#pub_article').empty().append(SIGN_UP_FORM);
					member.init();
				$(function(){
						 $('#password').keyup(function(){
						  $('font[name=check]').text('');
						  });
					$('#chpass').keyup(function(){
						if($('#chpass').val().length > 8){
						   if($('#password').val()!=$('#chpass').val()){
						    $('font[name=check]').text('');
						    $('font[name=check]').html("암호틀림");
						   }else{
						    $('font[name=check]').text('');
						    $('font[name=check]').html("암호맞음");
						   }
						  }
					});
					 });
				$('#check_dup').click(function(e){
					e.preventDefault();
					var $val=$(this).val();
					if (util.pwChecker($('#id').val())==='yes') {
						$.ajax({
							url:app.context()+'/member/check_dup/'+$('#id').val(),
							success:function(data){
							if(data.flag==="TRUE"){
								$('#id_box').html('<input type="text"  id="id" placeholder="'+data.message+'"><input type="button" id="re_check_dup" name="re_check_dup" value="다시조회"/>');
								member.init();
							}else{
								alert('디버깅 1호');
								$('#id_box').html('<input type="text"  id="id" value="'+data.temp+'"><input type="button" id="use_input_id" name="use_input_id" value="그대로 사용"/>');
								member.init();
								
								$('#bt_join').click(function(e){	
									e.preventDefault();
									var join_info ={
											'id' :$('#id').val(),
											'pw' :$('#password').val(),
											'name':$('#name').val(),
											'ssn':$('#ssn').val(),
											'email':$('#email').val(),
											'phone':$('#phone').val()
									};
									
									/*$('#radio').val();
									$('#ck_subject').val();*/

									$.ajax({
										
										url:app.context()+'/member/signup',
										type:'post',
										contentType:'application/json',
										data :JSON.stringify(join_info),
										dataType:'JSON',
										success:function(data){
											alert('디버깅 2호');
											if (data.message==='success') {
												alert('디버깅 3호');
												member.pub_login_form();
											} else {
												alert('알수 없는 에러입니다.');
											}
										},
										error:function(x,s,m){
											alert('회원가입 실패!!!!!'+m);
										}
										
										
									});
								});
								
							}
							},
							error:function(xhr,status,msg){
								alert('회원 중복 실패 :'+ msg);
							}
						});
						
					} else {
						alert("정규식에 안 맞음");
						$('#id').val('').focus();
						
					}
					
				});
		},
		detail : function(){
			$('#pub_header').empty().load(app.context()+'/member/logined/header');
			$('#pub_article').html(DETAIL_FORM);
				$.getJSON(app.context()+'/member/detail',function(data){
						$('#member_detail #img').attr('src',app.img()+'/'+data.profileImg);
						$('#member_detail #id').text(data.id);
						$('#member_detail #pw').text(data.pw).hide();
						$('#member_detail #name').text(data.name);
						$('#member_detail #gender').text(data.gender);
						$('#member_detail #email').text(data.email);
						$('#member_detail #major').text('test');
						$('#member_detail #subject').text('test');
						$('#member_detail #regdate').text(data.regDate);
						$('#member_detail #birth').text(data.ssn);
						$('#go_update').click(function(){
							$('#member_detail #u_pw').html('<input type="text" id="u_pw" placeholder="'+data.pw+'"/>');
							$('#member_detail #email').html('<input type="text" id="email" placeholder="'+data.email+'"/>');
							$('#member_detail #major').html('<input type="text" id="major" placeholder="test"/>');
							$('#member_detail #subject').html('<input type="text" id="subject" placeholder="test"/>');
							$('#bt_box').html('<input id="confirm" type="button" value ="확인 " /><input id="cancel" type="button" value ="취소 " />')
							$('#confirm').click(function(){
								var update_info ={
										'pw' :$('#password').val(),
										'email':$('#email').val(),
										'major':$('#major').val(),
										'subject':$('#subject').val()
								};
								$.ajax({
									url:app.context()+'/member/update',
									type:'post',
									contentType:'application/json',
									data :JSON.stringify(update_info),
									dataType:'JSON',
									success : function(data){
										 if(data.message==='success'){
					    					  member.detail();
					    				  }else{
					    					  alert('서버는 다녀왔는데 실패함 !!');
					    				  }
									},
									error:function(){
										 alert('정보 수정시 발생한 에러 : '+m);
									}
								});
							});
						});
						$('#unregist').click(function(){
							$('#pub_article').html(UNREGIST_FORM);
							$('#unregist_bt')
							$.ajax({
								url : app.context()+'/member/delete',
								type : 'POST',
								data : {'pw':$('u_pw').val()},
								dataType : 'json',
								success : function(data){
									if(data.message==="success1"){
									alert('아이디나 비번이 일치 하지 않습니다.');
									  $('#pub_header').empty().load(app.context()+'/member/logined/header');
		    						  $('#pub_article').html(UNREGIST_FORM);
									}else{
										 locaton.href = app.context()+'/';
										                                                                                                                                        
										
										 alert('삭제 성공'); 
									}                                                                                                                                                    
								},
								error : function(xhr,status,msg){
									alert("삭제 실패"+msg);  
								}
							});
						});
				});
			
		}
	};	
})();
/*
=============== GRADE_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :시험기간 
====================================
*/
var grade =(function(){
	var init = function(){onCreate();};
	var setContentView = function (){
		$('#grade_contents').addClass('box');
		$('#img_home').css('width', '30px');
		$('#grade_contents >article').css('width',' 300px').css('margin',' 0 auto').css('text-align',' center');
		$('#title').css('font-size', '40px');
		$('#grade_regist').addClass('box');
		$('#grade_regist #bt_join').addClass('btn').addClass(' btn-primary');
		$('#grade_regist #bt_cancel').addClass('btn').addClass(' btn-danger');
		$('#grade_regist_form').addClass('form-horizontal');
		$('#grade_regist_form > div').addClass('form-group').addClass('form-group-lg');
		$('#grade_regist_form > div > label').addClass('col-sm-2').addClass('control-label');
		$('#grade_regist_form > div > div').addClass('col-sm-10');
		$('#grade_regist_form > div > div > input').addClass('form-control');
		$('#grade_regist #rd_major > label:gt(1)').addClass('radio-inline');
		$('#grade_grade').addClass('box').css('padding-top','0');
		$('#grade_update').addClass('box').css('padding-top','0');
		$('#grade_update #bt_send').addClass('btn').addClass(' btn-primary');
		$('#grade_update #bt_cancel').addClass('btn').addClass(' btn-danger');
		$('#grade_update_form').addClass('form-horizontal');
		$('#grade_update_form > div').addClass('form-group').addClass('form-group-lg');
		$('#grade_update_form > div > label').addClass('col-sm-2').addClass('control-label');
		$('#grade_update_form > div > div').addClass('col-sm-10');
		$('#grade_update_form > div > div > input').addClass('form-control');
		$('#grade_update #rd_major > label:gt(1)').addClass('radio-inline');
	};
	var onCreate = function(){
		setContentView();
		$('#g_regist').click(function(){controller.move('grade','regist');});
		$('#g_update').click(function(){controller.move('grade','update');});
		$('#g_delete').click(function(){controller.move('grade','delete');});
		$('#g_list').click(function(){controller.move('grade','list');});
		$('#g_count').click(function(){controller.move('grade','count');});
		$('#g_find').click(function(){controller.move('grade','find');});
		$('#a_regist').click(function() {location.href = "${context}/grade/regist.do";});
		$('#a_update').click(function() {location.href ="${context}/grade/update.do";});
		$('#a_delete').click(function() {location.href = "${context}/grade/delete.do";});
		$('#a_list').click(function() {location.href = "${context}/grade/list.do";});
		$('#a_count').click(function() {location.href = "${context}/grade/count.do";});
		$('#a_find').click(function() {location.href = "${context}/grade/search.do";});
		$('#grade_list_table .name').click(function() {controller.moveWithKey('member','admin_detail','kim')	});
		$('#grade_list_table .regist').click(function() {controller.moveWithKey('grade','g_regist','kim')	});
		$('#grade_list_table .update').click(function() {controller.moveWithKey('grade','g_update','kim')	});
		
	};
	var onCreate = function(){
		setContentView();
	};
	return {
		init : init,
		onCreate:onCreate
	};
})();
/*
=============== QNA_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :질의 응답    게시판
====================================
*/
var qna = (function(){})();
/*
=============== NOTICE_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :게시판
====================================
*/
var notice = (function(){})();
/*
=============== SUBJECT_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :과목
=====================================
*/
var subject = (function(){})();
/*
=============== EXAM_JS ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :시험성적
====================================
*/
var exam = (function(){})();
