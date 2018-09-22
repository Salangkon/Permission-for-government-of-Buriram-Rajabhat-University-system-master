
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

<body >
	<!-- 	 onload="window.print();"  -->

<div class="w3-sidebar w3-light-grey w3-card-4 w3-animate-left" style="width:200px" id="mySidebar">
  <div class="w3-bar w3-dark-grey">
  <span class="w3-bar-item w3-padding-16">Manu</span>
  <button onclick="w3_close()"
  class="w3-bar-item w3-button w3-right w3-padding-16" title="close Sidebar">&times;</button>
  </div>
  <div class="w3-bar-block">
  <div class="w3-dropdown-hover">
    <a class="w3-button" href="#">เลือกหน้า<i class="fa fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-bar-block w3-card-4">
      <a class="w3-bar-item w3-button" href="#5"> เบิกค่าใช้จ่าย	</a>
      <a class="w3-bar-item w3-button" href="#6"> เบิกค่าใช้จ่าย 2</a>
    </div>
  </div>
  <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="printDiv('printableArea')">พิมพ์</a>
  <a class="w3-bar-item w3-button w3-green" href="/welcomeUser">ย้อนกลับ</a>
  </div>
</div>

<div id="main" style="margin-left:200px">

<div class="w3-container w3-display-container" style="background-color: gray;" id="grad1">
  <span title="open Sidebar" style="display:none" id="openNav" class="w3-button w3-transparent w3-display-topleft w3-xlarge" onclick="w3_open()">&#9776;</span>


