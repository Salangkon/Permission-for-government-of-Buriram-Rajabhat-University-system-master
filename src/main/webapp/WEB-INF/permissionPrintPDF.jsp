<%@page import="com.hillert.model.PermissionBackBean"%>
<%@page import="com.hillert.model.TravelExpensesFuelCostBean"%>
<%@page import="com.hillert.model.TravelBean"%>
<%@page import="com.hillert.model.ExpenseSumaryBean"%>
<%@page import="com.hillert.model.PermissionBean"%>
<%@page import="com.hillert.model.TravelExpensesBean"%>
<%@page import="com.hillert.model.ExpenseEstimateBean"%>
<%@page import="java.util.List"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ขออนุยาตไปราชการ</title>

<link rel="stylesheet" href="/css/A4.css">
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/w3.css">

<script>
	function w3_open() {
		document.getElementById("main").style.marginLeft = "180px";
		document.getElementById("mySidebar").style.width = "180px";
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("openNav").style.display = 'none';
	}
	function w3_close() {
		document.getElementById("main").style.marginLeft = "0";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
	}
</script>
<script>
	//Print PDF
	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
</script>

<%
	List<ExpenseEstimateBean> beanEE = null;
	List<TravelExpensesBean> beanTr = null;
	PermissionBean bean = null;
	PermissionBackBean beanBack = null;
	ExpenseSumaryBean beanEs = null;
	ExpenseSumaryBean beanEsBack = null;
	TravelExpensesFuelCostBean beanTEFC = null;
	String result = "";
%>
<%
	beanEE = (List<ExpenseEstimateBean>) request.getAttribute("beanEE");
	beanTr = (List<TravelExpensesBean>) request.getAttribute("beanTr");
	beanTEFC = (TravelExpensesFuelCostBean) request.getAttribute("beanTEFC");
	beanEs = (ExpenseSumaryBean) request.getAttribute("beanEs");
	beanEsBack = (ExpenseSumaryBean) request.getAttribute("beanEsBack");
	bean = (PermissionBean) request.getAttribute("perBean");
	beanBack = (PermissionBackBean) request.getAttribute("perBackBean");
	result = (String) request.getAttribute("messesUpdate");
%>

</head>

