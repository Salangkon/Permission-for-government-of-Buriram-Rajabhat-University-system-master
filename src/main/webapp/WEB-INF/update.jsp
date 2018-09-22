<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.hillert.model.*"%>
<%@ page import="java.util.List"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>update</title>
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
</body>
	<%
	UserBean beanUser = null;
	UserBean beanUpdateRole = null;
	PersonAddressBean bean = null;
	List<PersonAddressBean> list= null;
	String result = "";
	%>
	<%	
	beanUser = (UserBean) request.getSession().getAttribute("userBean");
	beanUpdateRole = (UserBean) request.getSession().getAttribute("resultBean");
	bean = (PersonAddressBean) request.getAttribute("beanPerson");
	list = (List<PersonAddressBean>) request.getAttribute("listUserBean");
	result = (String) request.getAttribute("messesUpdate");
	%>

</head>

<body class="w3-light-gray w3-content" style="max-width:100%">

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
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large w3-black" >
		<i class="fa fa-address-card-o w3-margin-right w3-large" style="margin-left: 6%;margin-top: 5%;color:white;"></i><label style="color: white;"> ข้อมูลส่วนตัว</label></a> 
		<a href="/gotoUserAll" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large ">
		<i class="glyphicon glyphicon-log-out w3-margin-right w3-large w3-wlite" style="margin-left: 6%;margin-top: 5%;"></i>ถอยกลับ</a> 
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-padding-large  ">
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
    <h2 style="margin-top: 3%;"><b style="color: white;">Personal profile</b></h2><br>
   		<a style="color: white;">ประวัติส่วนตัว บุคคลากร</a>
   	<div class="w3-section w3-bottombar w3-padding-16">
 	</div> 
	</div>	
  </header>

<div class="col-sm-2 " ></div>
<div class="col-sm-8 " >
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:20px">    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<div class="w3-container" style="padding: 10mm;background-color: white;">
		<div class="col-sm-2" ><label>ชื่อ-นามสกุล : </label></div>
		<div class="col-sm-7" ><label style="margin-left: 2mm"> <%=bean.getSex() %><%=bean.getUserFname() %></label><label style="margin-left: 2mm"> <%=bean.getUserLname() %></label></div>
		<div class="col-sm-3" > สถานะ : <label style="color: green;"><%if (bean.getRole() == 1) {out.print("รับราชการ");} else if (bean.getRole() == 2) {out.print("รับราชการ");} %></label>
		<label style="color: red;"><%if (bean.getRole() == 3) {out.print("ออกราชการ");} %></label>
		</div>
	<hr>
	<div class="col-sm-2" ><label>เบอร์มือถือ :</label> </div>
	<div class="col-sm-10" ><label style="margin-left: 2mm"><%if (bean.getNumberPhone() != null) {out.print(bean.getNumberPhone());} %></label></div>
	<div class="col-sm-12"  style="margin-top: 5%">
		<table class="w3-table-all w3-hoverable">
			<tr>
				<th style="background-color: yellow; ">คณะ</th>
				<th style="background-color: yellow; ">สาขา</th>
				<th style="background-color: yellow; ">ตำแหน่ง</th>
				<th style="background-color: yellow; ">ระดับ</th>
			</tr>
			<%for (int i = 0; i < list.size(); i++) {%>
			<tr>
				<td><%=list.get(i).getFacultyName()%></td>
				<td><%=list.get(i).getDepartmentName()%></td>
				<td><%=list.get(i).getPositionName()%></td>
				<td><%=list.get(i).getSubPositionName()%></td>
			</tr>
			<%}%>
		</table>
	</div>
	
<!-- 	<form name="updateForm" action="update" method="post"> -->
<!-- 	<div class="col-sm-12" >	 -->
<!-- 		<input type="hidden" name="role"  value="3"> -->
<!-- 		<button type="submit" class="btn btn-success">ออกจากราชการ</button> -->
<!-- 	</div> -->
<!-- 	</form> -->
	
	</div>
	</div>
	</div>
</div>
<div class="col-sm-2 " ></div>

	
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