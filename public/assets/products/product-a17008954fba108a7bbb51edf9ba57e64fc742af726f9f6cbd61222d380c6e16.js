$(document).ready(function(){$("#new_product_id").on("click",function(){$.ajax({url:"/products/new",type:"get",datatype:"data",success:function(){console.log("success")},error:function(){console.log("Fail..........")}})})});