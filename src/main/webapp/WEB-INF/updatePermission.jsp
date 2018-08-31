<%@page import="java.util.List"%>
<%@page import="com.hillert.model.ExpenseEstimateBean"%>
<%@page import="com.hillert.model.UserBean"%>
<%@page import="com.hillert.model.PermissionBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>

	<style type="text/css">
	#grad1 {
    background: red; /* For browsers that do not support gradients */
    background: -webkit-linear-gradient(yellow, purple); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(yellow, purple); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(yellow, purple); /* For Firefox 3.6 to 15 */
    background: linear-gradient(yellow, purple); /* Standard syntax */
	}
	</style>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/css/tableUpdatePermission.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/table.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="/js/dataUser.js"></script>
	<script src="/js/dataUser1.js"></script>
	<script src="/js/province.js"></script>
	<script src="/js/updateExpense.js"></script>

<%
	PermissionBean bean = null;
	String result = "";
%>
<%
	bean = (PermissionBean) request.getAttribute("perBean");
	result = (String) request.getAttribute("messesUpdate");
%>

</head>

<body style="margin-top: 5%;background-color: gray;" id="grad1">

<!-- สรุป -->
<header class="w3-display-container w3-content" style="max-width:95%;margin-bottom: 3%">
	<div class="w3-container w3-blue">
    	<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มประมาณการรายจ่าย</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">

<form action="#" id="form1">
<!-- ค่าเบี๋ยเลี้ยงเเละค่าที่พัก -->
<div style="size: 10;margin-bottom: 3%;" class="col-sm-12" >
	<table id="ExpenseByPermission" class="table table-bordered">   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">ชื่อ</th>
        	<th style="text-align:center">นามสกุล</th>
        	<th style="text-align:center">ระดับ</th>
			<th style="text-align:center">ค่าเบี้ยเลี้ยง</th>
			<th style="text-align:center">จำนวน<br>วัน</th>
			<th style="text-align:center">รวม<br>เบี้ยเลี้ยง</th>
    	    <th style="text-align:center">ค่าที่พัก</th>
			<th style="text-align:center">จำนวน<br>วัน</th>
			<th style="text-align:center">รวม<br>ที่พัก</th>
			<th style="text-align:center">รวม</th>
			<th></th> 
    	</tr>
    	</thead>
    	<tfoot>
    	<tr>
    		<th style="text-align:center" colspan="9"></th>
			<th style="text-align:center" >รวม</th>
			<th colspan="2"> <label style="margin-left: 5%" id="summary">บาท</label></th>
    	</tr>
    	</tfoot>
    </table>
    <div align="right">
    	<input class=" btn btn-primary" type="button" value="เพิ่มบุลคลากร" onclick="document.getElementById('id01').style.display='block'">
    </div>
</div>

<!--ค่าใช้จ่าย เรื่องพาหนะ -->
<div style="size: 10;margin-bottom: 2%;" class="col-sm-8" >
	<h3 style="background-color: blue;color: white;"align="center"><i class="fa fa-car w3-margin-right" style="font-size:30px;"></i>เลือกค่า พาหนะในการเดินทาง และกำหนดค่า  (หมายเหตุ ถ้ามี)</h3><br>
	<table id="TravelByPermission" class="table table-bordered">   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th>รหัส</th>
         	<th>รายการ</th>
        	<th>จำนวน/เที่ยว</th>
        	<th>ราคา</th>
			<th>รวม</th>
			<th>หมายเหตุ</th>
			<th></th> 
    	</tr>
    	</thead>
    	<tfoot>
    	<tr>
    		<th style="text-align:center" colspan="3"></th>
			<th style="text-align:center" >รวม</th>
			<th style="text-align:center" ><label id="summary1">บาท</label></th>
			<th colspan="2"></th>
    	</tr>
    	</tfoot>
    </table>
    <div align="right">
   		<input class=" btn btn-primary" type="button" value="เลือกพาหนะ" onclick="document.getElementById('id02').style.display='block'">
    </div>
