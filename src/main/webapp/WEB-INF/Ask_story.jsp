
<%@page import="com.hillert.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ระบบลาไปราชการ</title>
	
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>	
	<script src="/js/user-data-personnel.js"></script>
	<script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="/js/listFaculty.js"></script>
	<script src="/js/listPosition.js"></script>
<%
	UserBean bean,beanUpdate = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
// 	beanUpdate = (UserBean) request.getAttribute("resultBean");

%>

</head>



<body class="w3-light-grey w3-content " style="max-width:100%">

<%@include file="Nav.jsp"%>
<%@include file="data_personnel.jsp" %>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container" align="center" style="background-color:purple;">
    <h1 style="margin-top: 3%;"><b style="color: white;">เปลี่ยนแปลง ข้อมูลส่วนตัว</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">

    </div>
    </div>
  </header>
  
<div class="col-sm-2 " ></div>
<div class="col-sm-8 w3-animate-top" >

	<div class="w3-card-4 w3-white" style="margin-top: 2%;margin-bottom: 10%">
  	<div class="w3-container w3-green ">
  		<h2 class="w3-center">เปลี่ยนแปลง ข้อมูลบุคคลากร</h2>
  	</div>
	<div style="margin-top: 2%;padding-left : 5%;padding-right: 5%">
	<div class="col-sm-12" style="margin-top: 5%;overflow: auto;" >
		<table class="w3-table-all w3-hoverable" id="userPersonnelTableUpdate" style="width: 100%">
			<thead>
				<tr>
					<th style="background-color: yellow;">คณะ</th>
					<th style="background-color: yellow;">สาขา</th>
					<th style="background-color: yellow;">ตำแหน่ง</th>
					<th style="background-color: yellow;">ระดับ</th>
					<th style="background-color: yellow;">แก้ไข</th>
				</tr>
			</thead>
		</table>
	</div>
<form name="updateUser" action="updateUser" method="post">
	<input type="hidden" name="userId" id="userId" value="<%=bean.getUserId() %>">
	<div class="form-group">
		<label for="exampleInputEmail1">ชื่อผู้ใช้งาน</label> 
		<input type="text" class="form-control" name="" value="<%=bean.getUserUsername()%>" disabled="disabled">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">รหัสผู้ใช้งาน</label> 
		<input type="text" class="form-control" name="userPassword" id="password" value="">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">คำนำหน้า</label> 
		<input type="text" class="form-control" name="sex" id="sexV" value="">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">ชื่อ</label> 
		<input type="text" class="form-control" name="userFname" id="fNameV" value="">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">นามสกุล</label> 
		<input type="text" class="form-control" name="userLname" id="lNameV" value="">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">เบอร์ มือถือ</label> 
		<input type="text" class="form-control" name="numberPhone" id="phone" value="" maxlength="10">
	</div>
		<button type="submit" class="btn btn-success" >ยืนยัน</button>
</form>
	</div><br>
	</div>
</div>
</div>

<div class="col-sm-2 " ></div>

	<!-- Modal update-->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">แก้ไขข้อมูล</h4>
				</div>
				<form name="updatePLUser" action="updatePLUser" method="POST">
				<div class="modal-body">
					<input type="hidden" id="personnel" name="personnelId"><br>
					<!-- คณะ  faculty -->
					<div class="form-group">
<!-- 						<label for="exampleFormControlSelect1">คณะ</label>  -->
						<input type="hidden" id="name" class="form-control">
						<label for="exampleFormControlSelect1">คณะ</label> 
						<select class="form-control" name="faculty" id="faculty" required>
<!-- 							<option value="" ></option> -->
						</select>
					</div>
					<!-- ภาควิชา  department -->
					<div class="form-group">
						<label for="exampleFormControlSelect1">ภาควิชา</label> 
						<select class="form-control" name="departmentCode" id="department" required>
							<option value="">== กรุณาเลือก ==</option>
						</select>
					</div>
					<!-- ตำแหน่ง  position -->
					<div class="form-group">
						<label for="exampleFormControlSelect1">ตำแหน่ง</label> 
							<select class="form-control" name="position" id="position" required>
<!-- 							<option value=""></option> -->
						</select>
					</div>
					<!-- ระดับ supPosition -->
					<div class="form-group">
						<label for="exampleFormControlSelect1">ระดับ</label> 
						<select class="form-control" name="subPositionCode" id="subPosition" required>
							<option value="">== กรุณาเลือก ==</option>
						</select>
					</div>
					<div style="margin-bottom: 5%; text-align: right;" class="modal-footer">
						<button class="w3-btn w3-green" type="submit">ยืนยัน</button>
						<button class="w3-btn w3-red"  data-dismiss="modal" type="button">ยกเลิก</button>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<input id="xx" type="hidden">

	<form name="welcameUserForm" action="welconeUser"     method="post" th:hidden="true"></form>
	<form name="Ask_storyForm"   action="gotoAsk_story"   method="post" th:hidden="true"></form>
	<form name="Ask_laForm"      action="gotoAsk_la"      method="post" th:hidden="true"></form>
	<form name="Ask_helpForm"    action="gotoAsk_Help"    method="post" th:hidden="true"></form>
	<form name="insertForm"      action="gotoInsert"      method="post" th:hidden="true"></form>
	<form name="logoutForm"      action="logout"          method="post" th:hidden="true"></form>
	
		
</body>
</html>