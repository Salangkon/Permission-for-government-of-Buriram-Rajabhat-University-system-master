
$(document).ready(function() {
	// Drop Dawn ตำแหน่ง และ ระดับ
	$.ajax({
		type : "GET",
		url : "/position",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#position').append('<option value="' + msg[i].positionCode+ '">' + msg[i].positionName + '</option>');
			}
			
		}
	});
	$('#position').change(function () {
		$('#subPosition').empty();
		var TestAjex = { "position" :  $('#position').val()};
		
		$.ajax({
			type : "POST",
			url : "/subPosition",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#subPosition').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#subPosition').append('<option value="' + msg[i].supPositionCode+ '">' + msg[i].subPositionName + '</option>');
				}
				
			}
		});
	});//end position
});