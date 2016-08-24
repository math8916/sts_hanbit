var member=(function() {
	return {
		init : function() {
			   $('#regist').click(function(){location.href=app.context()+"/member/regist"})
			   $('#find_by_id').click(function(){location.href=app.context()+"/member/find_by_id"})
			   $('#update').click(function(){location.href=app.context()+"/member/update"})
			   $('#delete').click(function(){location.href=app.context()+"/member/delete"})
			   $('#login').click(function(){location.href=app.context()+"/member/login"})
			   $('#logout').click(function(){location.href=app.context()+"/member/logout"})
			   $('#list').click(function(){location.href=app.context()+"/member/list"})
			   $('#find_by').click(function(){location.href=app.context()+"/member/find_by"})
			   $('#count').click(function(){location.href=app.context()+"/member/count"})
			   $('#member_content_img_home').attr('src',app.img()+'/home.png').css('width','30px');
			   $('#member_content_a_home').click(function(){location.href=app.context()+"/"})
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
			  
			   
		}
	};
})();