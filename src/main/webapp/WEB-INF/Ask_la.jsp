<%@page import="com.hillert.model.PositionBean"%>
<%@page import="com.hillert.model.SubPositionBean"%>
<%@page import="com.hillert.model.FacultyBean"%>
<%@page import="com.hillert.model.DepartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>แบบฟอร์มการขออนุยาตไปราชการ</title>
	
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
	<script src="/js/insertPermission.js"></script>
	<script src="/js/province.js"></script>
	<script src="/js/budget.js"></script>
	<script src="/js/insertExpense.js"></script>
	
<%
	UserBean bean = null;
	String result = "";
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");	
	result = (String) request.getAttribute("messes");
%>

</head>



<body class="w3-light-grey w3-content" style="max-width:100%">

<%@include file="Nav.jsp"%>   


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-bottom: 5%;">
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container" align="center" style="background-color:purple;">
    <h1 style="margin-top: 3%;"><b style="color: white;">ใบขออนุญาตไปราชการ</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16"></div>
    	<% if (result.equals("S")) { %>
			<div class="alert alert-success" align="center">
				<strong>บันทึก </strong> เรียบร้อย
			</div>
		<% } else if (result.equals("F")) { %>
			<div class="alert alert-danger" align="center">
				<strong>บันทึก ล้มเหล้ว</strong> กรุณาลองอีกครั้ง !!
			</div>
		<% } %>
    </div>
  </header>
 		
	<div style="margin-top: 3%;">
		<%@include file="form_ask.jsp" %>
	</div>

	<footer  class="w3-black w3-center w3-padding-24" style="margin-top: 5%"> Ask la
		<a href="http://reg.bru.ac.th/registrar/home.asp" 
			title="W3.CSS" target="_blank" class="w3-hover-opacity">BRU
		</a>
	</footer>
</div>

	<form name="welcameUserForm" action="welconeUser"     method="post" th:hidden="true"></form>
	<form name="Ask_storyForm"   action="gotoAsk_story"   method="post" th:hidden="true"></form>
	<form name="Ask_laForm"      action="gotoAsk_la"      method="post" th:hidden="true"></form>
	<form name="Ask_helpForm"    action="gotoAsk_Help"    method="post" th:hidden="true"></form>
	<form name="insertForm"      action="gotoInsert"      method="post" th:hidden="true"></form>
	<form name="logoutForm"      action="logout"          method="post" th:hidden="true"></form>

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

	<!-- เพิ่มพาหนะ-->
	<header class="w3-display-container w3-content">
		<div id="id02" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="travelTable" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>ลำดับ</th>
								<th>พาหนะ</th>
							</tr>
						</thead>
					</table>

					<div style="size: 10" class="col-sm-12 " align="center">
						<button type="button" class="btn btn-success" id="buttonAdd2">ยืนยัน</button>
						<button type="button"
							onclick="document.getElementById('id02').style.display='none'"
							class="btn btn-danger">ปิด</button>
					</div>
				</div>
			</form>
		</div>
	</header>
	
		<!-- เพิ่มพาหนะ รถส่วนตัว-->
	<header class="w3-display-container w3-content">
		<div id="id03" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="travelTable1" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>ลำดับ</th>
								<th>พาหนะ</th>
							</tr>
						</thead>
					</table>

					<div style="size: 10" class="col-sm-12 " align="center">
						<button type="button" class="btn btn-success" id="buttonAdd3">ยืนยัน</button>
						<button type="button"
							onclick="document.getElementById('id03').style.display='none'"
							class="btn btn-danger">ปิด</button>
					</div>
				</div>
			</form>
		</div>
	</header>
	
			<!-- เพิ่มพาหนะ รถไปราชการ-->
	<header class="w3-display-container w3-content">
		<div id="id04" class="modal">
			<form class="modal-content animate" action=""
				style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
				<div class="w3-container w3-blue">
					<h2>
						<i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มพาหนะ
					</h2>
				</div>
				<div class="w3-container w3-white w3-padding-16">
					<table id="travelTable2" class="table table-bordered">
						<thead>
							<tr style="background: purple; color: white;">
								<th>ลำดับ</th>
								<th>พาหนะ</th>
							</tr>
						</thead>
					</table>

					<div style="size: 10" class="col-sm-12 " align="center">
						<button type="button" class="btn btn-success" id="buttonAdd4">ยืนยัน</button>
						<button type="button"
							onclick="document.getElementById('id04').style.display='none'"
							class="btn btn-danger">ปิด</button>
					</div>
				</div>
			</form>
		</div>
	</header>
	
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

	<!-- เพิ่มพาหนะ-->
	<script>
		// Get the modal
		var modal = document.getElementById('id02');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
	<!-- เพิ่มพาหนะ รถส่วนตัว-->
	<script>
		// Get the modal
		var modal = document.getElementById('id03');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
	<!-- เพิ่มพาหนะ รถไปราชการ-->
	<script>
		// Get the modal
		var modal = document.getElementById('id04');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>