<%@page import="com.hillert.model.UserBean"%>
<%@page import="org.springframework.context.annotation.Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="w3-display-container w3-content" style="max-width:98%">
	<div class="w3-container w3-red" >
		<h2><i class="fa fa-file-o w3-margin-right"></i>แบบฟอร์มขออนุญาตไปราชการ</h2>
    </div>
    
    <div class="w3-container w3-white w3-padding-16">
        	<% if (result.equals("S")) { %>
			<div class="alert alert-success" align="center">
				<strong>บันทึก </strong> เรียบร้อย
			</div>
		<% } else if (result.equals("F")) { %>
			<div class="alert alert-danger" align="center">
				<strong>บันทึก ล้มเหล้ว</strong> กรุณาลองอีกครั้ง !!
			</div>
		<% } %>

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
		<input name="status" id="status1" type="radio" value="ผู้บริหาร" 	 style="margin-left: 4.25%"><label style="margin-left: 2%">ผู้บริหาร    	 </label>
        <input name="status" id="status2" type="radio" value="ผู้สอน" 		 style="margin-left: 5.7%"><label style="margin-left: 2%">ผู้สอน		 </label>	
        <input name="status" id="status3" type="radio" value="ผู้สนับสนุนการสอน" style="margin-left: 2%"><label style="margin-left: 2%">ผู้สนับสนุนการสอน</label>
    </div>
	<label> เพื่อ (ระบุวัตถุประสงค์/ลักษณะงาน) </label>
	<textarea class="form-control" rows="5" cols="100" id="object" name="object"></textarea>
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
		<input name="purpose"  	id="purpose"  type="checkbox" value="ขออนุญาต" 	style="margin-left: 8%"><label style="margin-left: 2%">ขออนุญาต  </label>
        <input name="purpose1"	id="purpose1" type="checkbox" value="ได้รับคำสั่ง" 	style="margin-left: 2%"><label style="margin-left: 2%">ได้รับคำสั่ง</label>	
        <input name="purpose2" 	id="purpose2" type="checkbox" value="ไปราชการ" 	style="margin-left: 2%"><label style="margin-left: 2%">ไปราชการ</label>
    </div>
    <div>
    <label>เรื่องที่ไปราชการ </label>
    	<input type="text" class="form-control" name="topics" id="topics">
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
      <td align="center"><input type="radio" name="commitA" id="commitA2" value="ไม่มี">&nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitA" id="commitA1" value="มี">&nbsp;มี&nbsp;&nbsp;
      <input name="commitADt" id="commitADt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
    </tr>
    <tr>
    <td style="width: 6cm">งานสอนภาค กศ.บป./บัณฑิตศึกษา</td>
      <td align="center" style="width: 20mm"><input type="radio" name="commitB" id="commitB2" value="ไม่มี">&nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitB" id="commitB1" value="มี">&nbsp;มี&nbsp;&nbsp;
   	  <input name="commitBDt" id="commitBDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
    </tr>
    <tr>
      <td>งานประจำเวร/ประจำวัน</td>
      <td align="center"><input type="radio" name="commitC" id="commitC2" value="ไม่มี">&nbsp;&nbsp;ไม่มี</td>
       <td align="center"><input type="radio" name="commitC" id="commitC1" value="มี">&nbsp;มี&nbsp;&nbsp;
      <input name="commitCDt" id="commitCDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
    </tr>
    <tr>
      <td>งานอื่นๆ &nbsp; <input  name="other" id="other" type="text" placeholder="&nbsp;&nbsp;ถ้ามีให้กรอก..."></td>
      <td align="center"><input type="radio" name="commitD" id="commitD2" value="ไม่มี">&nbsp;&nbsp;ไม่มี</td>
      <td align="center"><input type="radio" name="commitD" id="commitD1" value="มี">&nbsp;มี&nbsp;&nbsp;
      <input name="commitDDt" id="commitDDt" type="text" placeholder="&nbsp;&nbsp;มอบหมายให้..."></td>
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

	 <div class="form-group"><label  style="margin-top: 3%">วันที่ไป  </label><input class="form-control" type="date" id='goDate' name="goDate"> </div>
	 <div class="form-group"><label>เวลาออก : </label><input class="form-control" type='time' id='goTime' name="goTime"> </div>
	 <div class="form-group"><label>วันที่กลับ : </label><input class="form-control" type='date' id='backDate' name="backDate"> </div>
     <div class="form-group"><label>เวลากลับ : </label><input class="form-control" type='time' id='backTime' name="backTime"> </div>
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
   		<input class="form-control" name="destinationName" id="destinationName" type="text" placeholder="สถานที่ไปราชการ">
    </div>
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
</div><!--end  -->

