var app=(function(){
		var init = function(context) {
			sessionStorage.setItem('context',context);
			sessionStorage.setItem('js',context+'/resources/js');
			sessionStorage.setItem('css',context+'/resources/css');
			sessionStorage.setItem('img',context+'/resources/img');
			
			move();
			$('#global_content').addClass('box');
			$('#global_content h2').text('서비스 이용하려면 회원 가입하세요');
			$('#global_content_a_regist').text(' SIGN IN')
			.click(function() {location.href=app.context()+'/member/regist'	;});	
			$('#global_content_a_login').text(' LOG IN')
			.click(function() {location.href=app.context()+'/member/login'	;});	
			$('#global_content_a_admin').text(' ADMIN').click(function(){admin.check()});	
			
		
		} ;
		var context= function() {
			return sessionStorage.getItem('context');
		} ; 
		var js = function() {
			return sessionStorage.getItem('js');
		}
		var css = function() {
			return sessionStorage.getItem('css');
		}
		var img = function() {
			return sessionStorage.getItem('img');
		}
		var to_douglas = function() {
		
			location.href=context()+"/douglas.do";
			console.log("to-douglas:"+context);
		} ;
		var move = function() {
			$('#title').click(function(){
			location.href=context()+"/";
		}) ;
			$('#a_member').click(function(){	location.href= context() + "/member/main";
			});


			$('#a_grade').click(function(){
				location.href=context() + "/grade/main";
			});


			$('#a_account').click(function(){
				location.href=context() + "/account/main";
			});

			$('#a_school').click(function(){
				location.href=context() + "/school_info";
			});
}
		return{
			init :init,
			to_douglas : to_douglas,
			move:move,
			context:context,
			img:img,
			js:js,
			css:css
			
		}
})();
		
		var admin= (function () {
			var _pass;
			var getPass= function() {return this._pass;};
			var setPass= function(pass) {this._pass=pass;};
			return{
				getPass :getPass,
				setpass :setPass,
				
				check : function() {
					setPass(1);
					var isAdmin=window.confirm('관리자입니까? :');
					if (!isAdmin) {
						alert('관리자만 접근 가능합니다');
					} else {
						var password=prompt('관리자 비번을 입력해라');
						if (password==getPass()) {
							location.href=app.context+'/global.do'; 
								}else {
									alert('비번이 틀림')
								}
					}
				}
			};

})();
	