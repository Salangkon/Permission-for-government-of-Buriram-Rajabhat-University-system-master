<!DOCTYPE HTML>
<%@page import="com.hillert.model.UserBean"%>
<%@page import="org.springframework.context.annotation.Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ขออนุยาตไปราชการ</title>
	
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/A4.css">
</head>

<body>
	
<div class="book">

<!--บันทึกขออนุญาตไปราชการ -->
    <div class="page">

	<header align="center">มหาวิทยาลัยราชภัฏบุรีรัมย์ <br>บันทึกขออนุญาตไปราชการ</header><br>
	<hr>
<div style="margin-bottom: 4%">
	<label style="margin-right: 3%" >1. ส่วนราชการ :</label> <% %>
	<label style="margin-left: 3%;margin-right: 3%"> สังกัด : </label><% %>&nbsp;&nbsp;
	<label style="margin-left: 3%;margin-right: 3%"> วัน: </label> 12 <% %>
	<label style="margin-left: 3%;margin-right: 3%"> เดือน: </label> Novenber <% %>
	<label style="margin-left: 3%;margin-right: 3%"> ปี: </label> 2017 <% %>
</div>

<div style="margin-bottom: 4%"> 
	<label style="margin-right: 3%">2. ข้าพเจ้า : </label> <% %> <% %>
	<label style="margin-left: 15%;margin-right: 3%"> ตำเเหน่ง : </label> <% %>
	<br>
	<label style="margin-right: 3%">&nbsp;&nbsp;&nbsp; พร้อมด้วยคณะ  รวม  </label>  <% %> <label style="margin-left: 5%">(ดังรายชื่อที่ระบุในใบประมาณการรายจ่ายที่แนบ)</label>
</div>

<div style="margin-bottom: 4%">
	<label>3. ขอไปราชการในฐานะ : </label> &nbsp;&nbsp;
		<input name="v" type="radio">ผู้บริหาร    		&nbsp;&nbsp;
        <input name="v" type="radio">ผู้สอน			&nbsp;&nbsp;
        <input name="v" type="radio">ผู้สนับสนุนการสอน
	    <br >
	<label>&nbsp;&nbsp;&nbsp; เพื่อ (ระบุวัตถุประสงค์/ลักษณะงาน): </label><p><% %></p>	
	<p>&nbsp;&nbsp;&nbsp; ให้แนบเอกสารโครงการ/กิจกรรมที่ระบุรายละเอียด หรือ เหตุผลเพิ่อประกอบการพิจารณา (ถ้ามี) : </p>
</div>
	
<div style="margin-bottom: 4%">	
	<label>4. ไปราชการในวันที่   </label>&nbsp;&nbsp;<% %> <label> เดือน </label>&nbsp;&nbsp;<% %><label> พ.ศ. </label>&nbsp;&nbsp;<% %>
	<label> เวลาออกเดินทาง  </label>&nbsp;&nbsp;<% %>
	<br>
	<label>&nbsp;&nbsp;&nbsp; ถึงวันที่  </label>&nbsp;&nbsp;<% %> <label> เดือน</label>&nbsp;&nbsp;<% %> <label> พ.ศ.</label>&nbsp;&nbsp;<% %>
	<label> เวลาออกเดินทาง  </label>&nbsp;&nbsp;<% %>
</div>

<div style="margin-bottom: 4%">	
	<label>5. สถานที่ไปราชการ ชื่อหน่วยงาน</label>&nbsp;&nbsp;<% %>
	<br>
	<label>&nbsp;&nbsp;&nbsp; อำเภอ </label>&nbsp;&nbsp;<% %>
	<label>&nbsp;&nbsp;&nbsp; จังหวัด </label>&nbsp;&nbsp;<% %>
</div>

<div style="margin-bottom: 4%">	
	<label>6. งบประมาณ </label>&nbsp;&nbsp;
		<input name="v" type="checkbox"> เบิกค่าใช้จ่าย 		&nbsp;&nbsp;
		<input name="v" type="checkbox"> ตามสิทธื์    		&nbsp;&nbsp;
		<input name="v" type="checkbox"> เหมาจ่าย   		&nbsp;&nbsp;
		<input name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย   	&nbsp;&nbsp;
	<br><br>
	<label>&nbsp;&nbsp;&nbsp; โดยใช้งบประมาณ </label>
	<table style="margin-left: 3cm">
		<tr>
			<td ><input name="v" type="checkbox"> งบประมาณแผ่นดิน  		</td>
			<td> รหัส.......<% %></td>
		<tr>
			<td><input name="v" type="checkbox"> งบเงินรายได้			</td>
			<td> รหัส .......<% %></td>
		</tr>
		<tr>
			<td><input name="v" type="checkbox"> งบอื่นๆ.....<% %>	</td>
			<td> ..............	<% %></td>
		</tr>
	</table>
	
