<!DOCTYPE HTML>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<%
	String result = "";
	UserBean bean = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
	result = (String) request.getAttribute("messessError");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ระบบขออนุญาตไปราชการ</title>

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
						
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/js/jquery.dataTables.min.js"></script>
<!-- 	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script> -->
<!-- 	<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script> -->
	<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<!-- 	<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script> -->
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<!-- 	<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css"> -->
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
	
	<script src="/js/fromUser.js"></script>

	
</head>

<body class="w3-light-grey w3-content" style="max-width:100%;">

<%@include file="Nav.jsp"%>  

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" 
	style="cursor:pointer" title="close side menu" id="myOverlay" >
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" 
    	class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    	<div class="w3-container" align="center" style="background-color: purple;">
    	<h1 style="margin-top: 3%;"><b style="color: white;">ข้อมูลไปราชการ</b></h1>
   				 <div class="w3-section w3-bottombar w3-padding-16">
     			
    	</div>
    	</div>
  </header>
<form name="welcome" action="#" method="post" class="w3-animate-top">
 <div style="margin-top: 4%;max-width: 90%;margin-left: 5%;">
 <input type="hidden" name="permissionId" id="permissionId">
	<table id="userTable" class="table table-striped table-bordered nowrap" style="width: 100%;">   
		<thead>
    	<tr style="background: purple;color: white;">
        	<th style="text-align: center;">รหัสอ้างอิง</th>
         	<th style="text-align: center;">วัน/เดือน/ปี</th>
        	<th style="text-align: center;">ชื่อ - นามสกุล</th>
        	<th style="text-align: center;">เรื่องที่ไปราชการ</th>
        	<th style="text-align: center;">สถานที่ไปราชการ</th>
        	<th style="text-align: center;">พิมพ์</th>
        	<th style="text-align: center;">เดินทางกลับ</th>
        	<th style="text-align: center;">พิมพ์</th>
    	</tr>
    	</thead>
	</table>
</div>
</form>
		<script type="text/javascript">
			function permissionBack(filter) {
				document.getElementById('permissionId').value = filter;
				document.welcome.action = "permissionBack";
				document.welcome.submit();
			}
		</script>


</div>

	<form name="welcameUserForm" action="welconeUser"     method="post" th:hidden="true"></form>
	<form name="Ask_storyForm"   action="gotoAsk_story"   method="post" th:hidden="true"></form>
	<form name="Ask_laForm"      action="gotoAsk_la"      method="post" th:hidden="true"></form>
	<form name="Ask_helpForm"    action="gotoAsk_Help"    method="post" th:hidden="true"></form>
	<form name="insertForm"      action="gotoInsert"      method="post" th:hidden="true"></form>
	<form name="logoutForm"      action="logout"          method="post" th:hidden="true"></form>
	
</body>
</html>