
<%@page import="com.hillert.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top20px"> 
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<!-- close menu -->
	<div class="w3-container" align="center">
	<div align="right">
		<a href="#" onclick="w3_close()"  class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" title="close menu"><i class="fa fa-bars"></i></a><br>
    </div>
    	<img src="/images/bru.png"style="width:45%;" class="w3-round"><br><br>
    	<h4><b>ยินดีต้อนรับ</b></h4><hr>
    	<div align="left" class="form-group">
    		<table>
    			<tr>
    				<td><label style="color: red;">ชื่อ-สกลุ  </label></td>
    				<td style="background-color: #3CFBFF;"><label><%=bean.getSex() %><%=bean.getUserFname() %> &nbsp;&nbsp; <%=bean.getUserLname() %></label></td>
    			</tr>
    			<tr>
    				<td><label style="color: red;">คณะ &nbsp;&nbsp; </label></td>
    				<td style="background-color: #96FFFF;"><label> <%%></label></td>
    			</tr>
    			<tr>
    				<td><label style="color: red;">สาขา&nbsp;&nbsp;  </label></td>
    				<td style="background-color: #3CFBFF;"><label> <%%></label></td>
    			</tr>
    			<tr>
    				<td><label style="color: red;">ประจำ&nbsp;&nbsp; </label></td>
    				<td style="background-color: #96FFFF;"><label> <%%></label></td>
    			</tr>   
    			<tr>
    				<td><label style="color: red;">ตำแหน่ง&nbsp;&nbsp;  </label></td>
    				<td style="background-color: #3CFBFF;"><label> <%%></label></td>
    			</tr> 			
    		</table>
    	</div>
	</div>
	</div>
	</div>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
		<div class="w3-container">
	<!-- Manu -->
	<div class="w3-bar-block" style="margin-left: 5%;margin-bottom: 10%;margin-top: 10%;">
  		<a href="welcomeUser" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">
    		<i class="glyphicon glyphicon-th-large w3-margin-right" style="margin-top: 5%;"></i>หน้าแรก</a> 
	    <a href="javascript: document.Ask_laForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-file w3-margin-right" style="margin-top: 5%;"></i>ใบขออนุญาตไปราการ</a> 
   	    <a href="javascript: document.Ask_storyForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-list-alt w3-margin-right" style="margin-top: 5%;"></i>ประวัติไปปราชการ</a> 
	    <a href="javascript: document.Ask_helpForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding" >
    		<i class="glyphicon glyphicon-envelope w3-margin-right" style="margin-top: 5%;"></i>สอบถาม</a>
  	    <a href="javascript: document.logoutForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-log-in w3-margin-right" style="margin-top: 5%;"></i> Logout</a>
 	 </div>
 	 </div>
 	 </div>
 	 </div>
</nav>
		

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