</div>
   
<div style="margin-bottom: 4%">	
<label>7. การเดินทาง </label>&nbsp;&nbsp;
	<table style="margin-left: 3cm">
		<tr>
			<td ><input name="v" type="checkbox"> ภาหนะประจำทาง <% %>	</td>
		
		<tr>
			<td><input name="v" type="checkbox"> ขอใช้รถไปราชการ  <% %> 		</td>
		
		</tr>
		<tr>
			<td><input name="v" type="checkbox"> ขอใช้รถส่วนตั <% %>	</td>
			<td> หมายเลขทะเบียน ......	<% %></td>
		</tr>
	</table>
</div>
  
<!--ตาราง การมอบหมายงานระหว่างไปราชการ  -->
<div style="margin-bottom: 6%">	
<label>8. การมอบหมายงานระหว่างไปราชการ </label>&nbsp;&nbsp;
  <table >
    <tr>
      <td>&nbsp;&nbsp;&nbsp; 8.1 งานสอนภาคปกติ</td>
      <td align="center"><input name="a" type="radio">&nbsp;มี&nbsp;&nbsp;<input name="#" type="text"  placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input name="a" type="radio">&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
      <td> &nbsp;&nbsp;&nbsp; 8.2 งานสอนภาค กศ.บป./บัณฑิตศึกษา</td>
   	  <td align="center"><input name="b" type="radio">&nbsp;มี&nbsp;&nbsp;<input name="#" type="text"  placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input name="b" type="radio">&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
      <td> &nbsp;&nbsp;&nbsp; 8.3 งานประจำเวร/ประจำวัน</td>
      <td align="center"><input name="c" type="radio">&nbsp;มี&nbsp;&nbsp;<input name="#" type="text"  placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input name="c" type="radio">&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
      <td> &nbsp;&nbsp;&nbsp; 8.4 งานอื่นๆ</td>
      <td align="center"><input name="d" type="radio">&nbsp;มี&nbsp;&nbsp;<input name="#" type="text"  placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input name="d" type="radio">&nbsp;&nbsp;ไม่มี</td>
    </tr>
  </table>
</div>

<div align="right">
	<label>(ลงชื่อ).....................ผู้ขออนุญาต</label><br>
	<label style="margin-right: 2cm">(........................)</label>
</div>
	</div>
	

 <!-- การพิจารณา -->
 	<div class="page">

	<header><b><u>การพิจารณา</u></b> ผ่านผู้บังคับบัญชาในสายงานที่ขอไปราชการตามลำดับ</header><br>
	<hr>
<div style="margin-bottom: 6%">
	<label style="margin-right: 3%" >1. <input name="v" type="checkbox"> หัวหน้าสาขาวิชา </label>
	<label style="margin-left: 3%;margin-right: 3%"><input name="v" type="checkbox"> หัวหน้างาน </label>
	<label style="margin-left: 3%;margin-right: 3%"><input name="v" type="checkbox"> หัวหน้าฝ่าย .......................
    </label>
    <br>
	<label style="margin-left: 3%;margin-right: 3%"> เห็นด้วย </label>
	<label style="margin-left: 3%;margin-right: 3%"><input name="v" type="checkbox"> อนุญาต </label> 
    <label style="margin-left: 5%;"> โดยใช้งบ........รหัส.........จำนวน......บาท </label> 
    <br>
	<label style="margin-left: 18%;margin-right: 3%"><input name="v" type="checkbox"> ไม่อนุญาต </label> 
    <label style="margin-left: 3%;">เนื่องจาก.............................. </label> 
    <br>
    <div align="center" style="margin-top: 3%">
       <label >ลงชื่อ......................</label> <br>
       <label >(...........................)</label> <br>
       <label >......../......../........</label> 
    </div>
</div>

