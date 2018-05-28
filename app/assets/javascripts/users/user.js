$(document).ready(function(){
	$('#search_id').click(function(){
		var params = $('#search_text').val();
		$.ajax({
        url: "/user/search",
        type: "post",
        data: {search_data: params},
        dataType: "json",
        success: function(result){
               console.log(JSON.stringify(result));
        },
        error: function(){
               alert("fail"); 
         }
	});
		
	});
	
	
});