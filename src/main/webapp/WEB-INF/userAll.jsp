
<%@page import="com.hillert.model.PersonAddressBean"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>รายชื่อบุคคลากร มรภ.บร</title>

<%
	UserBean bean = null;
	List<UserBean> list = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
	list = (List<UserBean>) request.getSession().getAttribute("listUser");
%>

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<!-- 	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css"> -->
	<link rel="stylesheet" href="/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

	<script src="/js/jQuery v3.3.1.js"></script>
<!-- 	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>	 -->
	<script src="/js/1-10-19jquery.dataTables.min.js"></script>
	<script src="/js/1-10-19dataTables.bootstrap.min.js"></script>
	<script src="/js/userAll.js"></script>

</head>


<body class="w3-light-grey w3-content" style="max-width: 100%">

	<%@include file="NavAdmin.jsp"%>

	<form name="welcome" action="#" method="post" class="modal-content w3-animate-bottom" style="width: 90%; margin-top: 3%; margin-left: 5%">
		<input type="hidden" name="userId" id="userId">
		<div class="w3-container w3-blue" align="left">
			<h2>
				<i class="fa fa-users w3-xxlarge w3-margin-right"></i>
				รายชื่อบุคคลากร
			</h2>
		</div>
		
		<div style="overflow: auto;" >
		<div class="w3-container w3-white w3-padding-16">
			<table id="userTable" class="table table-striped table-bordered nowrap" style="width: 100%; margin-top: 5%;">
				<thead>
					<tr style="background: purple; color: white;">
						<th style="text-align: center">รหัส</th>
						<th style="text-align: center">ชื่อ</th>
						<th style="text-align: center">นามสกุล</th>
						<th style="text-align: center">สถานะ</th>
						<th style="text-align: center">ตรวจสอบ<br>ข้อมูล
						</th>
					</tr>
				</thead>
			</table>
		</div>
		</div>

		<script type="text/javascript">
			function gotoUpdate(filter) {
				document.getElementById('userId').value = filter;
				document.welcome.action = "gotoUpdate";
				document.welcome.submit();
			}
		</script>
	</form>

	<form name="logoutForm"  action="logout" 		method="post" th:hidden="true"></form>
	<form name="insertForm"  action="gotoInsert" 	method="post" th:hidden="true"></form>
	<form name="userAllForm" action="gotoUserAll" 	method="post" th:hidden="true"></form>
	<form name="RequestForm" action="gotoRequest"	method="post" th:hidden="true"></form>

</body>
</html>