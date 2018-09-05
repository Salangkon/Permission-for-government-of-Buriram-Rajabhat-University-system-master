<%@page import="com.hillert.model.ExpenseSumaryBean"%>
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
	<style>
	@media screen and (max-width: 500px) {
		.h3 {
			font-size: 16px;
		}
	}
	</style>



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
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script src="/js/useCar.js"></script>
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="/js/listFaculty.js"></script>
	<script src="/js/listPosition.js"></script>
	<script src="/js/updateExpense.js"></script>
	<script src="/js/province.js"></script>
<!-- 	<script src="/js/budget.js"></script> -->

<%
	PermissionBean bean = null;
	ExpenseSumaryBean beanEs = null;
	String result = "";
%>
<%
	bean = (PermissionBean) request.getAttribute("perBean");
	beanEs = (ExpenseSumaryBean) request.getAttribute("beanEs");
	result = (String) request.getAttribute("messesUpdate");
%>

</head>

<body>

<div class="w3-sidebar w3-light-grey w3-card-4 w3-animate-left" style="width:200px" id="mySidebar">
  <div class="w3-bar w3-dark-grey">
  <span class="w3-bar-item w3-padding-16">Manu</span>
  <button onclick="w3_close()"
  class="w3-bar-item w3-button w3-right w3-padding-16" title="close Sidebar">&times;</button>
  </div>
  <div class="w3-bar-block">
  <div class="w3-dropdown-hover">
    <a class="w3-button" href="#">เลือก<i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-bar-block w3-card-4">
      <a class="w3-bar-item w3-button" href="#1"> แบบฟอร์มขออนุญาตไปราชการ</a>
      <a class="w3-bar-item w3-button" href="#2"> แบบฟอร์มประมาณการรายจ่าย</a>
    </div>
  </div>
  <a class="w3-bar-item w3-button" href="javascript:void(0)">Support</a>
  <a class="w3-bar-item w3-button w3-green" href="/welcomeUser">ย้อนกลับ</a>
  </div>
</div>



<div id="main" style="margin-left:200px">

<div class="w3-container w3-display-container" style="background-color: gray;" id="grad1">
  <span title="open Sidebar" style="display:none" id="openNav" class="w3-button w3-transparent w3-display-topleft w3-xlarge" onclick="w3_open()">&#9776;</span>




<header class="w3-display-container w3-content" style="max-width:90%;margin-top: 2%" >
	<div class="w3-container w3-red" id="1">
		<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มขออนุญาตไปราชการ</h2>
    </div>
    
    <div class="w3-container w3-white w3-padding-16">
    

<!-- กรอบที่ 1 -->
<div style="margin-bottom: 18%">

<div style="size: 10" class="col-sm-12" >
	<div style="size: 10" class="col-sm-8 " >
	
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	<div class="form-group"  style="margin-top: 3%"><label> ข้าพเจ้า  </label>
	<input class="form-control" readonly="" type="text" name="name" id="name" value="&nbsp;&nbsp;<%=bean.getSex() %><%=bean.getUserFname() %> &nbsp;&nbsp; <%=bean.getUserLname()%>"> 
    </div>

	<div class="form-group" style="margin-top: 3%">
	<label> เลือกตำแหน่ง  </label>
		<select class="form-control" name="personnelId" id="personnelId">
			<option><%=bean.getFacultyName() %> / <%=bean.getDepartmentName() %> / <%=bean.getPositionName() %> / <%=bean.getSubPositionName() %></option>
		</select>
	</div>
    </div></div></div>
 	</div>
	
	<div style="size: 10" class="col-sm-4 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" >
	<div  style="margin-top: 3%">
	<div></div>
    <div>
	<label>ไปในฐานะ  </label>
		<input name="status" id="status1" type="radio" value="ผู้บริหาร" 		 style="margin-left: 4.25%" 
			<%if (bean.getStatus().equals("ผู้บริหาร")) 		{ out.print("checked ='checked' "); }%>>  ผู้บริหาร    
        <input name="status" id="status2" type="radio" value="ผู้สอน" 		 style="margin-left: 5.7%" 	
        	<%if (bean.getStatus().equals("ผู้สอน"))	 	{ out.print("checked ='checked' ");	}%>>  ผู้สอน		
        <input name="status" id="status3" type="radio" value="ผู้สนับสนุนการสอน" style="margin-left: 2%"	
        	<%if (bean.getStatus().equals("ผู้สนับสนุนการสอน")) { out.print("checked ='checked' "); }%>> ผู้สนับสนุนการสอน
    </div>
	<label> เพื่อ (ระบุวัตถุประสงค์/ลักษณะงาน) </label>
	<textarea class="form-control" rows="5" cols="100" id="object" name="object" > <%=bean.getObject() %> </textarea>
	<!-- เลือกไฟล์ นำเข้า -->
	<form name="v" enctype="multipart/form-data" style="margin-top: 3.5%">  