<div id="printableArea" >
<!-- ใบเบิกค่าใช้จ่ายในการเดินทางไปราชการ -->
			<div class="page" id="5">

				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="width: 40mm;">สัญญายืมเงินเลขที่</th>
						<th style="width: 40mm;"></th>
						<th style="width: 15mm;">วันที่</th>
						<th style="width: 35mm;"></th>
						<th style="text-align: right; width: 25mm;">ส่วนที่ 1</th>
					</tr>
					<tr>
						<th>ชื่อผู้ยืม</th>
						<th style="width: 50mm;"></th>
						<th style="width: 20mm;">จำนวนเงิน</th>
						<th style="text-align: center; width: 35mm;"></th>
						<th style="text-align: right; width: 30mm;">บาท แบบ 8708</th>
					</tr>
				</table><br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="text-align: center;"><b>ใบเบิกค่าใช้จ่ายในการเดินทางไปราชการ</b></th>
					</tr>
				</table><br>
				<table>
					<tr>
						<th style="width: 60mm"></th>
						<th style="width: 10mm">ที่ทำการ</th>
						<th style="width: 40mm"></th>
					</tr>
					<tr>
						<th></th>
						<th colspan="2">วัน........เดือน...............พ.ศ................</th>
					</tr>
				</table>

				<p>เรื่อง ขออนุมัติเบิกค่าใช้จ่ายในการเดินทางไปราชการ</p>
				<p>เรื่อง อธิการบดีมหาวิทยาลัยราชภัฏบุรีรัมย์</p>
				<br>
				<table>
					<tr>
						<th style="width: 30mm; text-align: right;">ตามคำสั่ง/บันทึกที่</th>
						<th style="width: 20mm; text-align: center;"><%=beanBack.getbByOrderSave() %></th>
						<th style="width: 10mm; text-align: left;">ลงวันที่</th>
						<th style="width: 50mm; text-align: center;"><%=beanBack.getbDateAuthorized()%></th>
						<th style="width: 15mm; text-align: left;">ได้อนุมัติ</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 5mm; text-align: left;">ข้าพเจ้า</th>
						<th style="width: 50mm; text-align: center;"><%=bean.getSex() %><%=bean.getUserFname()%>&nbsp;&nbsp; <%=bean.getUserLname()%></th>
						<th style="width: 10mm; text-align: left;">ตำแหน่ง</th>
						<th style="width: 60mm; text-align: center;"><%=bean.getSubPositionName() %></th>
						<th style="width: 20mm; text-align: center;"></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 5mm; text-align: left;">สังกัด</th>
						<th style="width: 35mm; text-align: center;"><%=bean.getFacultyName() %></th>
						<th style="width: 15mm; text-align: left;">พร้อมด้วย</th>
						<th style="width: 60mm; text-align: center;"></th>
					</tr>
					<tr>
						<th colspan="5" style="height: 15mm; text-align: left;"valign="top">

						</th>
					</tr>
					<tr>
						<th colspan="5" style="height: 10mm; text-align: left;"valign="top">โดยออกเดินทางจาก <%=bean.getDestinationName()%> </th>
					</tr>
					<tr>
						<th colspan="5" style="text-align: right;">เดินทางปฎิบัติราชการที่</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 40mm; text-align: left;">
							<input name="v" type="checkbox" <%if (beanBack.getbStartTravel() == 1) {out.print("checked ='checked' disabled");}%> disabled> บ้านพัก 
							<input name="v" type="checkbox" <%if (beanBack.getbStartTravel() == 2) {out.print("checked ='checked' disabled");}%> disabled> สำนักงาน</th>
						<th style="width: 12mm; text-align: left;">เลขที่</th>
						<th style="width: 12mm; text-align: left;"><%=beanBack.getbHouseNumber() %></th>
						<th style="width: 5mm; text-align: left;">ถนน</th>
						<th style="width: 20mm; text-align: left;"><%=beanBack.getbRoad() %></th>
						<th style="width: 5mm; text-align: left;">ตำบล</th>
						<th style="width: 30mm; text-align: left;"><%=beanBack.getDistrictName() %></th>
						<th style="width: 5mm; text-align: left;">อำเภอ</th>
						<th style="width: 30mm; text-align: left;"><%=beanBack.getAmphurName() %></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 10mm; text-align: left;">จังหัด</th>
						<th style="width: 30mm; text-align: center;"><%=beanBack.getProvinceName() %></th>
						<th style="width: 12mm; text-align: left;">ตั้งแต่วันที่</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbGoDateDay() %></th>
						<th style="width: 7mm; text-align: center;">เดือน</th>
						<th style="width: 20mm; text-align: center;"><%=beanBack.getbGoDateMonth() %></th>
						<th style="width: 7mm; text-align: center;">พ.ศ.</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbGoDateYear() %></th>
						<th style="width: 5mm; text-align: left;">เวลา</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbBackTime() %></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 40mm; text-align: left;">และกลับถึง 
							<input name="v" type="checkbox" <%if (beanBack.getbBackTravel()  == 1) {out.print("checked ='checked' disabled");}%> disabled> บ้านพัก 
							<input name="v" type="checkbox" <%if (beanBack.getbBackTravel()  == 2) {out.print("checked ='checked' disabled");}%> disabled> สำนักงาน
						</th>
						<th style="width: 12mm; text-align: right;">วันที่</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbBackDateDay() %></th>
						<th style="width: 7mm; text-align: center;">เดือน</th>
						<th style="width: 20mm; text-align: center;"><%=beanBack.getbBackDateMonth() %></th>
						<th style="width: 7mm; text-align: center;">พ.ศ.</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbBackDateYear() %></th>
						<th style="width: 5mm; text-align: left;">เวลา</th>
						<th style="width: 10mm; text-align: center;"><%=beanBack.getbBackTime() %></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 15mm; text-align: left;">รวมเวลาไปราชการครั้งนี้</th>
						<th style="width: 5mm; text-align: center;"><%=beanBack.getbDayTotal() %></th>
						<th style="width: 2mm; text-align: left;">วัน</th>
						<th style="width: 5mm; text-align: center;"><%=beanBack.getbTimeTotal() %></th>
						<th style="width: 5mm; text-align: left;">ชั่วโมง</th>
						<th style="width: 20mm"></th>
					</tr>
				</table>
				<br> <br>
				<table>
					<tr>
						<th style="width: 15mm"></th>
						<th style="text-align: left;">ข้าพเจ้าขอเบิกค่าใช้จ่ายในการเดินทางไปราชการสำหรับ
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input name="v" type="checkbox" <%if (beanBack.getbDisbursedBy() == 1) {out.print("checked ='checked' disabled");}%> disabled> ข้าพเจ้า
							<input name="v" type="checkbox" <%if (beanBack.getbDisbursedBy() == 2) {out.print("checked ='checked' disabled");}%> disabled> คณะเดินทาง &nbsp;&nbsp;&nbsp;&nbsp; ดังนี้
						</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 25mm; text-align: left;">ค่าเบี๋ยเลี้ยงเดินทางประเภท</th>
						<th style="width: 20mm; text-align: center;">
							<input type="checkbox" <%if (beanBack.getbAllowenceType()  == 1) {out.print("checked ='checked' disabled");}%> disabled> ก 
							<input type="checkbox" <%if (beanBack.getbAllowenceType()  == 2) {out.print("checked ='checked' disabled");}%> disabled> ข
						</th>
						<th style="width: 1mm; text-align: left;">จำนวน</th>
						<th style="width: 7mm; text-align: left;"><%=beanEsBack.getAllowenceSumTotal() %></th>
						<th style="width: 2mm; text-align: left;">วัน รวม</th>
						<th style="width: 10mm; text-align: center;"><%=beanEsBack.getAllowencePerdayTotal()%></th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 25mm; text-align: left;">ค่าเช่าที่พักประเภท</th>
						<th style="width: 20mm; text-align: center;">
							<input type="checkbox" <%if (beanBack.getbRentDateType() == 1) {out.print("checked ='checked' disabled");}%> disabled> ก 
							<input type="checkbox" <%if (beanBack.getbRentDateType() == 2) {out.print("checked ='checked' disabled");}%> disabled> ข
						</th>
						<th style="width: 1mm; text-align: left;">จำนวน</th>
						<th style="width: 7mm; text-align: left;"><%=beanEsBack.getRentDateSumTotal() %></th>
						<th style="width: 2mm; text-align: left;">วัน รวม</th>
						<th style="width: 10mm; text-align: center;"><%=beanEsBack.getRentDatePerdayTotal()%></th>
						<th style="width: 2mm">บาท</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 40mm; text-align: left;">ค่าพาหนะ</th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวม</th>
						<th style="width: 12mm; text-align: center;">
							<%if (beanEsBack.getTravelSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEsBack.getTravelSumTotal());
									}%>
						</th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 40mm; text-align: left;">ค่าใช่จ่ายอื่นๆ</th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวม</th>
						<th style="width: 12mm; text-align: center;"><%=beanEsBack.getOtherSumTotal() %></th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 40mm; text-align: left;"></th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวมทั้งสิ้น</th>
						<th style="width: 12mm; text-align: center;"><%=beanEsBack.getExpenseEstimateSumTotal() %></th>
						<th style="width: 2mm">บาท</th>
					</tr>
				</table>
				<br> <br>
				<table>
					<tr>
						<th style="text-align: left;width: 5mm">จำนวนเงิน/ตัวอักษร&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th style="text-align: left;width: 60mm"><%=beanEsBack.getExpenseEstimateSumTotalThaiBaht() %></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 15mm"></th>
						<th style="text-align: left;">ข้าพเจ้าขอรับรองว่ารายการที่กล่าวข้างต้นเป็นความจริง และหลักฐานการจ่ายที่ส่งมาด้วยจำนวน </th>
						<th style="width: 10mm; text-align: center;"></th>
						<th style="width: 5mm">ฉบับ</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="text-align: left;">รวมทั้งจำนวนเงินที่ขอเบิกถูกต้องตามกฎหมายทุกประการ</th>
					</tr>
				</table>

				<table
					style="width: 100%; border-collapse: collapse; margin-top: 2cm">
					<tr>
						<td style="width: 90mm"></td>
						<td valign="middle"><label>ลงชื่อ.............................................ผู้ขอรับเงิน</label></td>
					</tr>
					<tr>
						<td style="width: 90mm"></td>
						<td valign="middle"><label style="margin-left: 6.5mm">(.............................................)</label>
						</td>
					</tr>
					<tr>
						<td style="width: 90mm"></td>
						<td valign="middle"><label>ตำแหน่ง.........................................................</label></td>
					</tr>
				</table>
			</div>


