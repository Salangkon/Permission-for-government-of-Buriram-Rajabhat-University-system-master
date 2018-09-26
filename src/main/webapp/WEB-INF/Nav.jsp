
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
	<header class="w3-container w3-light-grey">
      <h3 align="center">ยินดีต้อนรับ</h3>
    </header>
	<div class="w3-container" align="center">

	<div align="right">
		<a href="#" onclick="w3_close()"  class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" title="close menu"><i class="fa fa-bars"></i></a><br>
    </div>
    	<img src="/images/bru.png"style="width:45%;" class="w3-round"><br><br><hr>
    	<div align="center" class="form-group">
    		<table>
    			<tr>
    				<td><%=bean.getSex() %><%=bean.getUserFname() %> &nbsp;&nbsp; <%=bean.getUserLname() %></td>
    			</tr> 			
    		</table>
    	</div>
	</div>
	<input class="w3-button w3-block w3-dark-grey" onclick="document.getElementById('id05').style.display='block'" value="ข้อมูลส่วนตัว" type="button">
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

