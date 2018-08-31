<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="form-group">
<label for="exampleInputEmail1">Position</label>
<select name="positionId" class="form-control" id="choice" 			 
	 onChange="ShowPosition(this.selectedIndex)">
		<option value="#">โปรด!! เลือกตำเเหน่ง</option>
		<option value="1">ตำเเหน่งวิชาการ</option>
		<option value="2">ตำเเหน่งผู้บริหาร</option>
		<option value="3">ตำเเหน่งวิชาชีพเฉพาะ</option>
		<option value="4">ตำเเหน่งทั่วไป</option>
</select>
 
<div id="Academic Position" style="display:none">
<label for="exampleInputEmail1">Position ตำเเหน่งวิชาการ</label>
	<select name="subPositionId" class="form-control">
		<option value="#">โปรด!! เลือกระดับ</option>
		<option value="1">ศาสตร์ตราจารย์</option>
		<option value="2">รองศาสตร์ตราจารย์</option>
		<option value="3">ผู้ช่วยศาสตร์ตราจารย์</option>
	</select>		
</div>                                  


<div id="Management Position" style="display:none">
<label for="exampleInputEmail1">Position ตำเเหน่งผู้บริหาร</label>
	<select name="subPositionId" class="form-control">
		<option value="#">โปรด!! เลือกระดับ</option>
		<option value="4">อธิการบดี</option>
		<option value="5">รองอธิการบดี</option>
		<option value="6">คณะบดี</option>
		<option value="7">หัวหน้าหน่วยงาน</option>
		<option value="8">ผู้ช่วยอธิการบดี</option>
		<option value="9">รองคณะบดี</option>
		<option value="10">ผู้อำนวยการสำนักงานอธิการบดี</option>
	</select>		
</div>

<div id="Professional Services" style="display:none">
<label for="exampleInputEmail1">Position ตำเเหน่งวิชาชีพเฉพาะ</label>
	<select name="subPositionId" class="form-control">
		<option value="#">โปรด!! เลือกระดับ</option>
		<option value="11">ระดับเชียวชาญพิเศษ</option>
		<option value="12">ระดับเชียวชาญ</option>
		<option value="13">ระดับชำนาญการพิเสษ</option>
		<option value="14">ระดับชำนาญการ</option>
		<option value="15">ระดับปฏิบัตการ</option>
	</select>		
</div>

<div id="General" style="display:none">
<label for="exampleInputEmail1">Department ตำเเหน่งทั่วไป </label>
	<select name="subPositionId" class="form-control">
		<option value="#">โปรด!! เลือกระดับ</option>
		<option value="16">ระดับชำนาญงานพิเศษ</option>
		<option value="17">ระดับชำนาญงาน</option>
		<option value="18">ปฏิบัติงาน</option>
	</select>		
</div>
</div>

</body>
</html>