<!--        <input name="v" type="file"> -->
	</form>
	</div>
	</div></div></div>
</div>

</div>

<!-- กรอบที่ 2 เลือกสถานที่ จังหวัด อำเภอ ตำบล-->
<div style="size: 10;margin-top: 2%;margin-bottom: 3%;" class="col-sm-12" >

<!--ตาราง การมอบหมายงานระหว่างไปราชการ  -->
<div style="size: 10" class="col-sm-5 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" >
	<div style="margin-top: 2%">
	<label>ความประสงค์ </label>
		<input name="purpose"  	id="purpose"  type="checkbox" value="ขออนุญาต" 	style="margin-left: 8%" <%if (bean.getPurpose().equals("ขออนุญาต")) { out.print("checked ='checked'"); }%> > ขออนุญาต
        <input name="purpose1"	id="purpose1" type="checkbox" value="ได้รับคำสั่ง" 	style="margin-left: 2%" <%if (bean.getPurpose1().equals("ได้รับคำสั่ง")) { out.print("checked ='checked'"); }%>> ได้รับคำสั่ง
        <input name="purpose2" 	id="purpose2" type="checkbox" value="ไปราชการ" 	style="margin-left: 2%"	<%if (bean.getPurpose2().equals("ไปราชการ")) { out.print("checked ='checked'"); }%>> ไปราชการ
    </div>
    <div>
    <label>เรื่องที่ไปราชการ </label>
    	<input type="text" class="form-control" name="topics" id="topics" value="<%=bean.getTopics()%>">
    </div><hr>
	 <table id="" class="table-responsive" style="margin-bottom: 3.3%;font-size: small;">
     <tr  align="center">
     	<th colspan="3"> การมอบหมายงานระหว่างไปราชการ </th>
     </tr>
     <tr  align="center">
     	<th colspan="3"> <hr></th>
     </tr>
     <tr>
      <td>งานสอนภาคปกติ</td>
      <td align="center" style="width: 20mm"><input type="radio" name="commitA" id="commitA2" value="ไม่มี" <%if (bean.getCommitA().equals("ไม่มี")) {out.print("checked ='checked' ");}%> 	> &nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitA" id="commitA1" value="มี" 	<%if (bean.getCommitA().equals("มี"))  { out.print("checked ='checked' ");}%> 	>&nbsp;มี&nbsp;&nbsp;
      <input name="commitADt" id="commitADt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..." value="<%=bean.getCommitADt()%>"></td>
    </tr>
    <tr>
    <td style="width: 6cm">งานสอนภาค กศ.บป./บัณฑิตศึกษา</td>
      <td align="center" style="width: 20mm"><input type="radio" name="commitB" id="commitB2" value="ไม่มี" <%if (bean.getCommitB().equals("ไม่มี")) {out.print("checked ='checked' ");}%>	>&nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitB" id="commitB1" value="มี" <%if (bean.getCommitB().equals("มี"))  { out.print("checked ='checked' ");}%>		>&nbsp;มี&nbsp;&nbsp;
   	  <input name="commitBDt" id="commitBDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..." value="<%=bean.getCommitBDt()%>"></td>
    </tr>
    <tr>
      <td>งานประจำเวร/ประจำวัน</td>
      <td align="center" style="width: 20mm"><input type="radio" name="commitC" id="commitC2" value="ไม่มี" <%if (bean.getCommitC().equals("ไม่มี")) {out.print("checked ='checked' ");}%> >&nbsp;&nbsp;ไม่มี</td>
       <td align="center"><input type="radio" name="commitC" id="commitC1" value="มี" <%if (bean.getCommitC().equals("มี"))  { out.print("checked ='checked' ");}%>>&nbsp;มี&nbsp;&nbsp;
      <input name="commitCDt" id="commitCDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..." value="<%=bean.getCommitCDt()%>"></td>
    </tr>
    <tr>
      <td>งานอื่นๆ &nbsp; <input  name="other" id="other" type="text" placeholder="&nbsp;&nbsp;ถ้ามีให้กรอก..." value="<%=bean.getOther() %>"></td>
      <td align="center" style="width: 20mm"><input type="radio" name="commitD" id="commitD2" value="ไม่มี" <%if (bean.getCommitD().equals("ไม่มี")) {out.print("checked ='checked' ");}%> >&nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitD" id="commitD1" value="มี" <%if (bean.getCommitD().equals("มี"))  { out.print("checked ='checked' ");}%>>&nbsp;มี&nbsp;&nbsp;
      <input name="commitDDt" id="commitDDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..." value="<%=bean.getCommitDDt()%>"></td>
    </tr>
	</table>
	</div></div></div>