<div style="margin-bottom: 6%">
	<label >2. <input name="v" type="checkbox"> หัวหน้าภาควิชา </label>
	<label ><input name="v" type="checkbox"> ผู้อำนวยการกอง </label>
	<label ><input name="v" type="checkbox"> หัวหน้าสำนักงานเลชานุการคณะ / สำนัก / สถาบัน
    </label>
    <br>
	<label style="margin-left: 3%;margin-right: 3%"> เห็นด้วย </label>
	<label style="margin-left: 3%;margin-right: 3%"><input name="v" type="checkbox"> อนุญาต </label> 
    <label style="margin-left: 5%;"> โดยใช้งบ........รหัส.........จำนวน......บาท </label> 
    <br>
	<label style="margin-left: 18%;margin-right: 3%"><input name="v" type="checkbox"> ไม่อนุญาต </label> 
    <label style="margin-left: 3%;">เนื่องจาก.............................. </label> 
    <br>
    <div align="center" style="margin-top: 5%">
       <label >ลงชื่อ......................</label> <br>
       <label >(...........................)</label> <br>
       <label >......../......../........</label> 
    </div>
</div>

<div style="margin-bottom: 6%">
	<label >3. การสั่งการ </label><br>
	<label  style="margin-left: 2%;"><input name="v" type="checkbox"> อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label>
	<label ><input name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label>
	<label ><input name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย </label>
    <br>
	<label style="margin-left: 2%;"><input name="v" type="checkbox"> ไม่อนุญาต </label>
    <br>
	<label style="margin-left: 2%;"><input name="v" type="checkbox"> นำเสนอรองอธิการบดี (เกิน 30,000)</label> 
    <br>
    <div style="margin-left: 20%;margin-top: 4%">
       <label >......................คณะบดี / ผอ.สำนัก / ผอ.สถาบัน ปฏิบัติราชการแทนอธิการบดี</label> <br>
       <label >...../....../........</label> 
    </div>
    <div style="margin-left: 20%;margin-top: 4%;margin-bottom: 6%">
       <label >......................ผู้ช่วยอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label> <br>
       <label >...../....../........</label> 
    </div>
    <label  style="margin-left: 2%;"><input name="v" type="checkbox"> อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label>
	<label ><input name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label>
	<label ><input name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย</label>
    <br>
	<label style="margin-left: 2%;"><input name="v" type="checkbox"> ไม่อนุญาต </label>
    <br>
	<label style="margin-left: 2%;"><input name="v" type="checkbox"> นำเสนอรองอธิการบดี (เกิน 50,000) </label> 
    <br>
    <div style="margin-left: 20%;margin-top: 4%;margin-bottom: 6%">
       <label >......................รองอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label> <br>
       <label >...../....../........</label>
    </div>
	<label  style="margin-left: 2%;"><input name="v" type="checkbox"> อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label>
	<label ><input name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label>
	<label ><input name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย</label>
    <br>
	<label style="margin-left: 2%;"><input name="v" type="checkbox"> ไม่อนุญาต </label>	
    <br>
    <div style="margin-left: 20%;margin-top: 4%;margin-bottom: 6%">
       <label >......................อธิการบดี / รองอธิการบดีฝ่ายรักษาราชการแทนอธิการบดี</label> <br>
       <label >...../....../........</label>
    </div>

	</div>	
</div>
</div>



<div class="pagePortrait">
<!-- สรุป -->
<div style="size: 10;margin-bottom: 5%" class="col-sm-12" > 
	<table id="customers" style="margin-bottom: 10mm;margin-top: 10mm">
		<tr>
   			<th rowspan="2">ลำดับ</th><th rowspan="2">ชื่อ-สกุล</th><th rowspan="2">ตำแหน่ง</th>
			<th rowspan="2">ค่าเบี๋ยเลียง</th><th rowspan="2">ค่าที่พัก</th> <th rowspan="2">ค่าภาหนะ</th>
		    <th rowspan="2">ค่าใช้จ่ายอื่นๆ</th><th colspan="2">รวมเงิน</th>
		</tr> 
		<tr>
			<th>บาท</th>
			<th>สตางค์</th>
		</tr>	
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
			
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		
		<tr><td style="background-color: yellow;" align="center">รวม</td><td colspan="2"> <label style="margin-left: 90%">คน</label></td>
			<td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
	</table>    
</div>    
</div>



</body>
</html>
