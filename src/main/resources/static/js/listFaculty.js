
$(document).ready(function() {

	$.ajax({
		type : "GET",
		url : "/faculty",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			$('#faculty').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
			for(var i=0; i<msg.length; i++) {
				$('#faculty').append('<option value="' + msg[i].facultyCode+ '">' + msg[i].facultyName + '</option>');
			}
			
		}
	});
	$('#faculty').change(function () {
		$('#department').empty();
		var TestAjex = { "faculty" :  $('#faculty').val()};
		
		$.ajax({
			type : "POST",
			url : "/department",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#department').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#department').append('<option value="' + msg[i].departmentCode+ '">' + msg[i].departmentName + '</option>');
				}
				
			}
		});
	});//end faculty
});