<!-- ใบเบิกค่าใช้จ่ายในการเดินทางไปราชการ 2 -->
				<div class="page" id="6">
					<p style="text-align: center;">2</p>

					<table>
						<tr>
							<td style="max-width: 50%;" valign="top">&nbsp;&nbsp;
								ได้ตรวจสอบหลักฐานการเบิกจ่ายเงินที่แนบถูกต้องแล้ว<br>
								&nbsp;&nbsp; เห็นควรอนุมัติให้เบิกจ่าย<br>
							<br>
							<br> &nbsp;&nbsp;
								ลงชื่อ....................................................ผู้ตรวจ<br>
								&nbsp;&nbsp;
								(....................................................)<br>
								&nbsp;&nbsp;
								ตำแหน่ง....................................................<br>
								&nbsp;&nbsp;
								วันที่....................................................<br>
							<br>
							<br>
							</td>
							<td style="width: 50%;" valign="top">&nbsp;&nbsp;
								อนุมัติให้จ่ายได้<br> <br>
							<br>
							<br> &nbsp;&nbsp;
								ลงชื่อ................................หัวหน้าส่วนราชการ<br>
								&nbsp;&nbsp;
								(....................................................)<br>
								&nbsp;&nbsp;
								ตำแหน่ง....................................................<br>
								&nbsp;&nbsp;
								วันที่....................................................<br>
							<br>
							<br>
							</td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td style="width: 40mm; text-align: right;">ได้รับค่าใช้จ่ายในการเดินทางไปราชการ จำนวน</td>
							<td style="width: 20mm; text-align: center;"></td>
							<td style="width: 10mm; text-align: center;">บาท</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="max-width: 30mm; text-align: left;">(...................................................................)</td>
							<td style="max-width: 60mm; text-align: left;">ไว้เป็นการถูกต้องแล้ว</td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td style="width: 50%;" valign="top">&nbsp;&nbsp;
								ลงชื่อ.....................................................ผู้รับเงิน<br>
								&nbsp;&nbsp;
								(.....................................................)<br>
								&nbsp;&nbsp;
								ตำแหน่ง..............................................<br>
								&nbsp;&nbsp;
								วันที่...................................................<br>
								&nbsp;&nbsp; จากเงินยืมตามสัญญาเลขที่..........................<br>
							<br>
							<br>
							</td>
							<td style="width: 50%;" valign="top">&nbsp;&nbsp;
								ลงชื่อ................................ผู้จ่ายเงิน<br>
								&nbsp;&nbsp;
								(.........................................................)<br>
								&nbsp;&nbsp;
								ตำแหน่ง..................................................<br>
								&nbsp;&nbsp;
								วันที่......................................................<br>
								&nbsp;&nbsp;
								วันที่......................................................<br>
							<br>
							<br>
							</td>
						</tr>
					</table>
					<br>
					<hr>
					<br>
					<table>
						<tr>
							<td style="height: 50mm; max-width: 50%;" valign="top">
								&nbsp;&nbsp;&nbsp;หมายเหตุ</td>
						</tr>
					</table>

				</div>

			</div>
	</div>
</div>
</body>
</html>