</div>

			<div style="size: 10; margin-bottom: 3%;" class="col-sm-4">
				<!-- Page Container -->
				<div class="w3-container w3-content" style="max-width: 800px; margin-top: 20px">
					<!-- Profile -->
					<div class="w3-card w3-round w3-Turquoise">
						<div class="w3-container"></div>
						<table id ="customers" >
							<tr>
								<th colspan="4" style="background-color:buttonhighlight; ;"><lable>คำชี้แจง</lable><br> <lable>1. กำหนดอัตราค่าเบี๋ยเลี้ยง ค่าที่พักให้มีสิทธ์เบิกได้ดังนี้</lable></th>
							</tr>
							<tr>
								<th rowspan="2">ตำแหน่ง</th>
								<th colspan="2">ค่าเบี๋ยเลี้ยง</th>
								<th rowspan="2">ค่าที่พัก<br>กรณีใช้ใบเสร็จ
								</th>
							<tr>
								<th>ก</th>
								<th>ข</th>
							</tr>
							<tr>
								<th>เที่ยบเท่าระดับ 1-8</th>
								<th>240</th>
								<th>144</th>
								<th>ห้องพักเดี่ยว 1,500
									<hr>ห้องพักคู่ 850
								</th>
							</tr>
							<tr>
								<th>เที่ยบเท่าระดับ 9 ขึ้นไป</th>
								<th>270</th>
								<th>162</th>
								<th>ห้องพักเดี่ยว 2,200
									<hr>ห้องพักคู่ 1,200
								</th>
							</tr>
							<tr>
								<th colspan="4" style="background-color:buttonhighlight; ;"><lable>ค่าที่พักกรณีเบิกค่าใช้จ่าย</lable></th>
							</tr>
							<tr>
								<th colspan="2">ตำแหน่ง</th>
								<th colspan="2">อัตรา/คืน/คน</th>
							<tr>
							<tr>
								<th colspan="2">เที่ยบเท่าระดับ 1-8</th>
								<th colspan="2">800</th>
							<tr>
							<tr>
								<th colspan="2">เที่ยบเท่าระดับ 9 ขึ้นไป</th>
								<th colspan="2">1,200</th>
							<tr>
						</table>
					</div>
				</div>
			</div>

		</form>
	</div>
</header>

<form name="perUpdate" id="perUpdate" action="/perUpdate" method="post">

<header class="w3-display-container w3-content" style="max-width:95%;margin-bottom:3%">
 <div class="w3-container w3-red" >
      <h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มขออนุญาตไปราชการ</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
	<input type="hidden" name="permissionId" value="<%=bean.getPermissionId()%>">