</div>

</div>
</header>

<!-- สรุป แบบฟอร์มประมาณการรายจ่าย -->
<header class="w3-display-container w3-content" style="max-width:98%;margin-top: 2%">
	<div class="w3-container w3-blue">
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
		<select class="form-control" name="Budget" id="budget" onChange="Show(this.selectedIndex)">
        	<option value="ไม่เบิกค่าใช้จ่าย">ไม่เบิกค่าใช้จ่าย </option>
        	<option value="เบิกค่ามใช้จ่าย">เบิกค่าใช้จ่าย</option>	
		</select>
	</div>
	</div></div></div>
	<div style="size: 10" class="col-sm-10 " ></div>
</div>
	<!-- <div id="No Budget" style="display:none"></div>  -->
    
	<!-- เบิกค่าใช้จ่าย -->
	<div id="Manual Budget" style="display:none">
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
			<option value="">== กรุณาเลือก ==</option>
        	<option value="ตามสิทธิ์">ตามสิทธิ์</option>
  			<option value="เหมาจ่าย">เหมาจ่าย</option>
		</select>
	</div>
</div>
<div style="size: 10" class="col-sm-2 " >
	<div class="form-group" style="margin-top: 4%">
	<label>ใช้งบประมาณ  </label>
		<select class="form-control" name="budgetBy" id="budgetBy">
			<option value="">== กรุณาเลือก ==</option>
        	<option value="งบประมาณแผ่นดิน">งบประมาณแผ่นดิน</option>
  			<option value="งบรายได้">งบรายได้</option>
  			<option value="อื่นๆ">อื่นๆ</option>
		</select>
	</div>
</div>
<div style="size: 10" class="col-sm-4 " >
	<div class="form-group" style="margin-top: 1.7%">
	<label> โครงการ  </label><input class="form-control" name="budgetProject" id="budgetProject" type="text" value="">
	</div>
</div>
<div style="size: 10" class="col-sm-2 " >
	<div class="form-group" style="margin-top: 3.5%">
	<label> รหัส    </label><input class="form-control" name="budgetPass" id="budgetPass" type="text" onkeyup="autoTab(this)">
	</div>
</div>
<div style="size: 10;" class="col-sm-2 ">
	<div class="input-group" style="margin-top: 15%">
	<div class="input-group-addon">วงเงิน</div><input class="form-control" style="text-align:center" id="aaa" type="text" disabled>
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
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><input type="text" id="allowenceDetails" class="form-control" style="height: 7mm"></div>
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><label>ค่าเช่าที่พัก (รายละเอียดเช่าที่พัก)</label>
		<a class="test" href="#" data-toggle="tooltip" data-placement="top" title=" (240 x 2) + (180  x 2) ">ตัวอย่าง</a>
	</div>
	<div class="col-sm-3" style="margin-bottom: 1%;margin-top: 1%;"><input type="text" id="rentDateDetails" class="form-control" style="height: 7mm"></div>
	</div></div></div><br>
	<table id="addUser" class="table table-bordered" style="font-family: sans-serif;font-size:small;width:  100%">   
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

 
<div style="size: 10" class="col-sm-2" >
 	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container">
	<div class="form-group">
	<label> การเดินทาง  </label>   
    <select class="form-control" name="travel" id="travel" onChange="ShowReg(this.selectedIndex)">
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
	<div id="No Promotion" style="display:none"></div> 

