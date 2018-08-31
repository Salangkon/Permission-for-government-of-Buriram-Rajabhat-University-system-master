$(document).ready(function() {

	$.ajax({
		type : "GET",
		url : "/province",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#province').append('<option value="' + msg[i].provinceId+ '">' + msg[i].provinceName + '</option>');
			}
			
		}
	});
	$('#province').change(function () {
		$('#amphur').empty();
		$('#district').empty();
		$('#district').append('<option value="'+'">' + "" + '</option>');
		var TestAjex = { "province" :  $('#province').val()};
		
		$.ajax({
			type : "POST",
			url : "/amphur",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#amphur').append('<option value="'+'">' + "" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#amphur').append('<option value="' + msg[i].amphurId+ '">' + msg[i].amphurName + '</option>');
				}
				
			}
		});
	});
	
	$('#amphur').change(function () {
		$('#district').empty();
		var TestAjex = { "province" :  $('#province').val()
					   , "amphur" :  $('#amphur').val()};
		$.ajax({
			type : "POST",
			url : "/district",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#district').append('<option value="'+'">' + "" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#district').append('<option value="' + msg[i].districtId+ '">' + msg[i].districtName + '</option>');
				}
				
			}
		});
	});
});