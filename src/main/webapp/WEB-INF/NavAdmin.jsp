<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.hillert.model.UserBean"%>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top20px"> 
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<header class="w3-container w3-light-grey">
      <h3 align="center">ยินดีต้อนรับ ผู้ดูแลระบบ</h3>
    </header>
	<div class="w3-container" align="center">
	<div align="right">
		<a href="#" onclick="w3_close()"  class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" title="close menu"><i class="fa fa-bars"></i></a><br>
    </div>
    	<img src="/images/bru.png"style="width:45%;" class="w3-round"><br><br>
    	<hr>
    	<div align="center" class="form-group">
    		<table>
    			<tr>
    				<td><%=bean.getUserFname() %> &nbsp;&nbsp; <%=bean.getUserLname() %></td>
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
	<header class="w3-container w3-light-grey">
      <h3 align="center">เมนู</h3>
    </header>
	<div class="w3-container">
	<!-- Manu -->
	<div class="w3-bar-block" style="margin-left: 5%;margin-bottom: 10%;margin-top: 10%;">
	<a href="welcomeAdmin" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ">
    		<i class="glyphicon glyphicon-th-large w3-margin-right" style="margin-left: 6%;"></i>หน้าแรก</a> 
	<a href="javascript: document.userAllForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button ">
    		<i class="glyphicon glyphicon-user w3-margin-right" style="margin-left: 6%;"></i>รายชื่อบุคคลากร</a> 
	<a href="javascript: document.insertForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button ">
		<i class="glyphicon glyphicon-plus w3-margin-right " style="margin-left: 6%;"></i>เพิ่มบุคคลากร</a> 
	<a href="javascript: document.RequestForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-list-alt w3-margin-right" style="margin-left: 6%;"></i>คำขอไปปราชการ</a> 
    <a href="javascript: document.Ask_laForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-file w3-margin-right" style="margin-left: 6%;"></i>ใบขออนุญาตไปราการ</a> 
   	<a href="javascript: document.Ask_storyForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-list-alt w3-margin-right" style="margin-left: 6%;"></i>ประวัติไปปราชการ</a>     
  	<a href="javascript: document.logoutForm.submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    		<i class="glyphicon glyphicon-log-out w3-margin-right" style="margin-left: 6%;"></i>ออกจากระบบ</a>
    </div>
    </div>
    </div>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" 
	style="cursor:pointer" title="close side menu" id="myOverlay">
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" 
    	class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    	<div class="w3-container" align="center" style="background-color: purple;">
    	<h1 style="margin-top: 3%;"><b style="color: white;">Permission for government of Buriram Rajabhat University system</b></h1><br>
   				<a style="color: white;">(ระบบขออนุญาตไปราชการ ของมหาวิทยาลัยราชฏบุรีรัมย์)</a>
   		<div class="w3-section w3-bottombar w3-padding-16">
  		</div> 
   		</div>

  </header>

  
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