</div><!--end  -->

<div style="size: 10" class="col-sm-3 " >	

<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">

	 <div class="form-group"><label  style="margin-top: 3%">วันที่ไป  </label><input class="form-control" type="date" id='goDate' name="goDate" value="<%=bean.getGoDate() %>"> </div>
	 <div class="form-group"><label>เวลาออก : </label><input class="form-control" type='time' id='goTime' name="goTime" 	value="<%=bean.getGoTime() %>"> </div>
	 <div class="form-group"><label>วันที่กลับ : </label><input class="form-control" type='date' id='backDate' name="backDate" value="<%=bean.getBackDate() %>"> </div>
     <div class="form-group"><label>เวลากลับ : </label><input class="form-control" type='time' id='backTime' name="backTime" value="<%=bean.getBackTime() %>"> </div>
     </div></div></div>
</div><!--end  -->

<div style="size: 10" class="col-sm-4" >
<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" style="background-color:rgba(255, 99, 71, 0.4);">
	
	<label  style="margin-top: 3%">สถานที่ไปราชการ </label>
    <div class="form-group">
   		<input class="form-control" name="destinationName" id="destinationName" type="text" value=" <%=bean.getDestinationName() %> ">
    </div>
	<!-- จังหวัด province -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">จังหวัด</label> 
		<select class="form-control" name="province" id="province">
			<option value=""><%=bean.getProvince() %></option>
		</select>
	</div>
	<!-- อำเภอ Amphur -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">อำเภอ</label>
			<select class="form-control" name="amphur" id="amphur">
				<option value=""><%=bean.getAmphur() %></option>
			</select>
	</div>
	<!-- ตำบล  District -->
	<div class="form-group">
	<label for="exampleFormControlSelect1">ตำบล</label>
		<select class="form-control" name="district" id="district">
			<option value="<%=bean.getDistrictId() %>"><%=bean.getDistrict() %></option>
		</select>
	</div>
	</div></div></div>
</div><!--end  -->

</div>

</div>
</header>

<!-- สรุป แบบฟอร์มประมาณการรายจ่าย -->
<header class="w3-display-container w3-content" style="max-width:90%;margin-top: 2%">
	<div class="w3-container w3-blue" id="2">
    	<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มประมาณการรายจ่าย</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">

<!-- กรอบที่ 3 -->

<div style="size: 10;margin-bottom: 1%;margin-top: 2%;" class="col-sm-2 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise" >
	<div class="w3-container">
	<div class="form-group" style="margin-top: 4%">
	<label> งบประมาณ  </label>
		<select class="form-control" name="Budget" id="budget" ><!-- onChange="Show(this.selectedIndex)" -->
        	<option value="ไม่เบิกค่าใช้จ่าย" >ไม่เบิกค่าใช้จ่าย </option>
        	<option value="เบิกค่ามใช้จ่าย" >เบิกค่าใช้จ่าย</option>
		</select>
	</div>
	</div></div></div>
	<div style="size: 10" class="col-sm-10 " ></div>
</div>
	<!-- <div id="No Budget" style="display:none"></div>  -->
    
	<!-- เบิกค่าใช้จ่าย -->
	<div ><!--id="Manual Budget" style="display:none"  -->
<div class="col-sm-12" >
 	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
 <div style="size: 10" class="col-sm-2 ">
	<div class="form-group" style="margin-top: 4%">
	<label>เบิกค่าใช้จ่าย  </label>		
		<select class="form-control" name="budgetExpenses" id="budgetExpenses">
			<option value="<%=bean.getBudgetExpenses() %>"><%=bean.getBudgetExpenses() %></option>
        	<option value="ตามสิทธิ์">ตามสิทธิ์</option>
  			<option value="เหมาจ่าย">เหมาจ่าย</option>
		</select>
	</div>