<!-- กรอบที่ 1 -->
<div style="margin-bottom: 18%">
<div style="size: 10" class="col-sm-12" >   
	<div style="size: 5" class="col-sm-4 ">
	
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	
	<!-- ภาควิชา  department -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">ส่วนราชการ </label>
		<select class="form-control" name="faculty" id="faculty" >
			<option><%=bean.getFaculty()%></option>
		</select>
	</div>
	<!-- ตำแหน่ง  position -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">สังกัด</label> 
		<select class="form-control" name="department" id="department">
			<option><%=bean.getDepartment()%></option>
		</select>
	</div>
	<div class="form-group"><label> เมื่อวันที่ : </label>
		<input class="form-control" type='date' value="<%=bean.getDate()%>">
	</div> 
		</div></div></div>
	</div> 

	<div style="size: 10" class="col-sm-4 " >
	
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	
	<div class="form-group"><label> ข้าพเจ้า : </label>
	<input class="form-control" readonly="" type="text" name="name"  value="&nbsp;&nbsp;<%=bean.getName()%>"> 
    </div>
	<div class="form-group">
	<label for="exampleFormControlSelect1">ตำแหน่ง</label> 
		<select class="form-control" name="position" id="position">
			<option value="<%=bean.getPosition()%>"><%=bean.getPosition()%></option>
		</select>
	</div>
	
	<!-- ระดับ supPosition -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ภาควิชา</label>
			<select class="form-control" name="subPosition" id="subPosition">
				<option value="<%=bean.getSubPosition()%>"><%=bean.getSubPosition()%></option>
			</select>
	</div>
    	</div></div></div>
 	</div>

	<div style="size: 10" class="col-sm-4 " >
	
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	<div>
	<label>ขอไปราชการในฐานะ : </label>
		<input name="status" id="status1" type="radio" value="ผู้บริหาร" <%if (bean.getStatus().equals("ผู้บริหาร")) { out.print("checked ='checked'"); }%>	 style="margin-left: 3%">
			<label style="margin-left: 2%">ผู้บริหาร    	 </label>
        <input name="status" id="status2" type="radio" value="ผู้สอน" 	<%if (bean.getStatus().equals("ผู้สอน")) { out.print("checked ='checked'"); }%>	 style="margin-left: 3%">
        	<label style="margin-left: 2%">ผู้สอน		 </label>	
    </div>
    <div>
        <input name="status" id="status3" type="radio" value="ผู้สนับสนุนการสอน" <%if (bean.getStatus().equals("ผู้สนับสนุนการสอน")) { out.print("checked ='checked'"); }%> style="margin-left: 33%">
        	<label style="margin-left: 2%">ผู้สนับสนุนการสอน</label>
    </div>         
	<label> เพื่อ (ระบุวัตถุประสงค์/ลักษณะงาน): </label>
	<textarea class="form-control" rows="5" cols="50" id="object" name="object"><%=bean.getObject() %></textarea>
	<!-- เลือกไฟล์ นำเข้า -->
	<form name="v" enctype="multipart/form-data" style="margin-top: 2%">  
       <input name="v" type="file">
	</form>
	</div>
		</div></div></div>
</div>
</div>

<!-- กรอบที่ 2 -->
<div style="size: 10;margin-bottom: 4%" class="col-sm-12" >
<div style="size: 10" class="col-sm-5" >

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	<label>สถานที่ไปราชการ </label>
    <div class="form-group">
   		<input class="form-control" name="destinationName" id="destinationName" type="text" value="<%=bean.getDestinationName() %>">
    </div>
	<!-- จังหวัด province -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">จังหวัด</label> 
		<select class="form-control" name="province" id="province">
			<option value="<%=bean.getProvince() %>" ><%=bean.getProvince() %></option>
		</select>
	</div>
	<!-- อำเภอ Amphur -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">อำเภอ</label>
			<select class="form-control" name="amphur" id="amphur">
				<option value="<%=bean.getAmphur() %>"><%=bean.getAmphur() %></option>
			</select>
	</div>
	<!-- ตำบล  District -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ตำบล</label>
		<select class="form-control" name="district" id="district">
			<option value="<%=bean.getDistrict() %>"><%=bean.getDistrict() %></option>
		</select>
	</div>
		</div></div></div>
</div>

<div style="size: 10" class="col-sm-3 " >	

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	 <div class="form-group"><label>วันที่ไป:  </label><input class="form-control" type="date" id='goDate' name="goDate" value="<%=bean.getGoDate()%>"> </div>
	 <div class="form-group"><label>เวลาออก : </label><input class="form-control" type='time' id='goTime' name="goTime" value="<%=bean.getGoTime()%>"> </div>
	 <div class="form-group"><label>วันที่กลับ : </label><input class="form-control" type='date' id='backDate' name="backDate" value="<%=bean.getBackDate()%>"> </div>
     <div class="form-group"><label>เวลากลับ : </label><input class="form-control" type='time' id='backTime' name="backTime" value="<%=bean.getBackTime()%>"> </div>
     	</div></div></div>
</div>

