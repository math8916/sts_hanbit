var admin= (function () {
		var _pass;
		var getPass= function() {return this._pass;};
		var setPass= function(pass) {this._pass=pass;};
		return{
			getPass :getPass,
			setpass :setPass,
			init : function() {
				$('#a_admin').click(function(){});
			},
			check : function() {
				setPass(1);
				var isAdmin=window.confirm('관리자입니까? :');
				if (!isAdmin) {
					alert('관리자만 접근 가능합니다');
				} else {
					var password=prompt('관리자 비번을 입력해라');
					if (password==getPass()) {
						location.href=sessionStorage.getItem('context')+'/global.do'; 
							}else {
								alert('비번이 틀림')
							}
				}
			}
		};
})();