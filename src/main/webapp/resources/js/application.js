var app=(function(){
		var init = function(context) {
			session.init(context);
			member.init();
			user.init();
			account.init();
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
			$('#global_content').addClass('box');
			$('#global_content').addClass('cursor');
			$('#global_content_a_regist').text(' SIGN IN').click(function() {controller.move('member','regist');});	
			$('#global_content_a_login').text(' LOG IN').click(function() {controller.move('member','login');});	
			$('#global_content_a_admin').text(' ADMIN').click(function(){admin.check()});};
		var onCreate = function() {
			setContentView();
			$('#title').click(function(){controller.home();}) ;
			$('#a_member').click(function(){controller.move('member','main');});
			$('#a_grade').click(function(){controller.move('grade','main');});
			$('#a_account').click(function(){controller.move ('account','main');});
			$('#a_school').click(function(){controller.move ('','school_info');	});
}
		return{
			init : init,
			onCreate : onCreate,
			setContentView : setContentView,
			context : context,
			img : img,
			js : js,
			css : css
		}
})();
var user = (function(){
	var init = function() {
		$('#member_content_img_home').attr('src',app.img()+'/home.png');
	};
	
	var onCreate = function (){
		setContextView = function(){};
	
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
	};
	return{
		init:init,
		onCreate:onCreate
			
		
	};
})();
var account = (function() {
	var _account_no, _money;
	var setAccountNo = function(account_no){this._account_no=account_no;};
	var getAccountNo = function(){return this._account_no;};
	var setMoney = function(money){this._money=money;};
	var getMoney = function(){return this._money;};
	var init = function(){onCreate();};
	var setContentView = function(){};
	var onCreate = function() {
		setContentView();
		/*$('#bt_spec_show').click(member.spec());
		$('#bt_make_account').click(this.spec());
		$('#bt_deposit').click(this.deposit());
		$('#bt_withdraw').click(this.withdraw());*/
	};
	
	return {
		 setAccountNo:setAccountNo,
		 getAccountNo:getAccountNo,
		 setMoney : setMoney,
		 getMoney : getMoney,
		init : init,
		
		spec : function() {
			setMoney(0);
			setAccountNo(Math.floor((Math.random() * 899999) + 100000));
			document.querySelector('#result_account').innerHTML = getAccountNo();
		},
		deposit: function() {
			var r_acc=document.querySelector('#result_account').innerText; 
			if(r_acc ===''){
				alert ('먼저 통장을 개설 하세요');
			}else{
				var rest_money =getMoney();
				
				var input_money = Number(document.querySelector('#money').value);
				console.log('타입 체크'+(typeof rest_money ==='number'));
				setMoney(input_money+rest_money);
				document.querySelector('#rest_money').innerHTML=getMoney();
			}
			
		},
		withdraw: function() {
			var rest_money = getMoney();
			var input_money = Number(document.querySelector('#money').value);
			setMoney(rest_money-input_money);
			document.querySelector('#rest_money').innerHTML=getMoney();
		}
	};
})();
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
		   $('#member_regist_form').addClass('form-horizontal');
		   $('#member_regist_form > div').addClass('form-group').addClass('form-group-lg');
		   $('#member_regist_form > div > label').addClass('col-sm-2').addClass('control-label');
		   $('#member_regist_form > div > div').addClass('col-sm-10');
		   $('#member_regist_form > div > div > input').addClass('form-control');
		   $('#member_regist_form #rd_major >label:gt(0)').addClass('radio-inline');
		   $('#member_regist_form #ck_subject').addClass('checkbox');
		   $('#member_regist_form #ck_subject >label').addClass('checkbox-inline');

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
	}
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
	