</div>
<div style="size: 10" class="col-sm-2 " >
	<div class="form-group" style="margin-top: 4%">
	<label>ใช้งบประมาณ  </label>
		<select class="form-control" name="budgetBy" id="budgetBy">
			<option value="<%=bean.getBudgetBy() %>"><%=bean.getBudgetBy() %></option>
        	<option value="งบประมาณแผ่นดิน">งบประมาณแผ่นดิน</option>
  			<option value="งบรายได้">งบรายได้</option>
  			<option value="อื่นๆ">อื่นๆ</option>
		</select>
	</div>
</div>
<div style="size: 10" class="col-sm-4 " >
	<div class="form-group" style="margin-top: 1.7%">
	<label> โครงการ  </label><input class="form-control" name="budgetProject" id="budgetProject" type="text" value="<%=bean.getBudgetProject() %>">
	</div>
</div>
<div style="size: 10" class="col-sm-2 " >
	<div class="form-group" style="margin-top: 3.5%">
	<label> รหัส    </label><input class="form-control" name="budgetPass" id="budgetPass" type="text" value="<%=bean.getBudgetPass() %>" onkeyup="autoTab(this)">
	</div>
</div>
<div style="size: 10" class="col-sm-2 ">
	<div class="input-group" style="margin-top: 15%">
	<div class="input-group-addon">วงเงิน</div><input class="form-control" style="text-align:center" id="aaa" type="text" disabled value="<%=beanEs.getExpenseEstimateSumTotal() %>"">
	<div class="input-group-addon">บาท</div>
    </div>
</div>
	</div></div></div>
</div>

	<div style="size: 10;margin-bottom: 3%;" class="col-sm-12"  id="Manual Budget" style="display:none">
	<h3 style="color: white;margin-bottom: 2%"align="center"  class="w3-container w3-blue"><i class="fa fa-user w3-margin-right" style="font-size:30px;"></i>เลือกบุคคลกรร่วมไปราชการ พร้อมกำหนดค่าใช้จ่าย  (กรุณาใส่ 0 ในช่องว่าง)</h3>
	
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><label>ค่าเบี้ยเลี้ยง(รายละเอียดค่าเบี้ยเลี้ยง)</label> 
		<a class="test" href="#" data-toggle="tooltip" data-placement="top" title=" (240 x 2) + (180  x 2) ">ตัวอย่าง</a>
	</div>
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><input type="text" id="allowenceDetails" class="form-control" style="height: 7mm" value="<%=beanEs.getAllowenceDetails() %>"></div>
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><label>ค่าเช่าที่พัก (รายละเอียดเช่าที่พัก)</label>
		<a class="test" href="#" data-toggle="tooltip" data-placement="top" title=" (240 x 2) + (180  x 2) ">ตัวอย่าง</a>
	</div>
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><input type="text" id="rentDateDetails" class="form-control" style="height: 7mm" value="<%=beanEs.getRentDateDetails() %>"></div>
	</div></div></div><br>
	<table id="addUser" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%" >   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">ชื่อ</th>
        	<th style="text-align:center">นามสกุล</th>
        	<th style="text-align:center">ตำแหน่ง</th>
        	<th style="text-align:center">ค่าเบี้ยง<br>เลี้ยง</th>
			<th style="text-align:center">จำนวน<br>วัน</th>
			<th style="text-align:center">รวม<br>ค่าเบี้ยเลี้ยง</th>
    	    <th style="text-align:center">ค่าเช่า<br>ที่พัก</th>
    	    <th style="text-align:center">จำนวน<br>คืน</th>
    	    <th style="text-align:center">รวม<br>ค่าที่พัก</th>
			<th style="text-align:center">ค่ายาน<br>พาหนะ</th>
			<th style="text-align:center">ค่าใช้จ่าย<br>อื่นๆ</th>
			<th style="text-align:center">รวม</th>
			<th></th> 
    	</tr>
    	</thead>
    	<tfoot>
    	<tr>
    		<th colspan="5"><label style="margin-left: 10%">รวม</label><label style="margin-left: 30mm" id="userSumTotal"></label><label style="margin-left: 30mm">คน</label>  </th>
    		<th id="allowencePerdayTotal"></th>
			<th style="text-align:center" id="allowenceSumTotal"></th>
			<th ></th>
			<th id="rentDatePerdayTotal"></th>
			<th style="text-align:center" id="rentDateSumTotal"></th>
			<th style="text-align:center" id="travelSumTotal"></th>
			<th style="text-align:center" id="otherSumTotal"></th>
			<th colspan="2"> รวม <label style="margin-left: 3%" id="expenseEstimateSumTotal"> บาท</label></th>
    	</tr>
    	</tfoot>
    </table>
    <div align="right">
    	<input class=" btn btn-primary" type="button" value="เพิ่มบุลคลากร" onclick="document.getElementById('id01').style.display='block'">
    </div>
 	</div><!-- end dataTable Expense -->

 
