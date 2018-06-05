$(document).ready(function(){
console.log("one")
$('#new_product_id').click(function(){
	$.ajax({
		url: "/products/new",
		type: "get",
		datatype: "html",
		data: "result",
		success: function(result){
			$(".product-btn").hide();
			$(".new-product-view").append(result);
			console.log("success")


		},
		error: function(argument) {
		console.log("Fail..........")	
		}
	});


})
})





