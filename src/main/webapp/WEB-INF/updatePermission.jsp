
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

	<script type="text/javascript">
		//กรอกได้เฉพราะ ตัวเลข
		function chkNumber(ele)
		{
		var vchar = String.fromCharCode(event.keyCode);
		if ((vchar<'0' || vchar>'9') && (vchar != '.')) return false;
		ele.onKeyPress=vchar;
		}
	</script>
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
		<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มเบิกค่าใช้จ่ายในการเดินทางไปราชการ</h2>
    </div>
    
    <div class="w3-container w3-white w3-padding-16">
    

<!-- กรอบที่ 1 -->
<div style="margin-bottom: 18%">

<div style="size: 10" class="col-sm-12" >

	<div style="size: 10" class="col-sm-4 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" >
	<div  style="margin-top: 3%">
	<div></div>
	<br>
	<label>เรียน อธิการบดีมหาวิทยาลัยราชภัฏบุรีรัมย์</label><br>
	<label>ตามคำสั่ง/บันทึกที่ </label><input class="form-control" type="text">
	<label>ลงวันที่ </label><input class="form-control" type="date"><hr>
	<label>ขอเบิกค่าใช้จ่ายในการเดินทางไปราชการสำหรับ </label><br>
		<input name="a" id="" type="radio" value="" style="margin-left: 4%" > <label> ข้าพเจ้า</label>
        <input name="a"	id="" type="radio" value="" style="margin-left: 4%" > <label> คณะเดินทาง</label><br><br>
	<table>
		<tr>
			<td style="width: 40mm"><label>ค่าเบี๋ยเลี้ยงการเดินทาง </label></td>
			<td style="width: 18mm"><label><u>ประเภท</u></label></td>
			<td>
				<select class="form-control" name="" id="" style="width: 15mm">
					<option value="1">ก</option>
					<option value="2">ข</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><label>ค่าที่พัก</label></td>
			<td><label><u>ประเภท</u></label></td>
			<td>
				<select class="form-control" name="" id="" style="width: 15mm">
					<option value="1">ก</option>
					<option value="2">ข</option>
				</select>
			</td>
		</tr>
	</table>
	<form name="v" enctype="multipart/form-data" style="margin-top: 3.5%" >  
<!--        <input name="v" type="file"> -->
	</form>
	</div>
	</div></div></div>
 	</div><!--end -->
	
	<div style="size: 10" class="col-sm-4 " >
<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" style="background-color:rgba(255, 99, 71, 0.4);">

    <div class="form-group" style="margin-top:20px">
    	<label>ออกเเดินทางจาก :</label> 
   		<input name="a" id="" type="radio" value="" style="margin-left: 4%" > <label> บ้านพัก</label>
        <input name="a"	id="" type="radio" value="" style="margin-left: 4%" > <label> สำนักงาน</label> 
    </div>
    <label>เลขที่</label><input class="form-control" type="text">
    <label>ถนน </label><input class="form-control" type="text">
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
	</div></div></div>
 	</div><!--end -->

	<div class="col-sm-4 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" style="background-color:rgba(255, 99, 71, 0.4);">
<form action="">

    <div class="col-sm-6" style="margin-top:20px">
    	<label>ตั้งแต่วันที่</label> 
   		<input class="form-control" name="" id="b_go_date" type="date" value=""  > 
   	</div>
	<div class="col-sm-6" style="margin-top:20px">
   		<label>เวลา</label> 
   		<input class="form-control" name="" id="" type="time" value=""  > 
   	</div>

   	<div class="form-group col-sm-12" style="margin-top:20px">
    	<label>กลับถึง :</label> 
   		<input name="a" id="" type="radio" value="" style="margin-left: 4%" > <label> บ้านพัก</label>
        <input name="a"	id="" type="radio" value="" style="margin-left: 4%" > <label> สำนักงาน</label> 
    </div>
    <div class="col-sm-6">
    	<label>ตั้งแต่วันที่</label> 
   		<input class="form-control" name="" id="b_go_date" type="date" value=""  > 
   	</div>
	<div class="col-sm-6" >
   		<label>เวลา</label> 
   		<input class="form-control" name="" id="" type="time" value=""  > 
   		<input type="button" id="submit" onclick="dateDiff()" value="calculate" />
   	</div> 
   	<div style="size: 10;margin-bottom: 6.5mm" class="col-sm-12" >
   		<label>รวมเวลาไปราชการ</label> 
   			<div class="input-group">
			<input class="form-control" style="text-align:center id="" type="number" >
			<div class="input-group-addon">วัน</div>
			<div class="input-group">
			<input class="form-control" style="text-align:center id="" type="number" >
			<div class="input-group-addon">ชั่วโมง</div>
   			</div>
   	</div>
   	</div>
   	</form>
	</div></div></div>
 	</div><!--end -->
	</div>
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

	<div style="size: 10" class="col-sm-10 " ></div>
</div>
	<!-- <div id="No Budget" style="display:none"></div>  -->
    
	<!-- เบิกค่าใช้จ่าย -->
	<div ><!--id="Manual Budget" style="display:none"  -->
<div class="col-sm-12" >
 	
</div>

	<div style="size: 10;margin-bottom: 3%;" class="col-sm-12"  id="Manual Budget" style="display:none">
	<h3 style="color: white;margin-bottom: 2%"align="center"  class="w3-container w3-blue"><i class="fa fa-user w3-margin-right" style="font-size:30px;"></i>เลือกบุคคลกรร่วมไปราชการ พร้อมกำหนดค่าใช้จ่าย  (กรุณาใส่ 0 ในช่องว่าง)</h3>
	
	<table id="addUser" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%" >   
		<thead>
    	<tr style="background: purple;color: white;">
    		<th style="text-align:center">รหัส</th>
         	<th style="text-align:center">ชื่อ</th>
        	<th style="text-align:center">นามสกุล</th>
        	<th style="text-align:center">ตำแหน่ง</th>
        	<th style="text-align:center">ประเภท</th>
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
    		<th colspan="6"><label style="margin-left: 10%">รวม</label><label style="margin-left: 30mm" id="userSumTotal"></label><label style="margin-left: 30mm">คน</label>  </th>
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
	
	<script type="text/javascript">
	function setAllowEnce(allowence,type) {
		var x = $('#allowenceType'+allowence).val();
		let nameA = 'allowence'+allowence;
		if(type==1){
			if(x == '1'){
				$('#'+nameA).val(270);
			}else{
				$('#'+nameA).val(162);
			}
		}else{
			if(x == '1'){
				$('#'+nameA).val(240);
			}else{
				$('#'+nameA).val(144);
			}
		}
	}
</script>
<script language="javascript">
function dateDiff(){

var myVar1 = document.getElementById('b_back_date').value;//prompt("Enter a start date: ")
var myVar2 = document.getElementById('b_go_date').value;//prompt("Enter a end date: ")

var first_date = Date.parse(myVar1)
var last_date = Date.parse(myVar2)
var diff_date =  first_date - last_date;

var num_years = diff_date/31536000000;
var num_months = (diff_date % 31536000000)/2628000000;
var num_days = ((diff_date % 31536000000) % 2628000000)/86400000;

var result ="";

result +=(" " + Math.floor(num_years) + " ปี\n");
result +=(" " + Math.floor(num_months) + " ดือน\n");
result +=(" " + Math.floor(num_days) + " วัน");
alert(result);

}
</script>
	
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


</body>
</html>
