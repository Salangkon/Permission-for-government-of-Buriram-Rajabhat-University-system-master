//insert
$(document).ready(function() {	
//	console.log(warranty)
	$('#updateRole').click(function(){
		
		var userBean = {
				role         : $('#role').val()
		}
		$.ajax({
	        type: "POST",
	        url: "/updateRole",
	        data: JSON.stringify(userBean),
	        dataType: "json",
	        async: false,
	        contentType: "application/json; charset=utf-8",
	        success: function (res) {
	        	console.log(res)
	        	window.location.href = res.page;
	        },
		 	error: function () {
		 		window.location.href = "gotoUpdate/{values}";	
		    }
		});
		
	});//and userBaan

});