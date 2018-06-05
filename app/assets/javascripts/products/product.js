$(document).ready(function(){

$('#new_product_id').click(function(){
	$.ajax({
		url: "/products/new",
		type: "get",
		datatype: "html",
		data: "result",
		success: function(result){
			console.log("success")

		},
		error: function(argument) {
		console.log("Fail..........")	
		}
	});


})
})





