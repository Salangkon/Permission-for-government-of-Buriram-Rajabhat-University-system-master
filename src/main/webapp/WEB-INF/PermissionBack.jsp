
<%@page import="com.hillert.model.TestAjex"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>permission-back</title>

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/css/tableUpdatePermission.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/modal.css">
	<link rel="stylesheet" href="/css/select.dataTables.min.css">
	
	<script src="/js/useCar.js"></script>
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="/js/view-source_https___cdn.datatables.net_select_1.2.7_js_dataTables.select.min.js"></script>
	<script src="/js/listFaculty.js"></script>
	<script src="/js/listPosition.js"></script>
	<script src="/js/insertExpenseBack.js"></script>
	<script src="/js/insertPermissionBack.js"></script>
	<script src="/js/province.js"></script>
	
	<script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	<!-- Digital -->
	<script src="/js/Digital.js"></script>
	<link rel="stylesheet" href="/css/Digital.css">
	
	
	<script>
		function w3_open() {
			document.getElementById("main").style.marginLeft = "100px";
			document.getElementById("mySidebar").style.width = "200px";
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("openNav").style.display = 'none';
		}
		function w3_close() {
			document.getElementById("main").style.marginLeft = "0";
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("openNav").style.display = "inline-block";
		}
	</script>

<%
	PermissionBean bean = null;
	ExpenseSumaryBean beanEs = null;
	TestAjex perBackDisabled = null;
	String result = "";
%>
<%
	bean = (PermissionBean) request.getAttribute("perBean");
	beanEs = (ExpenseSumaryBean) request.getAttribute("beanEs");
	perBackDisabled = (TestAjex) request.getAttribute("perBackDisabled");
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



<div id="main" style="margin-left:100px">

<div class="w3-container w3-display-container" style="background-color: gray;" id="grad1">
  <span title="open Sidebar" style="display:none" id="openNav" class="w3-button w3-transparent w3-display-topleft w3-xlarge" onclick="w3_open()">&#9776;</span>


<header class="w3-display-container w3-content" style="max-width:90%" >
	<div class="w3-container w3-red" id="1">
		<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มเบิกค่าใช้จ่ายในการเดินทางไปราชการ</h2>
    </div>
    
    <div class="w3-container w3-white w3-padding-16">
	<input type="hidden" id="permissionId" value="<%=bean.getPermissionId()%>">    

<!-- กรอบที่ 1 -->
<div style="margin-bottom: 18%">
<div class="col-sm-12" >

	<div style="size: 10" class="col-sm-4 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" >
	<div  style="margin-top: 3%">
	<div></div>
	<label>วันที่/บันทึก </label><input class="form-control" type="date" id="bSaveDate">
	<hr>
	<label>ตามคำสั่ง/บันทึกที่ </label><input maxlength="10" class="form-control" type="text" id="bByOrderSave">
	<label>ลงวันที่ </label><input class="form-control" type="date" id="bDateAuthorized"><hr>
	<table>
		<tr>
			<td><label>ขอเบิกค่าใช้จ่ายสำหรับ </label></td>
			<td style="width: 30mm" align="center"><input name="bDisbursedBy" id="bDisbursedBy1" type="radio" value="1" style="margin-left: 4%" > <label> ข้าพเจ้า</label></td>
			<td style="width: 30mm" align="center"><input name="bDisbursedBy" id="bDisbursedBy2" type="radio" value="2" style="margin-left: 4%" > <label> คณะเดินทาง</label></td>
		</tr>
    </table><hr>
	<table>
		<tr>
			<td style="width: 40mm"><label>ค่าเบี๋ยเลี้ยงการเดินทาง </label></td>
			<td style="width: 18mm"><label><u>ประเภท</u></label></td>
			<td style="width: 18mm" align="center"><input name="bAllowenceType" id="bAllowenceType1" type="radio" > ก</td> 
			<td style="width: 18mm" align="center"><input name="bAllowenceType" id="bAllowenceType2" type="radio" > ข</td>
		</tr>
		<tr>
			<td><label>ค่าที่พัก</label></td>
			<td><label><u>ประเภท</u></label></td>
			<td align="center"><input id="bRentDateType1" type="radio" name="bRentDateType1"> ก</td> 
			<td align="center"><input id="bRentDateType2" type="radio" name="bRentDateType2"> ข</td>
		</tr>
	</table>
	<form name="v" enctype="multipart/form-data" style="margin-top: 3.5%" >  
