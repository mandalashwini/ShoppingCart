$(document).ready(function(){
	$('#search_id').on('click',function(){
		var params = $('#search_text').val();
		$.ajax({
        url: "/user/search_result",
        type: "post",
        data: {search_data: params},
        dataType: "html",
        success: function(result){
              
               console.log(result.class)
               if(result == "")
                alert("search not found!!")
               else
               $("#search-result").html(result)

        },
        error: function(){
               console.log("fail")
         }
	});
		
	});
	
	
});