/*		spec : function (){
			setSsn(document.querySelector('#ssn').value);
			setName(document.querySelector('#name').value);
			var now = new Date().getFullYear();
			var ssnArr = getSsn().split("-");
			var ageResult1 = ssnArr[0];
			var genderResult = Number(ssnArr[1]);
			var ageResult0 = 0;
			switch (genderResult) {
			case 1: case 5: 
				setGender("남"); 
				ageResult0 = now - 1900-(ageResult1/10000);
				setAge(ageResult0.toString().split(".")[0]);
				break;
			case 3: case 7:
				setGender("남");
				ageResult0 = now - 2000-(ageResult1/10000);
				setAge(ageResult0.toString().split(".")[0]);
				break;
			case 2: case 6:
				setGender("여");
				ageResult0 = now - 1900-(ageResult1/10000);
				setAge(ageResult0.toString().split(".")[0]);
				break;
			case 4: case 8:
				setGender("여");
				ageResult0 = now - 2000-(ageResult1/10000);
				setAge(ageResult0.toString().split(".")[0]);
				break;

		}	
			document.querySelector('#result_name').innerHTML = getName();
			document.querySelector('#result_age').innerHTML = getAge();
			document.querySelector('#result_gender').innerHTML = getGender();
		}*/
		
	};	
})();
var kaup = (function () {
	var _name='',_result='';
	var init = function(){onCreate();};
	var setContentView = function (){};
	var onCreate = function(){
			
			setContentView();
			document.getElementById('bt_kaup_calc').addEventListener('click',this.calc,false);

	};
			return {
			kaup_init : function () {
				alert("init 호출 하는지 체크");
				var bt_kaup_calc = document.querySelector('#bt_kaup_calc');
				bt_kaup_calc.addEventListener('click', kaup_calc, false);
			},
			 kaup_go :function() {
				location.href = getContext() + "/douglas.do?page=kaup";
			},

			 kaup_calc:function() {
				var name = document.querySelector('#name').value;
				var height = document.getElementById('height').value;
				var weight = document.getElementById('weight').value;
				console.log('name' + name);
				console.log('height' + height);
				console.log('weight' + weight);

				var result = '';
				var kaup = weight * 10000 / (height * height);

				if (kaup < 18.5) {
					result = "저체중 ";
				} else if (kaup >= 18.5 && kaup < 22.9) {
					result = "정상체중";
				} else if (kaup >= 23.0 && kaup < 24.9) {

					result = "위험체중";
				} else if (kaup >= 25.0 && kaup < 29.9) {
					result = "비만 1단계";
				} else if (kaup >= 25.0 && kaup < 29.9) {
					result = "비만 2단계";
				} else if (kaup >= 40) {
					result = "비만 3단계";
				}

				document.getElementById('result').innerHTML = name + '  님의 카우프의 결과 '
						+ result;
				
			}
			};
		})();
var grade =(function(){
	var init = function(){onCreate();};
	var setContentView = function (){
		$('#grade_contents').addClass('box');
		$('#img_home').css('width', '30px');
		$('#grade_contents >article').css('width',' 300px').css('margin',' 0 auto').css('text-align',' center');
		$('#title').css('font-size', '40px');
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
	};
	var onCreate = function(){
		setContentView();
		
		
	};
	return {
		init : init,
		onCreate:onCreate
	};
})();

	
var admin= (function () {
	var _pass;
	var getPass= function() {return this._pass;};
	var setPass= function(pass) {this._pass=pass;};
	var init = function(){onCreate();};
	var setContentView = function (){};
	var onCreate = function(){
		setContentView();
		$('#admin_nav #member_mgmt #list').click(function(){controller.move('member','list');});
		$('#admin_nav #member_mgmt #find_by').click(function(){controller.move('member','find_by');});
		$('#admin_nav #member_mgmt #count').click(function(){controller.move('member','count');});
		$('#admin_nav #account_mgmt #b_delete').click(function(){controller.move('account','b_delete');});
		$('#admin_nav #account_mgmt #b_list').click(function(){controller.move('account','b_list');});
		$('#admin_nav #account_mgmt #b_search').click(function(){controller.move('account','b_search');});
		$('#admin_nav #account_mgmt #b_count').click(function(){controller.move('account','b_count');});
		
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
					var getPage = function() {return this._page;};
					var getDirectory = function() {return this._directory;};
					return{
						setPage : setPage,
						setDirectory:setDirectory,
						getPage:getPage,
						getDirectory:getDirectory,
						move : function(directory,page) {
							setDirectory(directory);
							setPage(page);
							location.href=
								app.context()+'/'+getDirectory()+'/'+getPage();
						},
						home : function() {location.href=app.context()+'/'	}
					};
				})();
		var util=(function() {
			return{
				isNumber : function(value) {
					 return typeof value === 'number' && isFinite(value);
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