<!--        <input name="v" type="file"> -->
	</form>
	</div>
	</div></div></div>
 	</div><!--end -->
	
	<div class="col-sm-4 " >
<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px;">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" style="background-color:rgba(255, 99, 71, 0.4);">

    <div class="form-group" style="margin-top:20px">
    	<label>ออกเเดินทางจาก :</label> 
   		<input name="bStartTravel" id="bStartTravel1"  type="radio" value="1" style="margin-left: 4%;" > <label> บ้านพัก</label>
        <input name="bStartTravel" id="bStartTravel2"  type="radio" value="2" style="margin-left: 4%" > <label> สำนักงาน</label> 
    </div>
    <label>เลขที่</label><input class="form-control" type="text" id="bHouseNumber" maxlength="6">
    <label>ถนน </label><input class="form-control" type="text" id="bRoad" maxlength="12">
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
	<div class="w3-container">
	
<form action="">
    <div class="col-sm-12" style="margin-top:20px"><label>ตั้งแต่วัน/เวลา</label></div> 
   		<div class="col-sm-7"><input class="form-control" name="bGoDate" id="bGoDate" type="date" value="<%=bean.getGoDate() %>" ></div>
   		<div class="col-sm-5"><input class="form-control" name="bGoTime" id="bGoTime" type="time" value="<%=bean.getGoTime() %>" ></div> 
   	

   	<div class="form-group col-sm-12" style="margin-top:20px;background-color:white ;">
    	<label>กลับถึง :</label> 
   		<input name="bBackTravel" id="bBackTravel1" type="radio" value="" style="margin-left: 4%" > <label> บ้านพัก</label>
       	<input name="bBackTravel" id="bBackTravel2" type="radio" value="" style="margin-left: 4%" > <label> สำนักงาน</label> 
    </div>
    <div class="col-sm-12"><label>ตั้งแต่วัน/เวลา</label></div>
    <div class="col-sm-7"><input class="form-control" name="bBackDate" id="bBackDate" type="date" value="<%=bean.getBackDate() %>" ></div> 
   	<div class="col-sm-5"><input class="form-control" name="bBackDate" id="bBackTime" type="time" value="<%=bean.getBackTime() %>" ></div> 
   	<div style="margin-bottom: 6.5mm;overflow: auto;" class="col-sm-12" >
   		<label>รวมเวลาไปราชการ</label> 
   			<div class="input-group" style="width: 80%">
			<input class="form-control" style="text-align:center" OnKeyPress="return chkNumber(this)" type="text" id="bDaySum" >
			<div class="input-group-addon">วัน</div>
			<input class="form-control" style="text-align:center" OnKeyPress="return chkNumber(this)" type="text" id="d" >
			<div class="input-group-addon">คืน</div>
			<div class="input-group" style="width: 160%">
			<input class="form-control" style="text-align:center" OnKeyPress="return chkNumber(this)" type="text" id="bTimeSum">
			<div class="input-group-addon">ชั่วโมง</div>
   			</div>
   	</div>
   	</div>
   	<div class="col-sm-2"><input type="button" id="submit" onclick="dateDiff()" value="คำนวน" class="btn btn-info" ></div> 	
   	<div  class="ho oh col-sm-10">
	<div id="main" >
	  <div id="time" >
	    <span id="hours"></span><span id="min"></span><span id="sec"></span>
	  </div>
	  <div id='days' class="ho oh">
	    <div class="days"> sun_ </div>
	    <div class="days"> mon_ </div>
	    <div class="days"> tue_ </div>
	    <div class="days"> wed_ </div>
	    <div class="days"> thu_ </div>
	    <div class="days"> fri_ </div>
	    <div class="days"> sat_ </div>
	  </div>
	  <div id="fullDate" >
	    <span id="month"></span>&nbsp;<span id="date"></span>&nbsp;<span id="year"></span>
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
	<div style="overflow-x:auto;">
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
    		<th colspan="6"><label style="margin-left: 10%">รวม</label><label style="margin-left: 30mm" id="userSumTotal"><%=beanEs.getUserSumTotal()%></label><label style="margin-left: 30mm">คน</label>  </th>
    		<th id="allowencePerdayTotal"><%=beanEs.getAllowencePerdayTotal()%></th>
			<th style="text-align:center" id="allowenceSumTotal"><%=beanEs.getAllowenceSumTotal()%></th>
			<th ></th>
			<th id="rentDatePerdayTotal"><%=beanEs.getRentDatePerdayTotal()%></th>
			<th style="text-align:center" id="rentDateSumTotal"><%=beanEs.getRentDateSumTotal()%></th>
			<th style="text-align:center" id="travelSumTotal"><%=beanEs.getTravelSumTotal()%></th>
			<th style="text-align:center" id="otherSumTotal"><%=beanEs.getOtherSumTotal()%></th>
			<th colspan="2"> รวม <label style="margin-left: 3%" id="expenseEstimateSumTotal"><%=beanEs.getExpenseEstimateSumTotal()%></label></th>
    	</tr>
    	</tfoot>
    </table>
    </div>
    <div align="right">
    	<input class=" btn btn-primary" type="button" value="เพิ่มบุลคลากร"  data-toggle="modal" data-target="#myModal">
    </div>
 	</div><!-- end dataTable Expense -->
