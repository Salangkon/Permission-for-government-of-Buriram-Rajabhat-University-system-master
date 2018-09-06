<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<title>ระบบขออนุญาตไปราชการ</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="css/login.css">
	
	<%	
		String result = "";
	%>
	<%
		result = (String) request.getAttribute("messessError");
	%>
	
</head>


<body class="w3-light-wlite w3-content" style="max-width:100%">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar" ><br>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top20px" >    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<!-- close menu -->
	<div align="right">
		<a href="#" onclick="w3_close()"  class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" title="close menu"><i class="fa fa-bars"></i></a><br>
    </div>
		<div class="w3-container">
		<!-- มหาวิทยาลัยราชภัฎบุรีรัมย์ -->
		<p class="w3-center"><img src="/images/bru.png" class="w3-circle" style="width : 45% ;margin-top : 10%" alt="Avatar"></p><hr>
		<h4 class="w3-center" style="margin-bottom: 10%">มหาวิทยาลัยราชภัฎบุรีรัมย์</h4>
		</div>
	</div>
    </div><br>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
		<div class="w3-container">
		<!-- Manu -->
		<div class="w3-bar-block" style="margin-top: 10%;margin-bottom: 10%;">
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large w3-grey">
		<i class="glyphicon glyphicon-log-in w3-margin-right w3-large" style="margin-left: 6%;margin-top: 5%;"></i>Login</a> 
		<a href="http://fms.bru.ac.th/wp-content/uploads/2017/02/บันทึกขออนุญาตไปราชการ01082560.pdf" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
		<i class="glyphicon glyphicon-book w3-margin-right w3-large" style="margin-left: 6%;margin-top: 5%;"></i>คู่มือการลาไปราชการ</a> 
		<a href="/pdf/_____________________-BigData.pdf" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large w3-hover-black ">
		<i class="glyphicon glyphicon-book w3-margin-right w3-large" style="margin-left: 6%;margin-top: 5%;"></i>ตัวอย่างไปราชการ</a> 
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large w3-hover-black ">
    		<i class="glyphicon glyphicon-envelope w3-margin-right" style="margin-left: 6%;margin-top: 5%;"></i>ติดต่อ/สอบถาม</a>  	    
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
<div class="w3-main" style="margin-left:300px;" >
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey btn" onclick="w3_open()"><i style="color: white;" class="fa fa-bars"></i></span>
    <div class="w3-container" align="center" style="background-color: purple;">
    <h2 style="margin-top: 3%;"><b style="color: white;">Permission for government of Buriram Rajabhat University system</b></h2><br>
   		<a style="color: white;">(ระบบขออนุญาตไปราชการ ของมหาวิทยาลัยราชฏบุรีรัมย์)</a>
   	<div class="w3-section w3-bottombar w3-padding-16">
 	</div> 
	</div>
	<marquee id="grad1" direction="lefe" scrollamount="10" width="100%">
		<h1 style="font-size: x-large;color: red;"><strong> Welcome to Permission for government of Buriram Rajabhat University system </strong></h1>
	</marquee>	
  </header>
</div>
  <div class="col-sm-6"></div>
	<div class="col-sm-6">
		<form name="login" action="login" method="post" >
			<div id="container">
  			<h1>เข้าระบบ PFG</h1>
			<%if (result.equals("F")) { %>
			<div class="alert alert-danger" align="center">
				<strong>รหัส !! ผิดพลาด </strong> กรุณาลองอีกครั้ง !!
			</div>
			<%} else if (result.equals("L")) { %>
			<div class="alert alert-success" align="center">
				<strong>ออกจากระบบ </strong> เรียบร้อยแล้ว
			</div>
			<%} else if (result.equals("Out")) { %>
			<div class="alert alert-warning" align="center">
				<i class="glyphicon glyphicon-exclamation-sign"></i>
				<strong>ชื่อผู้ใช้ !!</strong> ออกจากราชการ
			</div>
			<% } %>
			<label style="color: white;margin-left: 16mm;margin-bottom: 3mm"> </label>
   			<input id="input123" type="text" name="username" placeholder="ชื่อผู้ใช้" value='s'>
   			<label style="color: white;margin-left: 16mm;margin-bottom: 3mm"> </label>
    		<input id="input12" type="password" name="password" placeholder="รหัสผ่าน" value='s'>
    		<label style="color: white;margin-bottom: 10mm">   </label>
    		<input class="btn btn-success" type="submit" value="Log in" style="width: 106mm;margin-left: 12mm;" />

   			</div>
		</form>
	</div>
	
	
	
	
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
	
</body>
</html>