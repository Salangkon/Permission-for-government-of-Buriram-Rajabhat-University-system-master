<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="form-group">     
<label for="exampleInputEmail1">Faculty</label>
<select name="facultyId" class="form-control" id="choice" 			
  onChange="ShowReg(this.selectedIndex)">
		<option value="#">โปรด!! เลือกคณะ</option>
		<option value="1">คณะครุศาสตร์</option>
		<option value="2">คณะวิทยาศาสตร์</option>
		<option value="3">คณะวิทยาการจัดการ</option>
		<option value="4">คณะเทคโนโลยีอุตสาหกรรม</option>
		<option value="5">คณะเทคโนโลยีการเกษตร</option>
		<option value="6">คณะเทคโนโลยีการเกษตร</option>
</select>
  		     
<div class="form-group" id="Department ED" style="display:none">
<label for="exampleInputEmail1">Department ครุศาสตร์</label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="1">สาขาวิชาเทคโนโลยีและนวัตกรรมศึกษา</option>
		<option value="2">สาขาวิชาเทคโนโลยีและคอมพิวเตอร์เพื่อการศึกษา</option>
		<option value="3">สาขาวิชาภาษาไทย</option>
		<option value="4">สาขาวิชาภาษาอังกฤษ</option>
		<option value="5">สาขาวิชาการศึกษาปฐมวัย</option>
		<option value="6">สาขาวิชาสังคมศึกษา</option>
		<option value="7">สาขาวิชาคณิตศาสตร์</option>
		<option value="8">สาขาวิชาฟิสิกส์</option>
		<option value="9">สาขาวิชาวิทยาศาสตร์ทั่วไป</option>
		<option value="10">สาขาวิชาพลศึกษา</option>
		<option value="11">สาขาวิชาดนตรีศึกษา</option>
		<option value="12">สาขาวิชาศิลปสึกษา</option>
		<option value="13">สาขาวิชานาฏสิลป์</option>
		<option value="14">สาขาวิชาวิจัยและประเมิลผลการศึกษา</option>
		<option value="15">สาขาวิชาบริหารการศึกษา</option>
		<option value="16">สาขาวิชาหลักสูตรและรียนการสอน</option>
		<option value="17">สาขาวิชาดนตรีศึกษา (ป.ตรี)</option>
	</select>		
</div>                                  


<div class="form-group" id="Department SC" style="display:none">
<label for="exampleInputEmail1">Department วิทยาสาศตร์</label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="18">สาขาวิชาคณิตศาสตร์</option>
		<option value="19">สาขาวิชาเคมี</option>
		<option value="20">สาขาวิชาฟิสิกส์</option>
		<option value="21">สาขาวิชาชีววิทยา</option>
		<option value="22">สาขาวิชาสถิติประยุกต์</option>
		<option value="23">สาขาวิชาวิทยาศาสตร์การกีฬา</option>
		<option value="24">สาขาวิชาวิทยาการคอมพิวเตอร์</option>
		<option value="25">สาขาวิชาวิทยาศาสตร์สิ่งทอ</option>
		<option value="26">สาขาวิชาสาธารสุขชุมชน</option>
		<option value="27">สาขาวิชาภูมิสาสตร์และภูมิสารสนเทศ</option>
		<option value="28">สาขาวิชาวิทยาศาสตร์สิ่งแวดล้อม</option>
		<option value="29">สาขาวิชาเทคโนโลยีสารสนเทศ</option>
	</select>		
</div>

<div class="form-group" id="Department HAS" style="display:none">
<label for="exampleInputEmail1">Department มนุษยศาสตร์และสังคมศาสตร์</label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="30">สาขาวิชาภาษาไทย ศศ.บ</option>
		<option value="31">สาขาวิชาภาษาอังกฤษ</option>
		<option value="32">สาขาวิชาภาษาอังกฤษธุรกิจ</option>
		<option value="33">สาขาวิชานิติศาสตร์</option>
		<option value="34">สาขาวิชารัฐศาสนศาสตร์</option>
		<option value="35">สาขาวิชาการพัฒนาสังคม</option>
		<option value="36">สาขาวิชาดนตร์</option>
		<option value="37">สาขาวิชาบรรณารักษศาสตร์</option>
		<option value="38">สาขาวิชาศิลปะดิจิทัล</option>
	</select>		
</div>

<div class="form-group" id="Department MNM" style="display:none">
<label for="exampleInputEmail1">Department วิทยาการจัดการ </label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="39">สาขาวิชาการตลาด</option>
		<option value="40">สาขาวิชาบัญชี</option>
		<option value="41">สาขาวิชาการจัดการ</option>
		<option value="42">สาขาวิชาเศรษฐศาสตร์</option>
		<option value="43">สาขาวิชาคอมพิวเตอร์ธุระกิจ</option>
		<option value="44">สาขาวิชาการสื่อสารมวลชน</option>
		<option value="45">สาขาวิชาการเงินและการธนาคาร</option>
		<option value="46">สาขาวิชาบริหารทรัพยากรมนุษย์</option>
		<option value="47">สาขาวิชาการท่องเที่ยวและการโรงแรม</option>
		<option value="48">สาขาวิชาเศรษฐสาสตร์ มหาบัณฑิต(ป.โท)</option>
	</select>	
</div>

<div class="form-group" id="Department IDT" style="display:none">
<label for="exampleInputEmail1">Department เทคโนโลยีอุตสาหกรรม </label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="49">สาขาวิชาเทคโนโลยีวิศวะกรรมโยธา</option>
		<option value="50">สาขาวิชาเทคโนโลยีสถาปัตยกรรม</option>
		<option value="51">สาขาวิชาเทคโนโลยีวิศวกรรมไฟฟ้า</option>
		<option value="52">สาขาวิชาวิศวกรรมการจัดการอุตสาหกรรม</option>
		<option value="53">สาขาวิชาเทคโนโลยีออกแบบผลิตภัณฑ์อุตสาหกรรม</option>
		<option value="54">สาขาวิชาเทคโนโลยีเซรามิกส์และการออกแบบ</option>
	</select>	
</div>


<div class="form-group" id="Department AT" style="display:none">
<label for="exampleInputEmail1">Department เทคโนโลยีการเกษตร </label>
	<select name="departmentId" class="form-control">
		<option value="#">โปรด!! เลือกสาขา</option>
		<option value="55">สาขาวิชาประมง</option>
		<option value="56">สาขาวิชาเกษตร</option>
		<option value="57">สาขาวิชาสัตวศาสตร์</option>
	</select>		
</div>
</div>

</body>
</html>