</div><!-- end กรอบที่ 3-->
	

	<div style="margin-top: 4%" class="col-sm-12 " align="center" >
		<button class="btn btn-success" id="saveBack">ยืนยัน</button>
		<button type="reset" class="btn btn-danger">รีเซต</button>
	</div>
	</div>
		
</header>

	</div><!-- end  --> 
</div><!-- end  --> 




<!-- เพิ่มบุคคลากร -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width: 70%">
     
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title" style="text-align: center;"><i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มบุคคลากร</h2>
        </div>
        <div class="modal-body" style="overflow: auto;width: 100%" >
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
        </div>
        <div class="modal-footer">
      	  <button type="button" class="btn btn-success" id="buttonAdd1">ยืนยัน</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div><!-- end เพิ่มบุคคลากร  --> 


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
//คำนวน ว/ด/ป
	var myVar1 = document.getElementById('bBackDate').value;
	var myVar2 = document.getElementById('bGoDate').value;
	var myVar3 = document.getElementById('bBackTime').value;
	var myVar4 = document.getElementById('bGoTime').value;

	var date1 = new Date(myVar1);
	var date2 = new Date(myVar2);
	var timeDiff = Math.abs(date2.getTime() - date1.getTime());
	var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
	// var diffTimes = Math.ceil(timeDiff / (1000 * 3600 ));

	var strTime2 = new Date(myVar1+" "+myVar3);
	var strTime1 = new Date(myVar2+" "+myVar4);

	var myDate2 = new Date(strTime2);
	var timeStamp2 = myDate2.getTime();

	var myDate1 = new Date(strTime1);
	var timeStamp1 = myDate1.getTime();

	var timeDiff = (timeStamp2 - timeStamp1) / 1000;

	var minutesDiff = timeDiff / 60;
	var minutesRemain = minutesDiff % 60;

	var hoursDiff = (minutesDiff - minutesRemain) / 60;
	var minutesRemainT = (minutesRemain / 100)
	var diffTimesHours = (minutesRemainT + hoursDiff)

	var days = 0;
	for (var i = 0; i <= diffDays; i++) {
		var a = diffTimesHours - 6;
		if (a >= 12) {
			days = days + 1;
			diffTimesHours = diffTimesHours - 24;
		} else if (a >= 0) {
			days = days + 0.5;
			diffTimesHours = diffTimesHours - 6;
		} else {
			break;
		}
	}
	console.log(days);
	// alert(diffDays);
	for (var i = 0; i <= days; i++) {
		if (days > 0.5) {
			d = days - 1;
		} else {
			d = 0;
		}
	}
	$('#d').val(parseFloat(d));

	$('#bDaySum').val(parseFloat(days).toFixed(1));

	$("#bTimeSum").val(hoursDiff + '.' + minutesRemain);

}//end
</script>



</body>
</html>
