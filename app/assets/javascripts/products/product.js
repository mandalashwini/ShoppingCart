$(document).ready(function(){

$('#new_product_id').on('click', function(){
	$.ajax({
		url: "/products/new",
		type: "get",
		success: function(result){
			console.log("success")

		},
		error: function(argument) {
		console.log("Fail..........")	
		}
	});

})
})





