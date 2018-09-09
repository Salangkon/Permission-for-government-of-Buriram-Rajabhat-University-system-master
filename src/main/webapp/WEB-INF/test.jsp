
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

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<%
	List<ExpenseEstimateBean> beanEE = null;
	List<TravelExpensesBean> beanTr = null;
	PermissionBean bean = null;
	ExpenseSumaryBean beanEs = null;
	TravelExpensesFuelCostBean beanTEFC = null;
	String result = "";
%>
<%
	beanEE = (List<ExpenseEstimateBean>) request.getAttribute("beanEE");
	beanTr = (List<TravelExpensesBean>) request.getAttribute("beanTr");
	beanTEFC = (TravelExpensesFuelCostBean) request.getAttribute("beanTEFC");
	beanEs = (ExpenseSumaryBean) request.getAttribute("beanEs");
	bean = (PermissionBean) request.getAttribute("perBean");
	result = (String) request.getAttribute("messesUpdate");
%>

</head>

<body >
	<!-- 	 onload="window.print();"  -->

			<div class="page">

				<h4 align="center">
					<b>มหาวิทยาลัยราชภัฏบุรีรัมย์ <br>บันทึกขออนุญาตไปราชการ
					</b>
				</h4>
				<hr>
				<br>

				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 6mm; text-align: left">1. ส่วนราชการ</th>
						<th style="max-width: 10mm;"><label><%=bean.getDepartmentName()%></label></th>
						<th style="max-width: 2mm;">สังกัด</th>
						<th style="max-width: 10mm; text-align: left;"><label><%=bean.getFacultyName()%></label></th>
					</tr>
					<tr>
						<th style="max-width: 4mm; right: 1em; text-align: left">
							&nbsp;&nbsp; วันที่ <%=bean.getDateDay()%>
                        </th>
                        <th style="max-width: 4mm; right: 1em; text-align: left">
							เดือน <%=bean.getDateMonth()%> 
                        </th>
                        <th colspan="2"style="max-width: 4mm; right: 1em; text-align: left">
							พ.ศ. <%=bean.getDateYear()%>
                        </th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 4mm; text-align: left">2. ข้าพเจ้า</th>
						<th style="max-width: 12mm;"><label><%=bean.getSex() %><%=bean.getUserFname()%>&nbsp;&nbsp; <%=bean.getUserLname()%></label></th>
						<th style="max-width: 2.5mm;">ตำเเหน่ง</th>
						<th style="max-width: 8mm;"><label> <%=bean.getDepartmentName()%></label></th>
					</tr>
					<tr>
						<th colspan="4" style="text-align: left">&nbsp;&nbsp;
							พร้อมด้วยคณะ รวม &nbsp;&nbsp; <%=beanEs.getUserSumTotal()%> คน <label>(ดังรายชื่อที่ระบุในใบประมาณการรายจ่ายที่แนบ)</label>
						</th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 100%; text-align: left">3.
							ขอไปราชการในฐานะ : &nbsp;&nbsp; <input name="status" id="status1"
							type="radio" value="ผู้บริหาร"
							<%if (bean.getStatus().equals("ผู้บริหาร")) {
				out.print("checked ='checked'  disabled");
			}%>
							disabled> ผู้บริหาร &nbsp;&nbsp; <input name="status"
							id="status1" type="radio" value="ผู้สอน"
							<%if (bean.getStatus().equals("ผู้สอน")) {
				out.print("checked ='checked' 	disabled");
			}%>
							disabled> ผู้สอน &nbsp;&nbsp; <input name="status"
							id="status1" type="radio" value="ผู้สนับสนุนการสอน"
							<%if (bean.getStatus().equals("ผู้สนับสนุนการสอน")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ผู้สนับสนุนการสอน
						</th>
					</tr>
					<tr>
						<th colspan="4" style="text-align: left; height: 20mm;"
							valign="top">&nbsp;&nbsp;&nbsp; เพื่อ
							(ระบุวัตถุประสงค์/ลักษณะงาน) &nbsp;&nbsp;&nbsp;<label><%=bean.getObject()%></label>
						</th>
					</tr>
					<tr>
						<th style="max-width: 4mm; text-align: left"><label>&nbsp;&nbsp;&nbsp;ให้แนบเอกสารโครงการ/กิจกรรมที่ระบุรายละเอียด
								หรือ เหตุผลเพิ่อประกอบการพิจารณา (ถ้ามี) : </label></th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 6mm; text-align: left">4.
							ไปราชการในวันที่</th>
						<th style="max-width: 12mm;"><label> <%=bean.getGoDate()%></label></th>
						<th style="max-width: 6mm;">ออกเดินทางเวลา</th>
						<th style="max-width: 5mm;"><label> <%=bean.getGoTime()%>
						</label></th>
					</tr>
					<tr>
						<th style="max-width: 2mm; text-align: left">
							&nbsp;&nbsp;&nbsp; ถึงวันที่</th>
						<th style="max-width: 12mm;"><label> <%=bean.getBackDate()%>
						</label></th>
						<th style="max-width: 6mm;">เดินทางกลับถึงเวลา</th>
						<th style="max-width: 5mm;"><label> <%=bean.getBackTime()%>
						</label></th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 6mm; text-align: left">5.
							สถานที่ไปราชการ ชื่อหน่วยงาน</th>
						<th style="max-width: 12mm; text-align: left"><label><%=bean.getTopics()%></label></th>

					</tr>
					<tr>
						<th style="max-width: 6mm; text-align: left">
							&nbsp;&nbsp;&nbsp; อำเภอ &nbsp;&nbsp;&nbsp; <%=bean.getAmphur()%></th>
						<th style="max-width: 12mm; text-align: left"><label>
								จังหวัด &nbsp;&nbsp;&nbsp; <%=bean.getProvince()%></label></th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 5.8mm; text-align: left">6. งบประมาณ</th>
						<th style="max-width: 18mm; text-align: left"><input name="v"
							type="checkbox" value="เบิกค่าใช้จ่าย"
							<%if (bean.getBudget().equals("เบิกค่าใช้จ่าย")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> เบิกค่าใช้จ่าย &nbsp;&nbsp; <input name="a"
							type="checkbox" value="ตามสิทธิ์"
							<%if (bean.getBudgetExpenses().equals("ตามสิทธิ์")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ตามสิทธื์ &nbsp;&nbsp; <input name="a"
							type="checkbox" value="เหมาจ่าย"
							<%if (bean.getBudgetExpenses().equals("เหมาจ่าย")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> เหมาจ่าย &nbsp;&nbsp;</th>
					</tr>
					<tr>
						<th style="max-width: 4mm; text-align: left"></th>
						<th style="max-width: 18mm; text-align: left"><input name="v"
							type="checkbox" value="ไม่เบิกค่าใช้จ่าย"
							<%if (bean.getBudget().equals("ไม่เบิกค่าใช้จ่าย")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ไม่เบิกค่าใช้จ่าย &nbsp;&nbsp;</th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 13mm; text-align: left">
							&nbsp;&nbsp;&nbsp; โดยใช้งบประมาณ</th>
						<th style="max-width: 15mm; text-align: left"><input name="f"
							type="checkbox" value="งบประมาณแผ่นดิน"
							<%if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> <label>งบแผ่นดิน </label> &nbsp;&nbsp;โครงการ
							&nbsp;&nbsp;</th>
						<th style="max-width: 15mm; text-align: left"><label>
								<%
									if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
										out.print(bean.getBudgetProject());
									}
								%>
						</label></th>
						<th style="max-width: 10mm; text-align: left">รหัสโครงการ</th>
						<th style="max-width: 12mm; text-align: left"><label>
								<%
									if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
										out.print(bean.getBudgetPass());
									}
								%>
						</label></th>
					</tr>
					<tr>
						<th style="max-width: 12mm; text-align: left"></th>
						<th style="max-width: 18mm; text-align: left"><input name="f"
							type="checkbox" value="งบรายได้"
							<%if (bean.getBudgetBy().equals("งบรายได้")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> <label>งบเงินรายได้ </label>&nbsp;&nbsp;โครงการ
							&nbsp;&nbsp;</th>
						<th style="max-width: 15mm; text-align: left"><label>
								<%
									if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
										out.print(bean.getBudgetProject());
									}
								%>
						</label></th>
						<th style="max-width: 10mm; text-align: left">รหัสโครงการ</th>
						<th style="max-width: 12mm; text-align: left"><label>
								<%
									if (bean.getBudgetBy().equals("งบรายได้")) {
										out.print(bean.getBudgetPass());
									}
								%>
						</label></th>
					</tr>
					<tr>
						<th style="max-width: 12mm; text-align: left"></th>
						<th style="max-width: 18mm; text-align: left"><input name="f"
							type="checkbox" value="อื่นๆ"
							<%if (bean.getBudgetBy().equals("อื่นๆ")) {
				out.print("checked ='checked'");
			}%>>งบอื่นๆ
						</th>
						<th style="max-width: 15mm; text-align: left" colspan="3"><label>
						</label></th>
					</tr>
					<tr>
						<th style="max-width: 12mm; text-align: left"></th>
						<th style="max-width: 18mm; text-align: left">ในวงเงิน
							&nbsp;&nbsp; <%=beanEs.getExpenseEstimateSumTotal()%>
						</th>
						<th style="max-width: 12mm; text-align: left" colspan="3">บาท
						</th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 9.5mm; text-align: left">7. การเดินทาง
						</th>
						<th style="max-width: 18mm; text-align: left" colspan="2"><input
							name="g" type="checkbox" value="พาหนะประจำทาง"
							<%if (bean.getTravel().equals("พาหนะประจำทาง")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ภาหนะประจำทาง</th>
					</tr>
					<tr>
						<th style="max-width: 7mm; text-align: left"></th>
						<th style="max-width: 18mm; text-align: left" colspan="2"><input
							name="g" type="checkbox" value="ขอใช้รถส่วนตัว"
							<%if (bean.getTravel().equals("ขอใช้รถส่วนตัว")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ขอใช้รถไปราชการ</th>
					</tr>
					<tr>
						<th style="max-width: 7mm; text-align: left"></th>
						<th style="max-width: 10mm; text-align: left"><input name="g"
							type="checkbox" value="ขอใช้รถไปราชการ"
							<%if (bean.getTravel().equals("ขอใช้รถไปราชการ")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ขอใช้รถส่วนตัว</th>
						<th style="max-width: 20mm; text-align: left">หมายเลขทะเบียน</th>
					</tr>
				</table>
				<br>
				<!--ตาราง การมอบหมายงานระหว่างไปราชการ  -->
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="text-align: left;"><label>8.
								การมอบหมายงานระหว่างไปราชการ </label></th>
					</tr>
				</table>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;
							8.1 งานสอนภาคปกติ</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitA" type="radio"
							<%if (bean.getCommitA().equals("ไม่มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ไม่มี</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitA" type="radio"
							<%if (bean.getCommitA().equals("มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> มี</th>
						<th style="width: 100mm; text-align: left;">มอบหมายให้
							&nbsp;&nbsp; <%=bean.getCommitADt()%></th>
					</tr>
					<tr>
						<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;
							8.2 งานสอนภาค กศ.บป./บัณฑิตศึกษา</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitB" type="radio"
							<%if (bean.getCommitB().equals("ไม่มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ไม่มี</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitB" type="radio"
							<%if (bean.getCommitB().equals("มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> มี</th>
						<th style="width: 100mm; text-align: left;">มอบหมายให้
							&nbsp;&nbsp;<%=bean.getCommitBDt()%></th>
					</tr>
					<tr>
						<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;
							8.3 งานประจำเวร/ประจำวัน</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitC" type="radio"
							<%if (bean.getCommitC().equals("ไม่มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ไม่มี</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitC" type="radio"
							<%if (bean.getCommitC().equals("มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> มี</th>
						<th style="width: 100mm; text-align: left;">มอบหมายให้
							&nbsp;&nbsp;<%=bean.getCommitCDt()%></th>
					</tr>
					<tr>
						<th style="width: 100mm; text-align: left;">&nbsp;&nbsp;&nbsp;
							8.4 งานอื่นๆ &nbsp;&nbsp;&nbsp; <%=bean.getOther()%></th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitD" type="radio"
							<%if (bean.getCommitD().equals("ไม่มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ไม่มี</th>
						<th style="width: 20mm; text-align: left;"><input
							name="commitD" type="radio"
							<%if (bean.getCommitD().equals("มี")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> มี</th>
						<th style="width: 100mm; text-align: left;">มอบหมายให้
							&nbsp;&nbsp;<%=bean.getCommitDDt()%></th>
					</tr>
				</table>
				<table
					style="width: 100%; border-collapse: collapse; margin-top: 2cm">
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





			<!--ประมาณการรายจ่ายไปราชการ -->
			<div class="page">

				<label>&nbsp;&nbsp; ประมาณการรายจ่ายไปราชการ
					(ให้แนบพร้อมกับใบขออนุญาตกรณีขอเบิกค่าใช้จ่าย)</label>

				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="max-width: 4mm; text-align: left">1. ข้าพเจ้า</th>
						<th style="max-width: 12mm;"><label>คณะมนุษยศาสตร์และสังคมศาสตร์
						</label></th>
						<th style="max-width: 2.5mm;">ตำเเหน่ง</th>
						<th style="max-width: 8mm;"><label>สาขาวิชาเทคโนโลยีและค</label></th>
					</tr>
					<tr>
						<th colspan="4" style="text-align: left">&nbsp;&nbsp;&nbsp;
							พร้อมด้วยผู้มีรายชื่อหน้า 2 รวม &nbsp;&nbsp;&nbsp; <label></label>
							&nbsp;&nbsp; คน (มีความประสงค์)
						</th>
					</tr>
					<tr>
						<th colspan="4" style="text-align: left">&nbsp;&nbsp; <input
							type="checkbox" value="ขออนุญาต"
							<%if (bean.getPurpose().equals("ขออนุญาต")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ขออนุญาต &nbsp;&nbsp; <input type="checkbox"
							value="ได้รับคำสั่ง"
							<%if (bean.getPurpose1().equals("ได้รับคำสั่ง")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ได้รับคำสั่ง &nbsp;&nbsp; <input
							type="checkbox" value="ไปราชการ"
							<%if (bean.getPurpose2().equals("ไปราชการ")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled>ไปราชการ &nbsp;&nbsp; เรื่อง &nbsp;&nbsp; <%=bean.getTopics()%>
						</th>
					</tr>
				</table>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="text-align: left; max-width: 16mm;">
							&nbsp;&nbsp;&nbsp; ที่ &nbsp;&nbsp; <label><%=bean.getDestinationName()%>
						</label>
						</th>
						<th style="text-align: left; max-width: 11mm;">อำเภอ
							&nbsp;&nbsp;<label><%=bean.getAmphur()%></label>
						</th>
						<th style="text-align: left; max-width: 11mm;">จังหวัด
							&nbsp;&nbsp;<label><%=bean.getAmphur()%></label>
						</th>
					</tr>
				</table>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="text-align: left; max-width: 15mm;">&nbsp;&nbsp;
							ในวันที่ &nbsp;&nbsp;&nbsp;&nbsp;<label> <%=bean.getGoDate()%>
						</label>
						</th>
						<th style="text-align: left; max-width: 15mm;">&nbsp;&nbsp;
							ถึงวันที่ &nbsp;&nbsp;&nbsp;&nbsp;<label> <%=bean.getBackDate()%></label>
						</th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th colspan="2" style="max-width: 100%; text-align: left">2.
							การไปราชการในครั้งนี้ ขอเบิกค่าใช้จ่ายจากงบประมาณ</th>
					</tr>
					<tr>
						<th style="text-align: left; max-width: 15mm;">
							&nbsp;&nbsp;&nbsp; <input name="v" type="checkbox"
							value="งบประมาณแผ่นดิน"
							<%if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> งบแผ่นดิน โครงการ <%=bean.getBudgetProject()%></th>
						<th style="text-align: left; max-width: 15mm;">รหัสโครงการ
							&nbsp;&nbsp; <%
 	if (bean.getBudgetBy().equals("งบประมาณแผ่นดิน")) {
 		out.print(bean.getBudgetPass());
 	}
 %>
						</th>
					</tr>
					<tr>
						<th style="text-align: left; max-width: 15mm;">
							&nbsp;&nbsp;&nbsp; <input name="v" type="checkbox"
							value="งบรายได้"
							<%if (bean.getBudgetBy().equals("งบรายได้")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> งบเงินรายได้ โครงการ <%=bean.getBudgetProject()%></th>
						<th style="text-align: left; max-width: 15mm;">รหัสโครงการ
							&nbsp;&nbsp;<%
							if (bean.getBudgetBy().equals("งบรายได้")) {
								out.print(bean.getBudgetPass());
							}
						%>
						</th>
					</tr>
					<tr>
						<th colspan="2" style="max-width: 100%; text-align: left">
							&nbsp;&nbsp;&nbsp; <input name="v" type="checkbox"
							value="งบอื่นๆ"
							<%if (bean.getBudgetBy().equals("งบอื่นๆ")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> งบอื่นๆ &nbsp;&nbsp;
						</th>
					</tr>
					<tr>
						<th colspan="2" style="max-width: 100%; text-align: left">&nbsp;&nbsp;
							โดยขอเบิกค่าใช้จาย <input name="v" type="checkbox"
							value="ตามสิทธิ์"
							<%if (bean.getBudgetExpenses().equals("ตามสิทธิ์")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> ตามสิทธื์ &nbsp;&nbsp; <input name="v"
							type="checkbox" value="เหมาจ่าย"
							<%if (bean.getBudgetExpenses().equals("เหมาจ่าย")) {
				out.print("checked ='checked' disabled");
			}%>
							disabled> เหมาจ่าย &nbsp;&nbsp; <label
							style="margin-right: 5%"> เป็นจำนวนเงิน </label><%=beanEs.getExpenseEstimateSumTotal()%><label
							style="margin-left: 5%">บาท </label>
						</th>
					</tr>
				</table>
				<br>
				<table style="width: 100%; border-collapse: collapse;">
					<tr>
						<th style="text-align: left;">3.
							ประมาณการรายจ่าย(กรณีไปราชการหลายคนโปรดกรอกราชละเอียดด้านหลัง)</th>
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
									<td style="text-align: left; width: 25mm"><label>3.1
											ค่าเบี้ยเลี้ยงเดินทาง</label></td>
									<td style="text-align: left; width: 3mm"><label>99
									</label></td>
									<td style="text-align: left; width: 10mm"><label>วันๆ
											ละ </label></td>
									<td style="text-align: left; width: 25mm"><label><%=beanEs.getAllowenceDetails()%></label></td>
									<td style="text-align: left; width: 1mm"><label>บาท</label></td>
								</tr>
								<tr>
									<td style="text-align: left; width: 25mm"><label>3.2
											ค่าเช่าที่พัก</label></td>
									<td style="text-align: left; width: 3mm"><label>99
									</label></td>
									<td style="text-align: left; width: 10mm"><label>คืนๆ
											ละ</label></td>
									<td style="text-align: left; width: 25mm"><label><%=beanEs.getRentDateDetails()%></label></td>
									<td style="text-align: left; width: 1mm"><label>บาท</label></td>
								</tr>
								<tr>
									<td colspan="5" style="text-align: left"><label>3.3
											ค่าเดินทาง</label></td>
								</tr>
							</table>
							<table style="width: 100%;">
								<%
									for (int i = 0; i < beanTr.size(); i++) {
								%>
								<tr>
									<td style="text-align: left; width: 35mm"><label
										style="margin-left: 5%;"> <%=3%>.<%=3%>.<%=i + 1%> <%=beanTr.get(i).getVehicleName()%></label>
									</td>
									<td style="text-align: left; width: 5mm"><label> <%
 	if (beanTr.get(i).getTravelExpenses() == 0) {
 			out.print("");
 		} else {
 			out.print(beanTr.get(i).getNumberPer());
 		}
 %></label>
									</td>
									<td style="text-align: left; width: 10mm"><label>เที่ยวๆ
											ละ</label></td>
									<td style="text-align: left; width: 12mm"><label>
											<%
												if (beanTr.get(i).getNumberPer() == 0) {
														out.print("");
													} else {
														out.print("(" + beanTr.get(i).getTravelExpenses() + "x" + beanTr.get(i).getUserSum() + ")");
													}
											%>
									</label></td>
									<td style="text-align: left; width: 3mm"><label>บาท</label></td>
								</tr>
								<%
									}
								%>
							</table>
							<table>
								<tr>
									<td style="text-align: left; width: 40mm"><label
										style="margin-left: 5%;">3.6.6 ค่าน้ำมันเชื้อเพลิง</label></td>
									<td style="text-align: left; width: 60mm"><label>
											<%
												if (beanTEFC.getDistance() == 0) {
													out.print("");
												} else {
													out.print("(" + beanTEFC.getDistance());
												}
											%>
											<%
												if (beanTEFC.getNumberPer() == 0) {
													out.print("");
												} else {
													out.print("x" + beanTEFC.getNumberPer());
												}
											%>
											<%
												if (beanTEFC.getFuelCost() == 0) {
													out.print("");
												} else {
													out.print("x" + beanTEFC.getFuelCost() + ")");
												}
											%>
											<%
												if (beanTEFC.getDivide() == 0) {
													out.print("");
												} else {
													out.print(" / " + beanTEFC.getDivide());
												}
											%>
									</label></td>
									<td style="text-align: left; width: 6mm"><label>บาท</label></td>
								</tr>
								<tr>
									<td style="text-align: left; width: 40mm"><label
										style="margin-left: 5%;">3.6.7 ค่าทางด่วน</label></td>
									<td style="text-align: left; width: 60mm"><label>
											<%
												if (beanTEFC.getExpresswayExpenses() == 0) {
													out.print("");
												} else {
													out.print("(" + beanTEFC.getExpresswayExpenses());
												}
											%>
											<%
												if (beanTEFC.getExpresswayNumberPer() == 0) {
													out.print("");
												} else {
													out.print("x" + beanTEFC.getExpresswayNumberPer() + ")");
												}
											%>
									</label></td>
									<td style="text-align: left; width: 6mm"><label>บาท</label></td>
								</tr>
								<tr>
									<td colspan="5" style="text-align: left"><label>3.4
											ค่าใช้จ่ายอื่นๆ</label></td>
								</tr>
								<tr>
									<td style="text-align: left; width: 64mm"><label
										style="margin-left: 5%;">3.4.1 ค่าลงทะเบียน</label></td>
									<td style="text-align: left; width: 60mm"><label></label>
									</td>
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
								<%
									for (int i = 0; i < beanTr.size(); i++) {
								%>
								<tr>
									<td style="text-align: left; width: 12mm"><label>
											<%
												if (beanTr.get(i).getSum() == 0) {
														out.print("....");
													} else {
														out.print(beanTr.get(i).getSum());
													}
											%>
									</label></td>
								</tr>
								<%
									}
								%>
							</table>
							<table>
								<tr>
									<td style="text-align: left;"><label>
											<%
												if (beanTEFC.getFuelCostSum() == 0) {
													out.print("...");
												} else {
													out.print(+beanTEFC.getFuelCostSum());
												}
											%>
									</label></td>
								</tr>
								<tr>
									<td style="text-align: left; width: 60mm"><label>
											<%
												if (beanTEFC.getExpresswayExpensesSum() == 0) {
													out.print("....");
												} else {
													out.print(beanTEFC.getExpresswayExpensesSum());
												}
											%>
									</label></td>
								</tr>
								<tr>
									<td colspan="5" style="text-align: left"><label>...</label>
									</td>
								</tr>
								<tr>
									<td style="text-align: left; width: 60mm"><label>...</label>
									</td>
								</tr>
							</table>
						</th>

						<th style="width: 70mm;"></th>
					</tr>
					<tfoot>
						<tr>
							<th align="center">รวมทั้งสิ้น</th>
							<th><label><%=beanEs.getExpenseEstimateSumTotal()%></label></th>
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
								<input name="v" type="checkbox"> งบแผ่นดิน &nbsp;&nbsp;
								<input name="v" type="checkbox"> งบรายได้ &nbsp;&nbsp; <input
									name="v" type="checkbox"> งบอื่นๆ &nbsp;&nbsp;
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
								<input name="v" type="checkbox"> งบแผ่นดิน &nbsp;&nbsp;
								<input name="v" type="checkbox"> งบรายได้ &nbsp;&nbsp; <input
									name="v" type="checkbox"> งบอื่นๆ &nbsp;&nbsp;
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

						<th style="max-width: 50mm;">
							<div align="left">
								<label>3. </label> &nbsp;&nbsp; <input name="v" type="checkbox">
								อนุญาต &nbsp;&nbsp; <input name="v" type="checkbox">
								ไม่อนุญาต &nbsp;&nbsp; <input name="v" type="checkbox">นำเสนอรองอธิการบดี
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
								&nbsp;&nbsp; <input name="v" type="checkbox"> อนุญาต
								&nbsp;&nbsp; <input name="v" type="checkbox"> ไม่อนุญาต
								&nbsp;&nbsp; <input name="v" type="checkbox">นำเสนอรองอธิการบดี
							</div> <br>
							<div align="left">
								<label>......................รองอธิการบดีปฏิบัติราชการแทนอธิการบดี</label>
							</div>
							<div align="left">
								&nbsp;&nbsp; <input name="v" type="checkbox"> อนุญาต
								&nbsp;&nbsp; <input name="v" type="checkbox"> ไม่อนุญาต
								&nbsp;&nbsp;
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
			</div>





			<!-- การพิจารณา -->
			<div class="page">

				<label><u>การพิจารณา</u>
					ผ่านผู้บังคับบัญชาในสายงานที่ขอไปราชการตามลำดับ</label> <br>

				<div style="margin-bottom: 6%">
					<label style="margin-right: 3%">1. <input name="v"
						type="checkbox"> หัวหน้าสาขาวิชา
					</label> <label style="margin-left: 3%; margin-right: 3%"> <input
						name="v" type="checkbox"> หัวหน้างาน
					</label> <label style="margin-left: 3%; margin-right: 3%"><input
						name="v" type="checkbox"> หัวหน้าฝ่าย
						....................... </label> <br> <label
						style="margin-left: 3%; margin-right: 3%"> เห็นด้วย </label> <label
						style="margin-left: 3%; margin-right: 3%"><input name="v"
						type="checkbox"> อนุญาต </label> <label style="margin-left: 5%;">
						โดยใช้งบ........รหัส.........จำนวน......บาท </label> <br> <label
						style="margin-left: 18%; margin-right: 3%"><input name="v"
						type="checkbox"> ไม่อนุญาต </label> <label
						style="margin-left: 3%;">เนื่องจาก..............................
					</label> <br>
					<div align="center" style="margin-top: 3%">
						<label>ลงชื่อ......................</label> <br> <label>(...........................)</label>
						<br> <label>......../......../........</label>
					</div>
				</div>

				<div style="margin-bottom: 6%">
					<label>2. <input name="v" type="checkbox">
						หัวหน้าภาควิชา
					</label> <label><input name="v" type="checkbox">
						ผู้อำนวยการกอง </label> <label><input name="v" type="checkbox">
						หัวหน้าสำนักงานเลชานุการคณะ / สำนัก / สถาบัน </label> <br> <label
						style="margin-left: 3%; margin-right: 3%"> เห็นด้วย </label> <label
						style="margin-left: 3%; margin-right: 3%"><input name="v"
						type="checkbox"> อนุญาต </label> <label style="margin-left: 5%;">
						โดยใช้งบ........รหัส.........จำนวน......บาท </label> <br> <label
						style="margin-left: 18%; margin-right: 3%"><input name="v"
						type="checkbox"> ไม่อนุญาต </label> <label
						style="margin-left: 3%;">เนื่องจาก..............................
					</label> <br>
					<div align="center" style="margin-top: 5%">
						<label>ลงชื่อ......................</label> <br> <label>(...........................)</label>
						<br> <label>......../......../........</label>
					</div>
				</div>

				<div style="margin-bottom: 6%">
					<label>3. การสั่งการ </label><br> <label
						style="margin-left: 2%;"><input name="v" type="checkbox">
						อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label> <label><input
						name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label> <label><input
						name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย </label> <br> <label
						style="margin-left: 2%;"><input name="v" type="checkbox">
						ไม่อนุญาต </label> <br> <label style="margin-left: 2%;"><input
						name="v" type="checkbox"> นำเสนอรองอธิการบดี (เกิน 30,000)</label>
					<br>
					<div style="margin-left: 20%; margin-top: 4%">
						<label>......................คณะบดี / ผอ.สำนัก / ผอ.สถาบัน
							ปฏิบัติราชการแทนอธิการบดี</label> <br> <label>...../....../........</label>
					</div>
					<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
						<label>......................ผู้ช่วยอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label>
						<br> <label>...../....../........</label>
					</div>
					<label style="margin-left: 2%;"><input name="v"
						type="checkbox"> อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label> <label><input
						name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label> <label><input
						name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย</label> <br> <label
						style="margin-left: 2%;"><input name="v" type="checkbox">
						ไม่อนุญาต </label> <br> <label style="margin-left: 2%;"><input
						name="v" type="checkbox"> นำเสนอรองอธิการบดี (เกิน 50,000)
					</label> <br>
					<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
						<label>......................รองอธิการบดีฝ่าย....................ปฏิบัติราชการแทนอธิการบดี</label>
						<br> <label>...../....../........</label>
					</div>
					<label style="margin-left: 2%;"><input name="v"
						type="checkbox"> อนุญาต <u>มอบงานธุรการ</u>จัดทำสั่งโดย </label> <label><input
						name="v" type="checkbox"> เบิกค่าใช้จ่ายตามประมาณการ </label> <label><input
						name="v" type="checkbox"> ไม่เบิกค่าใช้จ่าย</label> <br> <label
						style="margin-left: 2%;"><input name="v" type="checkbox">
						ไม่อนุญาต </label> <br>
					<div style="margin-left: 20%; margin-top: 4%; margin-bottom: 6%">
						<label>......................อธิการบดี /
							รองอธิการบดีฝ่ายรักษาราชการแทนอธิการบดี</label> <br> <label>...../....../........</label>
					</div>

				</div>
			</div>







			<!-- 	สรูป ใบสุดท้าย -->
			<div class="page">
				<!-- สรุป -->
				<div style="size: 10; margin-bottom: 5%" class="col-sm-12">

					<table id="customers" style="margin-bottom: 10mm; margin-top: 10mm">
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
							<th style="text-align: left;margin-left: 2mm"><%=i + 1%></th>
							<th style="text-align: left;"><%=beanEE.get(i).getUserFname()%>&nbsp;&nbsp; <%=beanEE.get(i).getUserLname()%></th>
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
						<%
							}
						%>
						<tr>
							<th colspan="3"><label style="margin-left: 10%">รวม</label>
								<label style="margin-left: 10%"><%=beanEs.getUserSumTotal()%></label>
								<label style="margin-left: 25%">คน</label><label
								style="margin-left: 23%">รวมเงิน</label></th>
							<th>
								<%
									if (beanEs.getAllowenceSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEs.getAllowenceSumTotal());
									}
								%>
							</th>
							<th>
								<%
									if (beanEs.getRentDateSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEs.getRentDateSumTotal());
									}
								%>
							</th>
							<th>
								<%
									if (beanEs.getTravelSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEs.getTravelSumTotal());
									}
								%>
							</th>
							<th>
								<%
									if (beanEs.getOtherSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEs.getOtherSumTotal());
									}
								%>
							</th>
							<th>
								<%
									if (beanEs.getExpenseEstimateSumTotal().equals("0")) {
										out.print("");
									} else {
										out.print(beanEs.getExpenseEstimateSumTotal());
									}
								%>
							</th>
							<th></th>
						</tr>
					</table>

					<!-- 			<div class="col-sm-5"> -->
					<!-- 			</div> -->
					<!-- 			<div class="col-sm-7"> -->
					<!-- 			<table id="customers"> -->
					<!-- 				<tr> -->
					<!-- 					<th colspan="4" style="background-color: buttonhighlight;"><lable>คำชี้แจง</lable><br> -->
					<!-- 						<lable>1. กำหนดอัตราค่าเบี๋ยเลี้ยง -->
					<!-- 						ค่าที่พักให้มีสิทธ์เบิกได้ดังนี้</lable></th> -->
					<!-- 				</tr> -->
					<!-- 				<tr> -->
					<!-- 					<td rowspan="2">ตำแหน่ง</th> -->
					<!-- 					<td colspan="2">ค่าเบี๋ยเลี้ยง</th> -->
					<!-- 					<td rowspan="2">ค่าที่พัก<br>กรณีใช้ใบเสร็จ</th> -->
					<!-- 				<tr> -->
					<!-- 					<td>ก</th> -->
					<!-- 					<td>ข</th> -->
					<!-- 				</tr> -->
					<!-- 				<tr> -->
					<!-- 					<td>เที่ยบเท่าระดับ 1-8</td> -->
					<!-- 					<td>240</td> -->
					<!-- 					<td>144</td> -->
					<!-- 					<td>ห้องพักเดี่ยว 1,500 -->
					<!-- 						<hr>ห้องพักคู่ 850 -->
					<!-- 					</td> -->
					<!-- 				</tr> -->
					<!-- 				<tr> -->
					<!-- 					<td>เที่ยบเท่าระดับ 9 ขึ้นไป</td> -->
					<!-- 					<td>270</td> -->
					<!-- 					<td>162</td> -->
					<!-- 					<td>ห้องพักเดี่ยว 2,200 -->
					<!-- 						<hr>ห้องพักคู่ 1,200 -->
					<!-- 					</td> -->
					<!-- 				</tr> -->
					<!-- 				<tr> -->
					<!-- 					<td colspan="4" style="background-color: buttonhighlight;"><lable>ค่าที่พักกรณีเบิกค่าใช้จ่าย</lable></td> -->
					<!-- 				</tr> -->
					<!-- 				<tr> -->
					<!-- 					<td colspan="2">ตำแหน่ง</td> -->
					<!-- 					<td colspan="2">อัตรา/คืน/คน</td> -->
					<!-- 				<tr> -->
					<!-- 				<tr> -->
					<!-- 					<td colspan="2">เที่ยบเท่าระดับ 1-8</td> -->
					<!-- 					<td colspan="2">800</td> -->
					<!-- 				<tr> -->
					<!-- 				<tr> -->
					<!-- 					<td colspan="2">เที่ยบเท่าระดับ 9 ขึ้นไป</td> -->
					<!-- 					<td colspan="2">1,200</td> -->
					<!-- 				<tr> -->
					<!-- 			</table> -->
					<!-- 			</div> -->

				</div>
			</div>

<!-- ใบเบิกค่าใช้จ่ายในการเดินทางไปราชการ -->
			<div class="page">

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
				</table>

				<h4 align="center">
					<b>ใบเบิกค่าใช้จ่ายในการเดินทางไปราชการ</b>
				</h4>

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
						<th style="width: 20mm; text-align: center;">4654/63</th>
						<th style="width: 10mm; text-align: left;">ลงวันที่</th>
						<th style="width: 50mm; text-align: center;"></th>
						<th style="width: 15mm; text-align: left;">ได้อนุมัติ</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 5mm; text-align: left;">ข้าพเจ้า</th>
						<th style="width: 35mm; text-align: center;"><label><%=bean.getSex() %><%=bean.getUserFname()%>&nbsp;&nbsp; <%=bean.getUserLname()%></label></th>
						<th style="width: 10mm; text-align: left;">ตำแหน่ง</th>
						<th style="width: 60mm; text-align: center;"><%=bean.getSubPositionName() %></th>
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
							<%for (int i = 0; i < beanEE.size(); i++) {%>
							, <%=beanEE.get(i).getSex()%><%=beanEE.get(i).getUserFname()%>&nbsp;&nbsp; <%=beanEE.get(i).getUserLname()%> 
							<%}%>
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
						<th style="width: 30mm; text-align: left;"><input name="v"
							type="checkbox" value="" disabled> บ้านพัก <input
							name="v" type="checkbox" value="" disabled> สำนักงาน</th>
						<th style="width: 7mm; text-align: left;">เลขที่</th>
						<th style="width: 12mm; text-align: left;"></th>
						<th style="width: 5mm; text-align: left;">ถนน</th>
						<th style="width: 20mm; text-align: left;"></th>
						<th style="width: 5mm; text-align: left;">อำเภอ</th>
						<th style="width: 30mm; text-align: left;"></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 10mm; text-align: left;">จังหัด</th>
						<th style="width: 35mm; text-align: center;"></th>
						<th style="width: 12mm; text-align: left;">ตั้งแต่วันที่</th>
						<th style="width: 30mm; text-align: center;"></th>
						<th style="width: 5mm; text-align: left;">เวลา</th>
						<th style="width: 20mm; text-align: center;"></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 40mm; text-align: left;">และกลับถึง <input
							name="v" type="checkbox" value="" disabled> บ้านพัก <input
							name="v" type="checkbox" value="" disabled> สำนักงาน
						</th>
						<th style="width: 7mm; text-align: left;">วันที่</th>
						<th style="width: 40mm; text-align: center;"></th>
						<th style="width: 5mm; text-align: left;">เวลา</th>
						<th style="width: 20mm; text-align: center;"></th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 15mm; text-align: left;">รวมเวลาไปราชการครั้งนี้</th>
						<th style="width: 5mm; text-align: center;">99</th>
						<th style="width: 2mm; text-align: left;">วัน</th>
						<th style="width: 5mm; text-align: center;">999</th>
						<th style="width: 5mm; text-align: left;">ชั่วโมง</th>
						<th style="width: 20mm"></th>
					</tr>
				</table>
				<br> <br>
				<table>
					<tr>
						<th style="width: 15mm"></th>
						<th style="text-align: left;">ข้าพเจ้าขอเบิกค่าใช้จ่ายในการเดินทางไปราชการสำหรับ
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="v"
							type="checkbox" value="" disabled> ข้าพเจ้า <input
							name="v" type="checkbox" value="" disabled> คณะเดินทาง
							&nbsp;&nbsp;&nbsp;&nbsp; ดังนี้
						</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 25mm; text-align: left;">ค่าเบี๋ยเลี้ยงเดินทางประเภท</th>
						<th style="width: 5mm; text-align: center;"><input name="v"
							type="checkbox" value="" disabled> ก <input name="v"
							type="checkbox" value="" disabled> ข</th>
						<th style="width: 1mm; text-align: left;">จำนวน</th>
						<th style="width: 7mm; text-align: left;"></th>
						<th style="width: 2mm; text-align: left;">วัน รวม</th>
						<th style="width: 10mm; text-align: center;"><%=beanEs.getAllowenceSumTotal() %></th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 15mm; text-align: left;">ค่าเช่าที่พักประเภท</th>
						<th style="width: 20mm; text-align: center;"><input name="v"
							type="checkbox" value="" disabled> ก <input name="v"
							type="checkbox" value="" disabled> ข</th>
						<th style="width: 1mm; text-align: left;">จำนวน</th>
						<th style="width: 7mm; text-align: center;"></th>
						<th style="width: 2mm; text-align: left;">วัน รวม</th>
						<th style="width: 10mm; text-align: center;"><%=beanEs.getRentDateSumTotal()%></th>
						<th style="width: 2mm">บาท</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 40mm; text-align: left;">ค่าพาหนะ</th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวม</th>
						<th style="width: 12mm; text-align: center;"><%=beanEs.getTravelSumTotal() %></th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 40mm; text-align: left;">ค่าใช่จ่ายอื่นๆ</th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวม</th>
						<th style="width: 12mm; text-align: center;"></th>
						<th style="width: 2mm">บาท</th>
					</tr>
					<tr>
						<th style="width: 40mm; text-align: left;"></th>
						<th style="width: 17mm; text-align: left;"></th>
						<th style="width: 8mm; text-align: left;">รวมทั้งสิ้น</th>
						<th style="width: 12mm; text-align: center;"><%=beanEs.getExpenseEstimateSumTotal() %></th>
						<th style="width: 2mm">บาท</th>
					</tr>
				</table>
				<br> <br>
				<table>
					<tr>
						<th style="text-align: left;">จำนวนเงิน/ตัวอักษร
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 15mm"></th>
						<th style="text-align: left;"><label>ข้าพเจ้าขอรับรองว่ารายการที่กล่าวข้างต้นเป็นความจริง
								และหลักฐานการจ่ายที่ส่งมาด้วยจำนวน </label></th>
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

</body>
</html>