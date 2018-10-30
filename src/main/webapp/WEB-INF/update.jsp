<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.hillert.model.*"%>
<%@ page import="java.util.List"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>update</title>
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<%
	UserBean bean= null;
	UserBean beanUpdate = null;
	List<PersonAddressBean> list = null;
// 	PersonAddressBean beanPL = null;
	String result = "";
	%>
	<%	
	bean = (UserBean)request.getSession().getAttribute("userBean");
	beanUpdate = (UserBean)request.getAttribute("resultBean");
	list = (List<PersonAddressBean>)request.getAttribute("listUserBean");
// 	beanPL = (PersonAddressBean)request.getAttribute("updatePL");
	result = (String)request.getAttribute("messesUpdate");
// 	beanUpdate = (UserBean)request.getSession().getAttribute("resultBean");
// 	list = (List<PersonAddressBean>)request.getSession().getAttribute("listUserBean");
// 	beanPL = (PersonAddressBean)request.getSession().getAttribute("updatePL");
// 	result = (String)request.getSession().getAttribute("messesUpdate");
	%>

</head>

<body class="w3-light-gray w3-content" style="max-width:100%">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar" ><br>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top20px" >    
	<!-- Profile -->
	<div class="w3-card w3-round w3-Turquoise">
	<header class="w3-container w3-light-grey">
      <h3 align="center">ยินดีต้อนรับ ผู้ดูแลระบบ</h3>
    </header>
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
		<div class="col-sm-7" ><label style="margin-left: 2mm"> <%=beanUpdate.getSex() %><%=beanUpdate.getUserFname() %></label><label style="margin-left: 2mm"> <%=beanUpdate.getUserLname() %></label></div>
		<div class="col-sm-3" > สถานะ : <label style="color: blue;"><%if (beanUpdate.getRole() == 1) {out.print("ผู้ดูแลระบบ");}%></label>
		<label style="color: green;"><%if (beanUpdate.getRole() == 2) {out.print("รับราชการ");} %></label>
		<label style="color: red;"><%if (beanUpdate.getRole() == 3) {out.print("ออกราชการ");} %></label>
		</div>
	<hr>
	<div class="col-sm-2" ><label>เบอร์มือถือ :</label> </div>
	<div class="col-sm-10" ><label style="margin-left: 2mm"><%if (beanUpdate.getNumberPhone() != null) {out.print(beanUpdate.getNumberPhone());} %></label></div>
	<form name="welcome" action="#" method="post" class="w3-animate-bottom">
	<input type="hidden" name="personnelId" id="personnelId">
	<div class="col-sm-12"  style="margin-top: 5%">
		<table class="table">
			<tr>
				<th style="background-color: yellow; ">คณะ</th>
				<th style="background-color: yellow; ">สาขา</th>
				<th style="background-color: yellow; ">ตำแหน่ง</th>
				<th style="background-color: yellow; ">ระดับ</th>
				<th style="background-color: yellow;text-align: center; ">แก้ไข</th>
			</tr>
			<%for (int i = 0; i < list.size(); i++) {%>
			<tr>
				<td><%=list.get(i).getFacultyName()%></td>
				<td><%=list.get(i).getDepartmentName()%></td>
				<td><%=list.get(i).getPositionName()%></td>
				<td><%=list.get(i).getSubPositionName()%></td>
				<td><div align="center"><a onclick="gotoUpdate('<%=list.get(i).getPersonnelId()%>')" class="btn btn-warning" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-edit"></span></a>
					</div>
				</td>
			</tr>
			<%}%>
		</table>
	</div>
	</form>
	<div class="col-sm-12" >	

	</div>
	
	</div>
	</div>
	</div>
<form name="update" action="update" method="post">
	<div class="w3-card-4 w3-white" style="margin-top: 2%;margin-bottom: 10%">
  	<div class="w3-container w3-green">
  		<h2 class="w3-center">เปลี่ยนแปลง ข้อมูลบุคคลากร</h2>
  	</div>
	<div style="margin-top: 2%;padding-left : 5%;padding-right: 5%">
	<% if (result.equals("S")) { %>
		<div class="alert alert-success" align="center">
			<strong>บันทึก </strong> เรียบร้อย
		</div>
	<% } else if (result.equals("F")) { %>
		<div class="alert alert-danger" align="center">
			<strong>บันทึก ล้มเหล้ว</strong> กรุณาลองอีกครั้ง !!
		</div>
	<% } %>
	<input type="hidden" name="userId" id="userId" value="<%=beanUpdate.getUserId() %>">
	
	<div class="form-group">
		<label for="exampleInputEmail1">คำนำหน้า</label> 
		<input type="text" class="form-control" name="sex" value="<%=beanUpdate.getSex() %>">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">ชื่อ</label> 
		<input type="text" class="form-control" name="userFname" value="<%=beanUpdate.getUserFname() %>">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">นามสกุล</label> 
		<input type="text" class="form-control" name="userLname" value="<%=beanUpdate.getUserLname() %>">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">เบอร์ มือถือ</label> 
		<input type="text" class="form-control" name="numberPhone" value="<%=beanUpdate.getNumberPhone() %>" maxlength="10">
	</div>
	<div class="form-group">
		<select name="role" class="form-control">
			<option value="2">USER</option>
			<option value="1">ADMIN</option>
			<option value="3">ออกจากราชการ</option>
		</select>
	</div>	
		<button type="submit" class="btn btn-success" >ยืนยัน</button>
	</div><br>
	</div>
</form>
</div>

</div><!-- end -->

<script type="text/javascript">
	function gotoUpdate(filter) {
		document.getElementById("personnelId").value = filter;
		document.welcome.action = "gotoUpdatePL";
		document.welcome.submit();
	}
</script>
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