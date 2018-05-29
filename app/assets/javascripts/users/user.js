$(document).ready(function(){
	$('#search_id').bind('click keyup',function(){
		var params = $('#search_text').val();
		$.ajax({
        url: "/user/search",
        type: "post",
        data: {search_data: params},
        dataType: "html",
        success: function(result){
              
               console.log(result)
               $("#search-result").html(result)

        },
        error: function(){
               console.log("fail")
         }
	});
		
	});
	
	
});