<div style="size: 10" class="col-sm-2" >
 	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	<div class="form-group">
	<label> การเดินทาง  </label>   
    <select class="form-control" name="travel" id="travel" ><!-- onChange="ShowReg(this.selectedIndex)" -->
   		<option value="">== เลือกภาหนะ ==</option>
      	<option value="พาหนะประจำทาง">พาหนะประจำทาง</option>
  		<option value="ขอใช้รถส่วนตัว">ขอใช้รถส่วนตัว</option>
  		<option value="ขอใช้รถไปราชการ">ขอใช้รถไปราชการ </option>
	</select>
    </div>
    </div></div></div>
</div>
<div style="size: 10" class="col-sm-10" ></div>
   
    <!-- ไม่ได้เลือก -->
<!-- 	<div id="No Promotion" style="display:none"></div>  -->

<div><!-- id="Manual Promotion1" style="display:none" -->
<div style="margin-bottom: 3%;" class="col-sm-12" >
	<h3 style="color: white;"align="center"  class="w3-container w3-blue"><i class="fa fa-car w3-margin-right" style="font-size:30px;"></i>เลือกค่า พาหนะในการเดินทาง และกำหนดค่า  (หมายเหตุ ถ้ามี)</h3><br>
	<table id="addTravel" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%">   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">รายการ</th>
        	<th style="text-align:center">จำนวน/เที่ยว</th>
        	<th style="text-align:center">เที่ยวละ/บาท</th>
        	<th style="text-align:center">จำนวน/คน</th>
			<th style="text-align:center">รวม</th>
			<th style="text-align:center">หมายเหตุ</th>
			<th></th>
    	</tr>
    	</thead>
    	<tfoot>
    	<tr>
    		<th style="text-align:right;" colspan="4"></th>
			<th style="text-align:center" ></th>
			<th style="text-align:center" ><label id="summary1"></label></th>
			<th colspan="2"></th>
    	</tr>
    	</tfoot>
    </table>
    <div align="right">
   		<input class=" btn btn-primary" type="button" value="เลือกพาหนะ" onclick="document.getElementById('id02').style.display='block'">
    </div>
</div>
</div>

<!-- ขอใช้รถส่วนตัว -->

<div><!-- id="Manual Promotion2" style="display:none"  -->
<div class="col-sm-5">
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise" style="height: 19mm;background-color:rgba(255, 255, 0, 0.6);">
	<div class="w3-container">
	<div class="input-group" style="margin-top: 5mm">
		<div class="input-group-addon">หมายเลขทะเบียน </div>
		<input class="form-control" name="travelIdcard" id="travelIdcard" type="text" value="" maxlength="6"> 
	</div>
	</div></div></div>
	</div> 
	<div class="col-sm-7"></div>
	
	<div style="margin-bottom: 3%;" class="col-sm-12" >
	<h3 style="color: white;"align="center"  class="w3-container w3-blue"><i class="fa fa-car w3-margin-right" style="font-size:30px;"></i>เลือกค่า พาหนะในการเดินทาง และกำหนดค่า  (หมายเหตุ ถ้ามี)</h3><br>
	<table id="addTravel1" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%">   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">รายการ</th>
        	<th style="text-align:center">ระยะทาง<br>กม.</th>
        	<th style="text-align:center">เที่ยว</th>
        	<th style="text-align:center">ค่าน้ำมัน<br>ลิตรละ/บาท</th>
        	<th style="text-align:center">หาร</th>
        	<th style="text-align:center">รวม <br> ค่าเชื้อเพลิง</th>
        	<th style="text-align:center">ค่าทางด่วน<br>ครัังละ/บาท</th>
        	<th style="text-align:center">ค่าทางด่วน<br>ครััง</th>
        	<th style="text-align:center">รวม <br> ค่าทางด่วน</th>
			<th style="text-align:center">รวม</th>
			<th style="text-align:center">หมายเหตุ</th>
    	</tr>
    	</thead>
    </table>
    <div align="right">
   		<input class=" btn btn-primary" type="button" value="เลือกพาหนะ" onclick="document.getElementById('id03').style.display='block'">
    </div>
</div>
</div>

