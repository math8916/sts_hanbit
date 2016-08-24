var grade =(function(){

	return{
		init :function() {
			$('#grade_contents').addClass('box');
			$('#img_home').css('width', '30px');
			$('#grade_contents >article')
			.css('width',' 300px').css('margin',' 0 auto')
					.css('text-align',' center');

			$('#title').css('font-size', '40px');
			$('#a_regist').click(function() {
				location.href = app.context()+"/grade/regist"
			})
			$('#a_update').click(function() {
				location.href = app.context()+"/grade/update"
			});
			$('#a_delete').click(function() {
				location.href =app.context()+"/grade/delete"
			});
			$('#a_list').click(function() {
				location.href = app.context()+"/grade/list"
			});
			$('#a_count').click(function() {
				location.href =app.context()+"/grade/count"
			});
			$('#a_search').click(function() {
				location.href =app.context()+"/grade/search"
			});
		}
			
	
	};
})();