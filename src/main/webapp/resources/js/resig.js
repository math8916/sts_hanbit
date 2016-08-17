var  grade =(function(){

	return{
		init :function() {
			$('#grade_contents').addClass('box');
			$('#img_home').css('width', '30px');
			$('#grade_contents >article')
			.css('width',' 300px').css('margin',' 0 auto')
					.css('text-align',' center');

			$('#title').css('font-size', '40px');
			$('#a_regist').click(function() {
				location.href = "${context }/grade?page=regist";
			});
			$('#a_update').click(function() {
				location.href = "${context }/grade?page=update";
			});
			$('#a_delete').click(function() {
				location.href = "${context }/grade?page=delete";
			});
			$('#a_list').click(function() {
				location.href = "${context }/grade?page=list";
			});
			$('#a_count').click(function() {
				location.href = "${context }/grade?page=count";
			});
			$('#a_search').click(function() {
				location.href = "${context }/grade?page=search";
			});
		}
			
	
	};
})();