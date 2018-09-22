
<%@page import="com.hillert.model.PositionBean"%>
<%@page import="com.hillert.model.SubPositionBean"%>
<%@page import="com.hillert.model.FacultyBean"%>
<%@page import="com.hillert.model.DepartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>รายชื่อบุคคลากร มรภ.บร</title>

<%
	UserBean bean = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
%>

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="/js/fromAdmin.js"></script>
</head>


<body class="w3-light-grey w3-content" style="max-width:100%">

<%@include file="NavAdmin.jsp" %>

<form class="modal-content animate" action="" style="max-width:95%;margin-top: 5%;margin-left: 3%" name="welcome" action="#" method="post">
 <input type="hidden" name="permissionId" id="permissionId">
	<div class="w3-container w3-blue" align="center">
    	<h2><i class="fa fa-address-card-o w3-margin-right"></i> เพิ่มบุคคลากร  </h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
<table id="userTable" class="table table-bordered" >   
		<thead>
    	<tr style="background: purple;color: white;">
        	<th>รหัสอ้างอิง</th>
         	<th>วัน/เดือน/ปี</th>
        	<th>ชื่อ - นามสกุล</th>
        	<th>สถานที่</th>
        	<th>อนุมัติ</th>
        	<th>ตรวจสอบ</th>
    	</tr>
    	</thead>
	</table>

	</div>
		<script type="text/javascript">
			function gotoPerUpdate(filter) {
				document.getElementById('permissionId').value = filter;
				document.welcome.action = "gotoPerUpdate";
				document.welcome.submit();
			}
		</script>
	</form>

	<footer  class="w3-black w3-center w3-padding-24" style="margin-top: 5%"> Ask la
		 <a href="http://reg.bru.ac.th/registrar/home.asp" 
			title="W3.CSS" target="_blank" class="w3-hover-opacity">BRU
		</a>
	</footer>

	<form name="logoutForm"   action="logout" 	    method="post" th:hidden= "true"></form>
	<form name="insertForm"   action="gotoInsert"   method="post" th:hidden= "true"></form>
	<form name="userAllForm"  action="gotoUserAll"  method="post" th:hidden= "true"></form>
	<form name="RequestForm"  action="gotoRequest"  method="post" th:hidden= "true"></form>

</body>
</html>