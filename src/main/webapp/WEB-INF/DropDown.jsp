<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>

<div style="size: 10" class="col-sm-4 sidenav" ></div>
<div style="size: 10" class="col-sm-3 sidenav" >

	<!-- จังหวัด province -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">จังหวัด</label> 
		<select class="form-control" name="province" id="province">
			<option value="">== กรุณาเลือก ==</option>
		</select>
	</div>
	
	<!-- อำเภอ Amphur -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">อำเภอ</label>
			<select class="form-control" name="amphur" id="amphur">
				<option value="">== กรุณาเลือก ==</option>
			</select>
	</div>
	
	<!-- ตำบล  District -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ตำบล</label>
		<select class="form-control" name="district" id="district">
			<option value="">== กรุณาเลือก ==</option>
		</select>
	</div>
	
</div>

	

<script type="text/javascript">
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
		$('#district').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
		var TestAjex = { "province" :  $('#province').val()};
		
		$.ajax({
			type : "POST",
			url : "/amphur",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#amphur').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
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
				$('#district').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#district').append('<option value="' + msg[i].districtId+ '">' + msg[i].districtName + '</option>');
				}
				
			}
		});
	});
});
</script>


</body>
</html>