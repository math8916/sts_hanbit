var app=(function(){
		var init = function(context) {
			sessionStorage.setItem('context',context);
			sessionStorage.setItem('js',context+'/resources/js');
			sessionStorage.setItem('css',context+'/resources/css');
			sessionStorage.setItem('img',context+'/resources/img');
			
			move();
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
	