<body>
	<!-- 	 onload="window.print();"  -->

	<div class="w3-sidebar w3-light-grey w3-card-4 w3-animate-left"
		style="width: 200px" id="mySidebar">
		<div class="w3-bar w3-dark-grey">
			<span class="w3-bar-item w3-padding-16">Manu</span>
			<button onclick="w3_close()"
				class="w3-bar-item w3-button w3-right w3-padding-16"
				title="close Sidebar">&times;</button>
		</div>
		<div class="w3-bar-block">
			<div class="w3-dropdown-hover">
				<a class="w3-button" href="#">เลือกหน้า<i
					class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a class="w3-bar-item w3-button" href="#1"> บันทึกขออนุญาต </a> 
					<a class="w3-bar-item w3-button" href="#2"> การพิจารณาไปราชการ </a> 
					<a class="w3-bar-item w3-button" href="#3"> ประมาณการรายจ่าย </a> 
					<a class="w3-bar-item w3-button" href="#4"> รายละเอียดรายจ่าย </a>
				</div>
			</div>
			<a class="w3-bar-item w3-button" href="javascript:void(0)"
				onclick="printDiv('printableArea')">พิมพ์ บันทึกขออนุญาต</a> <a
				class="w3-bar-item w3-button w3-green" href="/welcomeUser">ย้อนกลับ</a>
		</div>
	</div>

	<div id="main" style="margin-left: 200px">

		<div class="w3-container w3-display-container"
			style="background-color: gray;" id="grad1">
			<span title="open Sidebar" style="display: none" id="openNav"
				class="w3-button w3-transparent w3-display-topleft w3-xlarge"
				onclick="w3_open()">&#9776;</span>


			<div id="printableArea">
				<div class="page" id="1">
					<table style="width: 100%; border-collapse: collapse;">
						<tr>
							<td style="text-align: center;"><b>มหาวิทยาลัยราชภัฏบุรีรัมย์
									<br>บันทึกขออนุญาตไปราชการ
							</b></td>
						</tr>
					</table>
					<hr>
					<br>

					<table style="width: 100%;">
						<tr>
							<th style="max-width: 6mm; text-align: left">1. ส่วนราชการ</th>
							<th style="max-width: 10mm;"> <%=bean.getDepartmentName()%></th>
							<th style="max-width: 2mm;">สังกัด</th>
							<th style="max-width: 10mm; text-align: left;"><%=bean.getFacultyName()%></th>
						</tr>
					</table>
					<table style="width: 100%;">
						<tr>
							<th style="max-width: 3mm; right: 1em; text-align: left">&nbsp;&nbsp; วันที่ </th>
							<th style="max-width: 3mm; right: 1em; text-align: center;"><%=bean.getDateDay()%></th>
							<th style="max-width: 4mm; right: 1em; text-align: center"> เดือน</th>
							<th style="max-width: 10mm; right: 1em; text-align: center"><%=bean.getDateMonth()%></th>
							<th style="max-width: 30mm; right: 1em; text-align: left">พ.ศ. <%=bean.getDateYear()%></th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="max-width: 4mm; text-align: left"><label>2. ข้าพเจ้า</label></th>
							<th style="max-width: 12mm;"> <%=bean.getSex()%><%=bean.getUserFname()%>&nbsp;&nbsp; <%=bean.getUserLname()%></th>
							<th style="max-width: 2.5mm;">ตำเเหน่ง</th>
							<th style="max-width: 8mm;"> <%=bean.getDepartmentName()%></th>
						</tr>
						<tr>
							<th colspan="4" style="text-align: left">&nbsp;&nbsp;
								พร้อมด้วยคณะ รวม &nbsp;&nbsp; <%=beanEs.getUserSumTotal()%> คน (ดังรายชื่อที่ระบุในใบประมาณการรายจ่ายที่แนบ)
							</th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="max-width: 100%; text-align: left">3.ขอไปราชการในฐานะ : &nbsp;&nbsp; 
								( <%if (bean.getStatus().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;");}%> ) ผู้บริหาร &nbsp;&nbsp; 
								( <%if (bean.getStatus().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;");}%> ) ผู้สอน &nbsp;&nbsp; 
								( <%if (bean.getStatus().equals("3")) {out.print("&#10003;");} else {out.print(" &nbsp;");}%> ) ผู้สนับสนุนการสอน
							</th>
						</tr>
						<tr>
							<th colspan="4" style="text-align: left; height: 20mm;"
								valign="top">&nbsp;&nbsp;&nbsp; เพื่อ
								(ระบุวัตถุประสงค์/ลักษณะงาน) &nbsp;&nbsp;&nbsp; <%=bean.getObject()%>
							</th>
						</tr>
						<tr>
							<th style="max-width: 4mm; text-align: left">&nbsp;&nbsp;&nbsp;ให้แนบเอกสารโครงการ/กิจกรรมที่ระบุรายละเอียด หรือ เหตุผลเพิ่อประกอบการพิจารณา (ถ้ามี) </th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="width: 10%; text-align: left">4.ไปราชการในวันที่</th>
							<th style="width: 5%;"> <%=bean.getGoDateDay()%></th>
							<th style="width: 3%;"> เดือน</th>
							<th style="width: 3%;"> <%=bean.getGoDateMonth() %></th>
							<th style="width: 2%;"> พ.ศ.</th>
							<th style="width: 4%;"> <%=bean.getGoDateYear()%></th>
							<th style="width: 13%;">ออกเดินทางเวลา</th>
							<th style="width: 8%;"> <%=bean.getGoTime()%></th>
						</tr>
						<tr>
							<th>&nbsp;&nbsp;&nbsp; ถึงวันที่</th>
							<th> <%=bean.getBackDateDay()%></th>
							<th> เดือน</th>
							<th> <%=bean.getBackDateMonth()%></th>
							<th> พ.ศ.</th>
							<th> <%=bean.getBackDateYear()%></th>
							<th>เดินทางกลับถึงเวลา</th>
							<th><%=bean.getBackTime()%></th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="max-width: 6mm; text-align: left">5.
								สถานที่ไปราชการ ชื่อหน่วยงาน</th>
							<th style="max-width: 12mm; text-align: left"><%=bean.getDestinationName()%></th>
						</tr>
						<tr>
							<th style="max-width: 6mm; text-align: left">&nbsp;&nbsp;&nbsp; อำเภอ &nbsp;&nbsp;&nbsp; <%=bean.getAmphur()%></th>
							<th style="max-width: 12mm; text-align: left">จังหวัด &nbsp;&nbsp;&nbsp; <%=bean.getProvince()%></th>
						</tr>
					</table>
					<br>
					<table style="width: 100%; border-collapse: collapse;">
						<tr>
							<th style="max-width: 4.5mm; text-align: left">6. งบประมาณ</th>
							<th style="max-width: 18mm; text-align: left">
							( <%if (bean.getBudget().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) เบิกค่าใช้จ่าย &nbsp;&nbsp; 
							( <%if (bean.getBudgetExpenses().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;");}%> ) ตามสิทธื์ &nbsp;&nbsp; 
							( <%if (bean.getBudgetExpenses().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;");}%> ) เหมาจ่าย &nbsp;&nbsp;
							</th>
						</tr>
						<tr>
							<th style="max-width: 4mm; text-align: left"></th>
							<th style="max-width: 18mm; text-align: left">
							( <%if (bean.getBudget().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp;");}%> ) ไม่เบิกค่าใช้จ่าย &nbsp;&nbsp;
							</th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="width: 18mm; text-align: left">&nbsp;&nbsp;&nbsp;โดยใช้งบประมาณ</th>
							<th style="width: 25mm; text-align: left">
							( <%if (bean.getBudgetBy().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบแผ่นดิน  &nbsp;&nbsp;โครงการ&nbsp;&nbsp;
							</th>
							<th style="width: 20mm; text-align: left">
								<%if (bean.getBudgetBy().equals("1")) {out.print(bean.getBudgetProject());}%>
							</th>
							<th style="width: 3mm; text-align: left">รหัสโครงการ</th>
							<th style="width: 15mm; text-align: left">
								<%if (bean.getBudgetBy().equals("1")) {out.print(bean.getBudgetPass());}%>
							</th>
						</tr>
						<tr>
							<th style="max-width: 12mm; text-align: left"></th>
							<th style="max-width: 18mm; text-align: left">
							( <%if (bean.getBudgetBy().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบเงินรายได้ &nbsp;&nbsp;โครงการ&nbsp;&nbsp;
							</th>
							<th style="max-width: 15mm; text-align: left">
								<%if (bean.getBudgetBy().equals("2")) {out.print(bean.getBudgetProject());}%>
							</th>
							<th style="max-width: 10mm; text-align: left">รหัสโครงการ</th>
							<th style="max-width: 12mm; text-align: left">
								<%if (bean.getBudgetBy().equals("2")) {out.print(bean.getBudgetPass());}%>
							</th>
						</tr>
						<tr>
							<th style="max-width: 12mm; text-align: left"></th>
							<th style="max-width: 18mm; text-align: left">
							( <%if (bean.getBudgetBy().equals("3")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบอื่นๆ
							</th>
							<th style="max-width: 15mm; text-align: left" colspan="3"></th>
						</tr>
						<tr>
							<th style="max-width: 12mm; text-align: left"></th>
							<th style="max-width: 18mm; text-align: left">ในวงเงิน &nbsp;&nbsp; <%=beanEs.getExpenseEstimateSumTotal()%>
							</th>
							<th style="max-width: 12mm; text-align: left" colspan="3">บาท </th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="max-width: 7.2mm; text-align: left">7. การเดินทาง</th>
							<th style="max-width: 18mm; text-align: left" colspan="2">
							( <%if (bean.getTravel().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ภาหนะประจำทาง</th>
						</tr>
						<tr>
							<th style="max-width: 7mm; text-align: left"></th>
							<th style="max-width: 18mm; text-align: left" colspan="2">
							( <%if (bean.getTravel().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ขอใช้รถไปราชการ</th>
						</tr>
						<tr>
							<th style="max-width: 7mm; text-align: left"></th>
							<th style="max-width: 10mm; text-align: left">
							( <%if (bean.getTravel().equals("3")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ขอใช้รถส่วนตัว</th>
							<th style="max-width: 20mm; text-align: left">หมายเลขทะเบียน</th>
						</tr>
					</table>
					<br>
					<!--ตาราง การมอบหมายงานระหว่างไปราชการ  -->
					<table style="width: 100%;">
						<tr>
							<th style="text-align: left;">8.การมอบหมายงานระหว่างไปราชการ </th>
						</tr>
					</table>
					<table style="width: 100%; border-collapse: collapse;">
						<tr>
							<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;8.1 งานสอนภาคปกติ</th>
							<th style="width: 30mm; text-align: left;">
							( <%if (bean.getCommitA().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ไม่มี</th>
							<th style="width: 22mm; text-align: left;">
							( <%if (bean.getCommitA().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) มี</th>
							<th style="width: 100mm; text-align: left;">มอบหมายให้&nbsp;&nbsp; <%=bean.getCommitADt()%>
							</th>
						</tr>
						<tr>
							<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;8.2 งานสอนภาค กศ.บป./บัณฑิตศึกษา</th>
							<th style="width: 30mm; text-align: left;">
							( <%if (bean.getCommitB().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ไม่มี</th>
							<th style="width: 22mm; text-align: left;">
							( <%if (bean.getCommitB().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) มี</th>
							<th style="width: 100mm; text-align: left;">มอบหมายให้&nbsp;&nbsp; <%=bean.getCommitBDt()%></th>
						</tr>
						<tr>
							<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;8.3 งานประจำเวร/ประจำวัน</th>
							<th style="width: 30mm; text-align: left;">
							( <%if (bean.getCommitC().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ไม่มี</th>
							<th style="width: 22mm; text-align: left;">
							( <%if (bean.getCommitC().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) มี</th>
							<th style="width: 100mm; text-align: left;">มอบหมายให้&nbsp;&nbsp; <%=bean.getCommitCDt()%></th>
						</tr>
						<tr>
							<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;8.4 งานอื่นๆ &nbsp;&nbsp;&nbsp; <%=bean.getOther()%></th>
							<th style="width: 30mm; text-align: left;">
							( <%if (bean.getCommitD().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ไม่มี</th>
							<th style="width: 22mm; text-align: left;">
							( <%if (bean.getCommitD().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) มี</th>
							<th style="width: 100mm; text-align: left;">มอบหมายให้&nbsp;&nbsp; <%=bean.getCommitDDt()%></th>
						</tr>
					</table>
					<table
						style="width: 100%; margin-top: 2cm">
						<tr>
							<td style="width: 90mm"></td>
							<td valign="middle"><label>(ลงชื่อ).............................................ผู้ขออนุญาต</label></td>
						</tr>
						<tr>
							<td style="width: 90mm"></td>
							<td valign="middle"><label style="margin-left: 6.5mm">(.............................................)</label>
							</td>
						</tr>
					</table>

				</div>

				<!-- การพิจารณา -->
				<div class="page" id="2">

					<label><u>การพิจารณา</u>
						ผ่านผู้บังคับบัญชาในสายงานที่ขอไปราชการตามลำดับ</label> <br>

					<div style="margin-bottom: 6%">
						<label style="margin-right: 3%">1. ( &nbsp; ) หัวหน้าสาขาวิชา
						</label> <label style="margin-left: 3%; margin-right: 3%"> ( &nbsp; ) หัวหน้างาน
						</label> <label style="margin-left: 3%; margin-right: 3%"> ( &nbsp; ) หัวหน้าฝ่าย
							....................... </label> <br> <label
							style="margin-left: 3%; margin-right: 3%"> เห็นด้วย </label> <label
							style="margin-left: 3%; margin-right: 3%">( &nbsp; ) อนุญาต </label> <label style="margin-left: 5%;">
							โดยใช้งบ........รหัส.........จำนวน......บาท </label> <br> <label
							style="margin-left: 18%; margin-right: 3%">( &nbsp; ) ไม่อนุญาต </label> <label
							style="margin-left: 3%;">เนื่องจาก..............................
						</label> <br>
						<div align="center" style="margin-top: 3%">
							<label>ลงชื่อ......................</label> <br> <label>(...........................)</label>
							<br> <label>......../......../........</label>
						</div>
					</div>

					<div style="margin-bottom: 6%">
						<label>2. ( &nbsp; )
							หัวหน้าภาควิชา
						</label> <label>( &nbsp; )
							ผู้อำนวยการกอง </label> <label>( &nbsp; )
							หัวหน้าสำนักงานเลชานุการคณะ / สำนัก / สถาบัน </label> <br> <label
							style="margin-left: 3%; margin-right: 3%"> เห็นด้วย </label> <label
							style="margin-left: 3%; margin-right: 3%">( &nbsp; ) อนุญาต </label> <label style="margin-left: 5%;">
							โดยใช้งบ........รหัส.........จำนวน......บาท </label> <br> <label
							style="margin-left: 18%; margin-right: 3%">( &nbsp; ) ไม่อนุญาต </label> <label
							style="margin-left: 3%;">เนื่องจาก..............................
						</label> <br>
						<div align="center" style="margin-top: 5%">
							<label>ลงชื่อ......................</label> <br> <label>(...........................)</label>
							<br> <label>......../......../........</label>
						</div>
					</div>

					<div style="margin-bottom: 6%">
						<label>3. การสั่งการ </label><br> <label
							style="margin-left: 2%;">( &nbsp; )
							อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label> <label>( &nbsp; ) เบิกค่าใช้จ่ายตามประมาณการ </label> <label>( &nbsp; ) ไม่เบิกค่าใช้จ่าย </label> <br> <label
							style="margin-left: 2%;">( &nbsp; )
							ไม่อนุญาต </label> <br> <label style="margin-left: 2%;">( &nbsp; ) นำเสนอรองอธิการบดี (เกิน
							30,000)</label> <br>
						<div style="margin-left: 20%; margin-top: 4%">
							<label>......................คณะบดี / ผอ.สำนัก /
								ผอ.สถาบัน ปฏิบัติราชการแทนอธิการบดี</label> <br> <label>...../....../........</label>
						</div>
						<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
							<label>......................ผู้ช่วยอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label>
							<br> <label>...../....../........</label>
						</div>
						<label style="margin-left: 2%;">( &nbsp; ) อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label>
						<label>( &nbsp; )
							เบิกค่าใช้จ่ายตามประมาณการ </label> <label>( &nbsp; ) ไม่เบิกค่าใช้จ่าย</label> <br> <label
							style="margin-left: 2%;">( &nbsp; )
							ไม่อนุญาต </label> <br> <label style="margin-left: 2%;">( &nbsp; ) นำเสนอรองอธิการบดี (เกิน
							50,000) </label> <br>
						<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
							<label>......................รองอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label>
							<br> <label>...../....../........</label>
						</div>
						<label style="margin-left: 2%;">( &nbsp; ) อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label>
						<label>( &nbsp; )
							เบิกค่าใช้จ่ายตามประมาณการ </label> <label>( &nbsp; ) ไม่เบิกค่าใช้จ่าย</label> <br> <label
							style="margin-left: 2%;">( &nbsp; )
							ไม่อนุญาต </label> <br>
						<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
							<label>......................อธิการบดี /
								รองอธิการบดีฝ่ายรักษาราชการแทนอธิการบดี</label> <br> <label>...../....../........</label>
						</div>

					</div>
				</div> <!-- end2 -->
				
				
				<!--ประมาณการรายจ่ายไปราชการ -->
				<div class="page" id="3">

					<label>&nbsp;&nbsp; ประมาณการรายจ่ายไปราชการ
						(ให้แนบพร้อมกับใบขออนุญาตกรณีขอเบิกค่าใช้จ่าย)</label>

					<table style="width: 100%;">
						<tr>
							<th style="max-width: 4mm; text-align: left">1. ข้าพเจ้า</th>
							<th style="max-width: 12mm;"><%=bean.getFacultyName() %></th>
							<th style="max-width: 2.5mm;">ตำเเหน่ง</th>
							<th style="max-width: 8mm;"><%=bean.getDepartmentName() %></th>
						</tr>
						<tr>
							<th colspan="4" style="text-align: left">&nbsp;&nbsp;&nbsp;พร้อมด้วยผู้มีรายชื่อหน้า 2 รวม &nbsp;&nbsp;&nbsp; <%=beanEs.getUserSumTotal() %>&nbsp;&nbsp; คน (มีความประสงค์)</th>
						</tr>
						<tr>
							<th colspan="4" style="text-align: left">&nbsp;&nbsp; 
								( <%if (bean.getPurpose().equals("ขออนุญาต")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ขออนุญาต &nbsp;&nbsp; 
								( <%if (bean.getPurpose1().equals("ได้รับคำสั่ง")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ได้รับคำสั่ง &nbsp;&nbsp; 
								( <%if (bean.getPurpose2().equals("ไปราชการ")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ไปราชการ &nbsp;&nbsp; 
								เรื่อง &nbsp;&nbsp; <%=bean.getTopics()%>
							</th>
						</tr>
					</table>
					<table style="width: 100%;">
						<tr>
							<th style="text-align: left; max-width: 20mm;">&nbsp;&nbsp;&nbsp; ที่ &nbsp;&nbsp;  <%=bean.getDestinationName()%></th>
							<th style="text-align: left; max-width: 11mm;">อำเภอ&nbsp;&nbsp; <%=bean.getAmphur()%></th>
							<th style="text-align: left; max-width: 11mm;">จังหวัด&nbsp;&nbsp; <%=bean.getAmphur()%></th>
						</tr>
					</table>
					<table style="width: 100%;">
						<tr>
							<th style="text-align: left; max-width: 10mm;">&nbsp;&nbsp;ในวันที่ </th>
							<th style="text-align: left; max-width: 15mm;"><%=bean.getGoDateDay()%></th>
							<th style="text-align: center; ; max-width: 5mm;">เดือน</th>
							<th style="text-align: center; max-width: 15mm;"><%=bean.getGoDateMonth()%></th>
							<th style="text-align: left; max-width: 5mm;">พ.ศ.</th>
							<th style="text-align: left; max-width: 15mm;"><%=bean.getGoDateYear()%></th>
							<th style="text-align: left; max-width: 10mm;">&nbsp;&nbsp;ถึงวันที่ </th>
							<th style="text-align: left; max-width: 15mm;"><%=bean.getBackDateDay()%></th>
							<th style="text-align: center; max-width: 5mm;">เดือน</th>
							<th style="text-align: center; ; max-width: 15mm;"><%=bean.getBackDateMonth()%></th>
							<th style="text-align: left; max-width: 5mm;">พ.ศ.</th>
							<th style="text-align: left; max-width: 15mm;"><%=bean.getBackDateYear()%></th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th colspan="4" style="max-width: 100%; text-align: left">2.การไปราชการในครั้งนี้ ขอเบิกค่าใช้จ่ายจากงบประมาณ</th>
						</tr>
						<tr>
							<th style="text-align: left; max-width: 5mm;">&nbsp;&nbsp;&nbsp; ( <%if (bean.getBudgetBy().equals("1")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบแผ่นดิน โครงการ</th>
							<th style="text-align: left; max-width: 60mm;"><%if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {out.print(bean.getBudgetProject());} else {out.print("");}%></th>
							<th style="text-align: left; max-width: 5mm;">รหัสโครงการ</th>
							<th style="text-align: left; max-width: 25mm;">&nbsp;&nbsp; <%if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {out.print(bean.getBudgetPass());}%></th>
						</tr>
						<tr>
							<th style="text-align: left;">&nbsp;&nbsp;&nbsp; ( <%if (bean.getBudgetBy().equals("2")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบเงินรายได้ โครงการ  </th>
							<th style="text-align: left;"> <%if (bean.getBudgetBy().equals("งบรายได้")) {out.print(bean.getBudgetProject());} else {out.print("");}%></th>
							<th style="text-align: left;">รหัสโครงการ</th>
							<th style="text-align: left;">&nbsp;&nbsp; <%if (bean.getBudgetBy().equals("2")) {out.print(bean.getBudgetPass());}%>
							</th>
						</tr>
						<tr>
							<th colspan="4" style="max-width: 100%; text-align: left">&nbsp;&nbsp;&nbsp; 
							( <%if (bean.getBudgetBy().equals("3")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) งบอื่นๆ &nbsp;&nbsp;
							</th>
						</tr>
						<tr>
							<th colspan="4" style="max-width: 100%; text-align: left">&nbsp;&nbsp;โดยขอเบิกค่าใช้จาย 
								( <%if (bean.getBudgetExpenses().equals("ตามสิทธิ์")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) ตามสิทธื์ &nbsp;&nbsp; 
								( <%if (bean.getBudgetExpenses().equals("เหมาจ่าย")) {out.print("&#10003;");} else {out.print(" &nbsp;&nbsp; ");}%> ) เหมาจ่าย &nbsp;&nbsp; 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  เป็นจำนวนเงิน &nbsp;&nbsp;&nbsp; <%=beanEs.getExpenseEstimateSumTotal()%>&nbsp;&nbsp;&nbsp; บาท</th>
						</tr>
					</table>
					<br>
					<table style="width: 100%;">
						<tr>
							<th style="text-align: left;">3. ประมาณการรายจ่าย(กรณีไปราชการหลายคนโปรดกรอกราชละเอียดด้านหลัง)</th>
						</tr>
					</table>

					<table id="customers" align="center" style="width: 100%;">
						<tr>
							<th style="width: 200mm; text-align: center;">รายการ</th>
							<th style="width: 40mm; text-align: center;">จำนวนเงิน</th>
							<th style="width: 50mm; text-align: center;">หมายเหตุ</th>
						</tr>
						<tr>
							<th>
								<table style="width: 100%;">
									<tr>
										<td style="text-align: left; width: 25mm"><label>3.1 ค่าเบี้ยเลี้ยงเดินทาง</label></td>
										<td style="text-align: left; ; width: 3mm">
										<%if (beanEs.getAllowencePerdayTotal() == 0 ) {out.print("");} else {out.print(beanEs.getAllowencePerdayTotal());}%>
										</td>
										<td style="text-align: left; width: 10mm"><label>วันๆละ </label></td>
										<td style="text-align: left; width: 25mm"><label></label></td>
										<td style="text-align: left; width: 1mm"><label>บาท</label></td>
									</tr>
									<tr>
										<td style="text-align: left; width: 25mm"><label>3.2 ค่าเช่าที่พัก</label></td>
										<td style="text-align: left; width: 3mm">
										<%if (beanEs.getRentDatePerdayTotal() == 0 ) {out.print("");} else {out.print(beanEs.getRentDatePerdayTotal());}%>
										</td>
										<td style="text-align: left; width: 10mm"><label>คืนๆละ</label></td>
										<td style="text-align: left; width: 25mm"></td>
										<td style="text-align: left; width: 1mm"><label>บาท</label></td>
									</tr>
									<tr>
										<td colspan="5" style="text-align: left"><label>3.3 ค่าเดินทาง</label></td>
									</tr>
								</table>
								<table style="width: 100%;">
									<%for (int i = 0; i < beanTr.size(); i++) {%>
									<tr>
										<td style="text-align: left; width: 35mm">
											<label style="margin-left: 5%;"> <%=3%>. <%=3%>. <%=i + 1%><%=beanTr.get(i).getVehicleName()%></label>
										</td>
										<td style="text-align: left; width: 5mm">
										<label><%if (beanTr.get(i).getTravelExpenses() == 0) {out.print("");} else {out.print(beanTr.get(i).getNumberPer());}%></label>
										</td>
										<td style="text-align: left; width: 10mm"><label>เที่ยวๆละ</label></td>
										<td style="text-align: left; width: 12mm">
											<label><%if (beanTr.get(i).getNumberPer() == 0) {out.print("");} 
													else {out.print("(" + beanTr.get(i).getTravelExpenses() + "x" + beanTr.get(i).getUserSum() + ")");}%>
											</label>
										</td>
										<td style="text-align: left; width: 3mm"><label>บาท</label></td>
									</tr>
									<%}%>
								</table>
								<table>
									<tr>
										<td style="text-align: left; width: 40mm">
										<label style="margin-left: 5%;">3.6.6 ค่าน้ำมันเชื้อเพลิง</label></td>
										<td style="text-align: left; width: 60mm">
										<label>
											<%if (beanTEFC.getDistance() == 0) {out.print("");} else {out.print("(" + beanTEFC.getDistance());}%> 
											<%if (beanTEFC.getNumberPer() == 0) {out.print("");} else {out.print("x" + beanTEFC.getNumberPer());}%> 
 											<%if (beanTEFC.getFuelCost() == 0) {out.print("");} else {out.print("x" + beanTEFC.getFuelCost() + ")");}%> 
 											<%if (beanTEFC.getRateFuelCost() == 0) {out.print("");} else {out.print(" / " + beanTEFC.getRateFuelCost());} %>
										</label>
										</td>
										<td style="text-align: left; width: 6mm"><label>บาท</label></td>
									</tr>
									<tr>
										<td style="text-align: left; width: 40mm"><label style="margin-left: 5%;">3.6.7 ค่าทางด่วน</label></td>
										<td style="text-align: left; width: 60mm">
											<label><%if (beanTEFC.getExpresswayExpensesSum() == 0) {out.print("");} else {out.print(beanTEFC.getExpresswayExpensesSum());}%></label>
										</td>
										<td style="text-align: left; width: 6mm"><label>บาท</label></td>
									</tr>
									<tr>
										<td colspan="5" style="text-align: left"><label>3.4 ค่าใช้จ่ายอื่นๆ</label></td>
									</tr>
									<tr>
										<td style="text-align: left; width: 64mm"><label style="margin-left: 5%;">3.4.1 ค่าลงทะเบียน</label></td>
										<td style="text-align: left; width: 60mm"><label></label></td>
										<td style="text-align: left; width: 6mm"><label>บาท</label></td>
									</tr>
								</table>
							</th>
							<th style="width: 30mm;">
								<table style="width: 100%;">
									<tr>
										<td style="text-align: left;"><label> <%=beanEs.getAllowenceSumTotal()%></label></td>
									</tr>
									<tr>
										<td style="text-align: left; width: 25mm"><label><%=beanEs.getRentDateSumTotal()%></label></td>
									</tr>
									<tr>
										<td colspan="5" style="text-align: left"><label>...</label>
										</td>
									</tr>
								</table>
								<table style="width: 100%;">
									<%for (int i = 0; i < beanTr.size(); i++) {%>
									<tr>
										<td style="text-align: left; width: 12mm">
											<label><%if (beanTr.get(i).getSum() == 0) {out.print("...");} else {out.print(beanTr.get(i).getSum());}%></label>
										</td>
									</tr>
									<%}%>
								</table>
								<table>
									<tr>
										<td style="text-align: left;">
											<label> <%if (beanTEFC.getFuelCostSum() == 0) {out.print("...");} else {out.print(+beanTEFC.getFuelCostSum());}%></label>
										</td>
									</tr>
									<tr>
										<td style="text-align: left; width: 60mm">
											<label><%if (beanTEFC.getExpresswayExpensesSum() == 0) {out.print("...");} else {out.print(beanTEFC.getExpresswayExpensesSum());}%></label>
										</td>
									</tr>
									<tr>
										<td colspan="5" style="text-align: left"><label>...</label>
										</td>
									</tr>
									<tr>
										<td style="text-align: left; width: 60mm">
											<label><%if (beanEs.getOtherSumTotal() == 0) {out.print("...");} else {out.print(beanEs.getOtherSumTotal());}%></label>
										</td>
									</tr>
								</table>
							</th>

							<th style="width: 70mm;"></th>
						</tr>
						<tfoot>
							<tr>
								<th align="center">รวมทั้งสิ้น</th>
								<th><label> <%=beanEs.getExpenseEstimateSumTotal()%></label></th>
								<th></th>
							</tr>
						</tfoot>
					</table>

					<div align="right" style="margin-bottom: 3%; margin-top: 3%">
						<label>(ลงชื่อ).............................................ผู้ประมาณการ</label><br>
					</div>

					<table id="customers">
						<tr align="left">
							<th valign="top" style="max-width: 45mm">
								<div align="left">
									<label>1. บันทึกของนโยบายและแผน</label>
								</div>
								<div align="left">
								<label>
									( &nbsp; ) งบแผ่นดิน &nbsp;&nbsp;
									( &nbsp; ) งบรายได้ &nbsp;&nbsp;
									( &nbsp; ) งบอื่นๆ &nbsp;&nbsp;
								</label>
								</div>
								<div align="left">
									<label>รหัส</label>
									................................................................
								</div> <br>
								<div align="left">
									<label>ลงชื่อ.............................................ผู้บันทึก...../...../.....</label>
								</div>
								<div align="left">
									<label>ลงชื่อ.............................................อ.กอง</label>
								</div>
								<div align="left">
									<label>2. บันทึกขอกองคลังและทรัพย์สิน ได้ตัดยอดจ่ายแล้ว</label>
								</div>
								<div align="left">
								<label>
									( &nbsp; ) งบแผ่นดิน &nbsp;&nbsp;
									( &nbsp; ) งบรายได้ &nbsp;&nbsp;
									( &nbsp; ) งบอื่นๆ &nbsp;&nbsp;
								</label>
								</div>
								<div align="left">
									<label>รหัส</label>
									................................................................
								</div> <br>
								<div align="left">
									<label>ลงชื่อ</label>.............................................<label>ผู้บันทึก</label>...../...../.....
								</div>
								<div align="left">
									<label>ลงชื่อ</label>.............................................<label>ผอ.กอง</label>
								</div>
								<hr>
								<div align="center">
									<label>หน่วยงานได้บันทึกการจ่ายจริงเรียบร้อย</label>
								</div>
								<div align="center">
									<label>จำนวนเงิน.....................................บาท</label>
								</div>
								<div align="center">
									<label>ลงชื่อ.......................................ผู้บันทึก...../...../.....</label>
								</div>
							</th>

							<th style="max-width: 50mm;" valign="top">
								<div align="left">
									<label>3. &nbsp;&nbsp; ( &nbsp; )
									อนุญาต &nbsp;&nbsp; ( &nbsp; )
									ไม่อนุญาต &nbsp;&nbsp; ( &nbsp; )นำเสนอรองอธิการบดี </label>
								</div>
								<div align="left">
									<label>......................คณบดี/ผอ.สำนักงาน/ผอ.สถาบันปฏิบัติราชการแทน</label>
								</div>
								<div align="left">
									<label>อธิการบดี</label>
								</div>
								<div align="left">
									<label>......................ผู้ช่วยอธิการบดีปฏิบัติราชการแทนอธิการบดี</label>
								</div> <br>
								<div align="left">
								<label>
									&nbsp;&nbsp; ( &nbsp; ) อนุญาต
									&nbsp;&nbsp; ( &nbsp; ) ไม่อนุญาต
									&nbsp;&nbsp; ( &nbsp; ) นำเสนอรองอธิการบดี
								</label>
								</div> <br>
								<div align="left">
									<label>......................รองอธิการบดีปฏิบัติราชการแทนอธิการบดี</label>
								</div>
								<div align="left">
								<label>
									&nbsp;&nbsp; ( &nbsp; ) อนุญาต
									&nbsp;&nbsp; ( &nbsp; ) ไม่อนุญาต
									&nbsp;&nbsp;
								</label>
								</div>

								<div align="left">
									<label>......................อธิการบดี/รองอธิการบดีรักษาราชการแทนอธิการบดี</label>
								</div>
								<hr>

								<div align="center">
									<label>หน่วยงานได้บันทึกการจ่ายจริงเรียบร้อย</label>
								</div>
								<div align="center">
									<label>จำนวนเงิน.....................................บาท</label>
								</div>
								<div align="center">
									<label>ลงชื่อ.......................................ผู้บันทึก...../...../.....</label>
								</div>
							</th>
						</tr>
					</table>
				</div> <!-- 3 -->
				

				<!-- 	สรูป ใบสุดท้าย -->
				<div class="page" id="4">
					<!-- สรุป -->
					<div style="size: 10; margin-bottom: 5%" class="col-sm-12">
						<table id="customers" style="margin-bottom: 10mm; margin-top: 10mm">
						<thead>
							<tr>
								<th rowspan="2">ที่</th>
								<th rowspan="2">ชื่อ</th>
								<th rowspan="2">ตำแหน่ง</th>
								<th rowspan="2">ค่าเบี้ย<br>เลี้ยง
								</th>
								<th rowspan="2">ค่าเช่า<br>ที่พัก
								</th>
								<th rowspan="2">ค่ายาน<br>พาหนะ
								</th>
								<th rowspan="2">ค่าใช้จ่าย<br>อื่นๆ
								</th>
								<th colspan="2">รวมเงิน</th>
							</tr>
							<tr>
								<th class="text-center">บาท</th>
								<th class="text-center">สตางค์</th>
							</tr>
							<%
								for (int i = 0; i < beanEE.size(); i++) {
							%>
							<tr>
								<th style="text-align: left; margin-left: 2mm"><%=i + 1%></th>
								<th style="text-align: left;"><%=beanEE.get(i).getSex()%><%=beanEE.get(i).getUserFname()%>&nbsp;&nbsp;<%=beanEE.get(i).getUserLname()%></th>
								<th style="text-align: left;"><%=beanEE.get(i).getSubPositionName()%></th>
								<th>
									<%
										if (beanEE.get(i).getAllowenceSum() == 0) {
												out.print("");
										} else {
												out.print(beanEE.get(i).getAllowenceSum());
											}
									%>
								</th>
								<th>
									<%
										if (beanEE.get(i).getRentDateSum() == 0) {
												out.print("");
										} else {
												out.print(beanEE.get(i).getRentDateSum());
											}
									%>
								</th>
								<th>
									<%
										if (beanEE.get(i).getTravelSum() == 0) {
												out.print("");
										} else {
												out.print(beanEE.get(i).getTravelSum());
											}
									%>
								</th>
								<th>
									<%
										if (beanEE.get(i).getOtherSum() == 0) {
												out.print("");
										} else {
												out.print(beanEE.get(i).getOtherSum());
											}
									%>
								</th>
								<th>
									<%
										if (beanEE.get(i).getExpenseEstimateSum() == 0) {
												out.print("");
										} else {
												out.print(beanEE.get(i).getExpenseEstimateSum());
											}
									%>
								</th>
								<th>
									<%%>
								</th>
							</tr>
							<%}%>
							</thead>
							<tfoot>
							<tr>
								<th colspan="2"><label style="margin-left: 10%">รวม</label>
									<label style="margin-left: 10%"><%=beanEs.getUserSumTotal()%></label>
									<label style="margin-left: 25%">คน</label>
								</th>
								<th><label style="text-align: center;">รวมเงิน</label></th>
								<th>
									<%
										if (beanEs.getAllowenceSumTotal() == 0 ) {
											out.print("");
										} else {
											out.print(beanEs.getAllowenceSumTotal());
										}
									%>
								</th>
								<th>
									<%
										if (beanEs.getRentDateSumTotal() == 0 ) {
											out.print("");
										} else {
											out.print(beanEs.getRentDateSumTotal());
										}
									%>
								</th>
								<th>
									<%
										if (beanEs.getTravelSumTotal() == 0 ) {
											out.print("");
										} else {
											out.print(beanEs.getTravelSumTotal());
										}
									%>
								</th>
								<th>
									<%
										if (beanEs.getOtherSumTotal() == 0 ) {
											out.print("");
										} else {
											out.print(beanEs.getOtherSumTotal());
										}
									%>
								</th>
								<th>
									<%
										if (beanEs.getExpenseEstimateSumTotal() == 0 ) {
											out.print("");
										} else {
											out.print(beanEs.getExpenseEstimateSumTotal());
										}
									%>
								</th>
								<th></th>
							</tr>
							</tfoot>
						</table>

						<!-- 									<div class="col-sm-5"> -->
						<!-- 									</div> -->
						<!-- 									<div class="col-sm-7"> -->
						<!-- 									<table id="customers"> -->
						<!-- 										<tr> -->
						<!-- 											<th colspan="4" style="background-color: buttonhighlight;"><lable>คำชี้แจง</lable><br> -->
						<!-- 												<lable>1. กำหนดอัตราค่าเบี๋ยเลี้ยง -->
						<!-- 												ค่าที่พักให้มีสิทธ์เบิกได้ดังนี้</lable></th> -->
						<!-- 										</tr> -->
						<!-- 										<tr> -->
						<!-- 											<td rowspan="2">ตำแหน่ง</th> -->
						<!-- 											<td colspan="2">ค่าเบี๋ยเลี้ยง</th> -->
						<!-- 											<td rowspan="2">ค่าที่พัก<br>กรณีใช้ใบเสร็จ</th> -->
						<!-- 										<tr> -->
						<!-- 											<td>ก</th> -->
						<!-- 											<td>ข</th> -->
						<!-- 										</tr> -->
						<!-- 										<tr> -->
						<!-- 											<td>เที่ยบเท่าระดับ 1-8</td> -->
						<!-- 											<td>240</td> -->
						<!-- 											<td>144</td> -->
						<!-- 											<td>ห้องพักเดี่ยว 1,500 -->
						<!-- 												<hr>ห้องพักคู่ 850 -->
						<!-- 											</td> -->
						<!-- 										</tr> -->
						<!-- 										<tr> -->
						<!-- 											<td>เที่ยบเท่าระดับ 9 ขึ้นไป</td> -->
						<!-- 											<td>270</td> -->
						<!-- 											<td>162</td> -->
						<!-- 											<td>ห้องพักเดี่ยว 2,200 -->
						<!-- 												<hr>ห้องพักคู่ 1,200 -->
						<!-- 											</td> -->
						<!-- 										</tr> -->
						<!-- 										<tr> -->
						<!-- 											<td colspan="4" style="background-color: buttonhighlight;"><lable>ค่าที่พักกรณีเบิกค่าใช้จ่าย</lable></td> -->
						<!-- 										</tr> -->
						<!-- 										<tr> -->
						<!-- 											<td colspan="2">ตำแหน่ง</td> -->
						<!-- 											<td colspan="2">อัตรา/คืน/คน</td> -->
						<!-- 										<tr> -->
						<!-- 										<tr> -->
						<!-- 											<td colspan="2">เที่ยบเท่าระดับ 1-8</td> -->
						<!-- 											<td colspan="2">800</td> -->
						<!-- 										<tr> -->
						<!-- 										<tr> -->
						<!-- 											<td colspan="2">เที่ยบเท่าระดับ 9 ขึ้นไป</td> -->
						<!-- 											<td colspan="2">1,200</td> -->
						<!-- 										<tr> -->
						<!-- 									</table> -->
						<!-- 									</div> -->

					</div>
				</div>
			</div>
			<!-- 	printableArea1	 -->


		</div>
	</div>
</body>

</html>