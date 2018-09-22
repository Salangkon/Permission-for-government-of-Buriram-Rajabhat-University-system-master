<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
</head>
<body>

<div style="size: 10" class="col-sm-4 sidenav" ></div>
<div style="size: 10" class="col-sm-3 sidenav" >

	<!-- คณะ  faculty -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">คณะ</label> 
		<select class="form-control" name="faculty" id="faculty">
			<option value="">== กรุณาเลือก ==</option>
		</select>
	</div>
	
	<!-- ภาควิชา  department -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ภาควิชา</label>
			<select class="form-control" name="department" id="department">
				<option value="">== กรุณาเลือก ==</option>
			</select>
	</div>
		<!-- ตำแหน่ง  position -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ตำแหน่ง</label> 
		<select class="form-control" name="position" id="position">
			<option value="">== กรุณาเลือก ==</option>
		</select>
	</div>
	
	<!-- ระดับ supPosition -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ภาควิชา</label>
			<select class="form-control" name="subPosition" id="subPosition">
				<option value="">== กรุณาเลือก ==</option>
			</select>
	</div>
</div>	

<!-- ตำแหน่ง รดับ -->
<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		type : "GET",
		url : "/position",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#position').append('<option value="' + msg[i].positionId+ '">' + msg[i].positionName + '</option>');
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
					$('#subPosition').append('<option value="' + msg[i].subPositionId+ '">' + msg[i].subPositionName + '</option>');
				}
				
			}
		});
	});
	$('#subPosition').change(function () {
		$('#pay').empty();
		var TestAjex = { "subPosition" :  $('#subPosition').val()};
		
		$.ajax({
			type : "POST",
			url : "/pay",
			data: JSON.stringify(TestAjex) ,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				$('#pay').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
				for(var i=0; i<msg.length; i++) {
					$('#pay').append('<option value="' + msg[i].id+ '">' + msg[i].allowance + '</option>');
				}
				
			}
		});
	});
});
</script>


<!-- คณะ ภาควิชา -->
<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		type : "GET",
		url : "/faculty",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#faculty').append('<option value="' + msg[i].facultyId+ '">' + msg[i].facultyName + '</option>');
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
					$('#department').append('<option value="' + msg[i].departmentId + '">' + msg[i].departmentName + '</option>');
				}
				
			}
		});
	});
});
</script>

</body>
</html>