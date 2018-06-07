// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree
$(document).ready(function(){
	/*setTimeout(function() {
    $('.notice').slideUp(200);
    $('.alert').slideUp(200);
  }, 3000);*/

	//New product
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

	//Edit product

	$('.edit-product').click(function(){
		//#alert("hello");
		var params= $(this).attr('href').split("/");
		console.log("params---->"+params[2]);
		$.ajax({
		url: "/products/:id/edit",
		type: "get",
		datatype: "html",
		data: {"pid":params[2]},
		success: function(result){
			$(".product-btn").hide();
			$(".new-product-view").html(result);


		},
		error: function(argument) {
		console.log("Fail..........")	

		}
	});
})
});