<!-- ขอใช้รถไปราชการ-->
<div id="Manual Promotion3" style="display:none">
	
	<div class="col-sm-5">
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise" style="height: 19mm;background-color:rgba(255, 255, 0, 0.6);">
	<div class="w3-container">
	<div class="input-group" style="margin-top: 5mm">
		<div class="input-group-addon">หมายเลขทะเบียน </div>
		<input class="form-control" name="travelIdcard" id="travelIdcard" type="text" value="" maxlength="6"> 
	</div>
	</div></div></div>
	</div> 
	<div class="col-sm-7"></div>
	
	
<div style="margin-bottom: 3%;" class="col-sm-12" >
	<h3 style="color: white;"align="center"  class="w3-container w3-blue"><i class="fa fa-car w3-margin-right" style="font-size:30px;"></i>เลือกค่า พาหนะในการเดินทาง และกำหนดค่า  (หมายเหตุ ถ้ามี)</h3><br>
	<table id="addTravel2" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%">   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">รายการ</th>
        	<th style="text-align:center">ระยะทาง<br>กม.</th>
        	<th style="text-align:center">เที่ยว</th>
        	<th style="text-align:center">ค่าน้ำมัน<br>ลิตรละ/บาท</th>
        	<th style="text-align:center">หาร</th>
        	<th style="text-align:center">รวม <br> ค่าเชื้อเพลิง</th>
        	<th style="text-align:center">ค่าทางด่วน<br>ครัังละ/บาท</th>
        	<th style="text-align:center">ค่าทางด่วน<br>ครััง</th>
        	<th style="text-align:center">รวม <br> ค่าทางด่วน</th>
			<th style="text-align:center">รวม</th>
			<th style="text-align:center">หมายเหตุ</th>
    	</tr>
    	</thead>
    </table>
    <div align="right">
   		<input class=" btn btn-primary" type="button" value="เลือกพาหนะ" onclick="document.getElementById('id04').style.display='block'">
    </div>
</div>	
</div>

</div><!-- end กรอบที่ 3-->
	

	<div style="margin-top: 4%" class="col-sm-12 " align="center" >
		<button class="btn btn-success" id="saveExpenseEstimate">ยืนยัน</button>
		<button type="reset" class="btn btn-danger">รีเซต</button>
	</div>
	</div>
		
</header>

	</div><!-- end  --> 
</div><!-- end  --> 


	<!-- เพิ่มบุคคลากร -->
	<header class="w3-display-container w3-content">
		<div id="id01" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 100%; margin-top: 3%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มบุคคลากร
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="userTable" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>เลือก</th>
								<th>ชื่อ</th>
								<th>นามสกุล</th>
								<th>คณะ</th>
								<th>ภาควิชา</th>
								<th>ตำแหน่ง</th>
								<th>ระดับ</th>
								<th>ค่าเบี้ยเลี้ยง</th>
								<th>ค่าเช่าที่พัก</th>
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
	</header>

	<!-- เพิ่มพาหนะ-->
	<header class="w3-display-container w3-content">
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
	
		<!-- เพิ่มพาหนะ รถส่วนตัว-->
	<header class="w3-display-container w3-content">
		<div id="id03" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="travelTable1" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>ลำดับ</th>
								<th>พาหนะ</th>
							</tr>
						</thead>
					</table>

					<div style="size: 10" class="col-sm-12 " align="center">
						<button type="button" class="btn btn-success" id="buttonAdd3">ยืนยัน</button>
						<button type="button"
							onclick="document.getElementById('id03').style.display='none'"
							class="btn btn-danger">ปิด</button>
					</div>
				</div>
			</form>
		</div>
	</header>
	
			<!-- เพิ่มพาหนะ รถไปราชการ-->
	<header class="w3-display-container w3-content">
		<div id="id04" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="travelTable2" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>ลำดับ</th>
								<th>พาหนะ</th>
							</tr>
						</thead>
					</table>

					<div style="size: 10" class="col-sm-12 " align="center">
						<button type="button" class="btn btn-success" id="buttonAdd4">ยืนยัน</button>
						<button type="button"
							onclick="document.getElementById('id04').style.display='none'"
							class="btn btn-danger">ปิด</button>
					</div>
				</div>
			</form>
		</div>
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
	
	<!-- เพิ่มพาหนะ รถส่วนตัว-->
	<script>
		// Get the modal
		var modal = document.getElementById('id03');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
	<!-- เพิ่มพาหนะ รถไปราชการ-->
	<script>
		// Get the modal
		var modal = document.getElementById('id04');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>