<div style="size: 10" class="col-sm-4 " >

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	<div class="col-sm-8 " >
	<div class="form-group">
	<font size="3"> งบประมาณ : </font>
		<select class="form-control" name="Budget" id="budget" >
			<option value="<%=bean.getBudget() %>"><%=bean.getBudget() %></option>
        	<option value="ไม่เบิกค่าใช้จ่าย">ไม่เบิกค่าใช้จ่าย </option>
        	<option value="เบิกค่าใช้จ่าย" >เบิกค่าใช้จ่าย</option>	
		</select>
	</div>
    </div>
	<!-- เบิกค่าใช้จ่าย -->
	<div class="col-sm-4 " >
	<div class="form-group">
	<label>เบิกค่าใช้จ่าย  </label>		
		<select class="form-control" name="budgetExpenses" id="budgetExpenses">
			<option value="<%=bean.getBudgetExpenses() %>"><%=bean.getBudgetExpenses() %></option>
        	<option value="ตามสิทธิ์">ตามสิทธิ์</option>
  			<option value="เหมาจ่าย">เหมาจ่าย</option>
		</select>
	</div>
	</div>
	<div class="col-sm-12 " >
	<div class="form-group">
	<label>ใช้งบประมาณ  </label>
		<select class="form-control" name="budgetBy" id="budgetBy">
			<option value="<%=bean.getBudgetBy() %>" ><%=bean.getBudgetBy() %></option>
        	<option value="งบประมาณแผ่นดิน">งบประมาณแผ่นดิน</option>
  			<option value="งบรายได้">งบรายได้</option>
  			<option value="อื่นๆ"	>อื่นๆ</option>
		</select>
	</div></div>
	<div class="col-sm-12" >
	<div class="form-group">
	<label> โครงการ : </label><input class="form-control" name="budgetProject" id="budgetProject" type="text" value="<%=bean.getBudgetProject()%>">
	</div></div>
	<div class="col-sm-7 " >
	<div class="form-group">
	<label> รหัส :   </label><input class="form-control" name="budgetPass" id="budgetPass" type="text" value="<%=bean.getBudgetPass()%>">
	</div></div>
	<div class="col-sm-5 " >
	<div class="form-group">
	<label> วงเงิน :   </label><input class="form-control" name="" id="" type="number" value="">
	</div></div>
	</div> 
		</div></div></div>
</div> 

<!-- กรอบที่ 3 -->
<div style="size: 10;margin-bottom: 5%" class="col-sm-12 " >
<div style="size: 10" class="col-sm-5 " >

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	<div class="form-group">
	<label> การเดินทาง  </label>   
    <select class="form-control" name="travel" id="travel" onChange="ShowReg(this.selectedIndex)">
  		<option value="<%=bean.getTravel() %>"	>	<%=bean.getTravel() %></option>
      	<option value="พาหนะประจำทาง"	>	พาหนะประจำทาง</option>
  		<option value="ขอใช้รถส่วนตัว "	>	ขอใช้รถส่วนตัว </option>
  		<option value="ขอใช้รถไปราชการ"	>	ขอใช้รถไปราชการ </option>
	</select>
    </div>
    
	<div class="form-group">
	<label> หมายเลขทะเบียน </label>
		<input class="form-control" name="travelIdcard" id="travelIdcard" type="text" value="<%=bean.getTravelIdcard() %>" maxlength="5">
	</div> 

	</div></div></div>
</div>
   