<div id="Manual Promotion1" style="display:none">
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

<div id="Manual Promotion2" style="display:none">
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
<!-- <div id="Manual Promotion3" style="display:none"> -->
<!-- 	<div class="col-sm-5"> -->
	<!-- Page Container --> 
<!-- 	<div class="w3-container w3-content" style="max-width:100%;margin-top:20px;">     -->
	<!-- Profile -->
<!-- 	<div class="w3-card w3-round w3-Turquoise" style="height: 19mm;background-color:rgba(255, 255, 0, 0.6);"> -->
<!-- 	<div class="w3-container"> -->
<!-- 	<div class="input-group" style="margin-top: 5mm"> -->
<!-- 		<div class="input-group-addon">หมายเลขทะเบียน </div> -->
<!-- 		<input class="form-control" name="travelIdcard" id="travelIdcard" type="text" value="" maxlength="6">  -->
<!-- 	</div> -->
<!-- 	</div></div></div> -->
<!-- 	</div>  -->
<!-- 	<div class="col-sm-7"></div> -->
<!-- <div style="margin-bottom: 3%;" class="col-sm-12" > -->
<!-- 	<h3 style="color: white;"align="center"  class="w3-container w3-blue"><i class="fa fa-car w3-margin-right" style="font-size:30px;"></i>เลือกค่า พาหนะในการเดินทาง และกำหนดค่า  (หมายเหตุ ถ้ามี)</h3><br> -->
<!-- 	<table id="addTravel2" class="table table-bordered" style="font-family: sans-serif;font-size:small;width: 100%">    -->
<!-- 		<thead> -->
<!--     	<tr style="background: purple;color: white;"> -->
<!--     		<th style="text-align:center">รหัส</th> -->
<!--          	<th style="text-align:center">รายการ</th> -->
<!--         	<th style="text-align:center">ระยะทาง<br>กม.</th> -->
<!--         	<th style="text-align:center">เที่ยว</th> -->
<!--         	<th style="text-align:center">ค่าน้ำมัน<br>ลิตรละ/บาท</th> -->
<!--         	<th style="text-align:center">หาร</th> -->
<!--         	<th style="text-align:center">รวม <br> ค่าเชื้อเพลิง</th> -->
<!--         	<th style="text-align:center">ค่าทางด่วน<br>ครัังละ/บาท</th> -->
<!--         	<th style="text-align:center">ค่าทางด่วน<br>ครััง</th> -->
<!--         	<th style="text-align:center">รวม <br> ค่าทางด่วน</th> -->
<!-- 			<th style="text-align:center">รวม</th> -->
<!-- 			<th style="text-align:center">หมายเหตุ</th> -->
<!--     	</tr> -->
<!--     	</thead> -->
<!--     </table> -->
<!--     <div align="right"> -->
<!--    		<input class=" btn btn-primary" type="button" value="เลือกพาหนะ" onclick="document.getElementById('id04').style.display='block'"> -->
<!--     </div> -->
<!-- </div>	 -->
<!-- </div> -->

</div><!-- end กรอบที่ 3-->
	

	<div style="margin-top: 4%" class="col-sm-12 " align="center" >
		<button class="btn btn-success" id="saveExpenseEstimate">ยืนยัน</button>
		<button type="reset" class="btn btn-danger">รีเซต</button>
	</div>
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

<script type="text/javascript">
	//กรอกได้เฉพราะ ตัวเลข
	function chkNumber(ele)
	{
	var vchar = String.fromCharCode(event.keyCode);
	if ((vchar<'0' || vchar>'9') && (vchar != '.')) return false;
	ele.onKeyPress=vchar;
	}
</script>
	