<!--ตาราง การมอบหมายงานระหว่างไปราชการ  -->
<div style="size: 10" class="col-sm-7 " >

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	 <table id="customers">
     <tr class="w3-purple" align="center">
     	<th colspan="3"> การมอบหมายงานระหว่างไปราชการ </th>
     </tr>
     <tr>
      <td>งานสอนภาคปกติ</td>
      <td align="center"><input type="radio" name="commitA" id="commitA1" value="มี" <%if (bean.getCommitA().equals("มี")) { out.print("checked ='checked'"); }%> >&nbsp;มี&nbsp;&nbsp;
      <input name="commitADt" id="commitADt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input type="radio" name="commitA" id="commitA2" value="ไม่มี" <%if (bean.getCommitA().equals("ไม่มี")) { out.print("checked ='checked'"); }%> >&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
    <td>งานสอนภาค กศ.บป./บัณฑิตศึกษา</td>
   	  <td align="center"><input type="radio" name="commitB" id="commitB1" value="มี" <%if (bean.getCommitB().equals("มี")) { out.print("checked ='checked'"); }%> >&nbsp;มี&nbsp;&nbsp;
   	  <input name="commitBDt" id="commitBDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input type="radio" name="commitB" id="commitB2" value="ไม่มี" <%if (bean.getCommitB().equals("ไม่มี")) { out.print("checked ='checked'"); }%> >&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
      <td>งานประจำเวร/ประจำวัน</td>
      <td align="center"><input type="radio" name="commitC" id="commitC1" value="มี" <%if (bean.getCommitC().equals("มี")) { out.print("checked ='checked'"); }%> >&nbsp;มี&nbsp;&nbsp;
      <input name="commitCDt" id="commitCDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input type="radio" name="commitC" id="commitC2" value="ไม่มี" <%if (bean.getCommitC().equals("ไม่มี")) { out.print("checked ='checked'"); }%> >&nbsp;&nbsp;ไม่มี</td>
    </tr>
    <tr>
      <td>งานอื่นๆ</td>
      <td align="center"><input type="radio" name="commitD" id="commitD1" value="มี" <%if (bean.getCommitD().equals("มี")) { out.print("checked ='checked'"); }%> >&nbsp;มี&nbsp;&nbsp;
      <input name="commitDDt" id="commitDDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
      <td align="center"><input type="radio" name="commitD" id="commitD2" value="ไม่มี" <%if (bean.getCommitD().equals("ไม่มี")) { out.print("checked ='checked'"); }%> >&nbsp;&nbsp;ไม่มี</td>
    </tr>
	</table>
	</div></div></div>
</div>
</div>

	<div style="size: 10" class="col-sm-12 " align="center">
		<button type="submit" class="btn btn-success" >ยืนยัน</button>
		<button type="reset" class="btn btn-danger">รีเซต</button>
	</div>
	
	</div>
</header>
</form>
	
	<form name="backForm"   action="gotoUserAll" method="post" th:hidden="true"></form>

	<!-- เพิ่มบุคคลากร -->
	<header class="w3-display-container w3-content">
	<div id="id01" class="modal">
		<form class="modal-content animate" action=""
			style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มบุคคลากร
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
				<table id="userTable" class="table table-bordered">
					<thead>
						<tr style="background: purple; color: white;">
							<th>ลำดับ</th>
							<th>ชื่อ</th>
							<th>นามสกุล</th>
							<th>คณะ</th>
							<th>ภาควิชา</th>
							<th>ตำแหน่ง</th>
							<th>ระดับ</th>
						</tr>
					</thead>
				</table>

				<div style="size: 10" class="col-sm-12 " align="center">
					<button type="button" class="btn btn-success" id="buttonAdd1">ยืนยัน</button>
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="btn btn-danger">ปิด</button>
				</div>
			</div>
		</form>
	</div>

	<!-- เพิ่มพาหนะ--> <header class="w3-display-container w3-content">
	<div id="id02" class="modal">
		<form class="modal-content animate" action=""
			style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
				<table id="travelTable" class="table table-bordered">
					<thead>
						<tr style="background: purple; color: white;">
							<th>ลำดับ</th>
							<th>พาหนะ</th>
						</tr>
					</thead>
				</table>

				<div style="size: 10" class="col-sm-12 " align="center">
					<button type="button" class="btn btn-success" id="buttonAdd2">ยืนยัน</button>
					<button type="button"
						onclick="document.getElementById('id02').style.display='none'"
						class="btn btn-danger">ปิด</button>
				</div>
			</div>
		</form>
	</div>
	</header>
	
	</header>
	<!-- เพิ่มบุคคลากร -->
	<script>
		// Get the modal
		var modal = document.getElementById('id01');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<!-- เพิ่มพาหนะ-->
	<script>
		// Get the modal
		var modal = document.getElementById('id02');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>


</body>
</html>