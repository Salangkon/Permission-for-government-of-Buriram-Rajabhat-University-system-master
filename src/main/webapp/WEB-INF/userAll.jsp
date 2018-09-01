
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">
	
	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="/js/userAll.js"></script>
</head>


<body class="w3-light-grey w3-content" style="max-width:100%">

<%@include file="NavAdmin.jsp" %>

<form class="modal-content animate" action="" style="max-width:80%;margin-top: 5%;margin-left: 10%">
	<div class="w3-container w3-blue" align="left">
    	<h2><i class="fa fa-users w3-xxlarge w3-margin-right"></i> รายชื่อบุคคลากร  </h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
	<table id="userTable" class="table table-bordered" style="max-width:100%;margin-top: 5%;">   
		<thead>
    	<tr style="background: purple;color: white;">
         	<th style="text-align:center">ชื่อ</th>
        	<th style="text-align:center">นามสกุล</th>
        	<th style="text-align:center">สถานะ</th>
        	<th style="text-align:center">ตรวจสอบ<br>ข้อมูล</th>
    	</tr>
    	</thead>
    </table>
	</div>
	
	<div class="col-sm-10"></div>
    <div align="right" style="margin-top: 1%" class="col-sm-2">
    <a href="#" class="btn btn-info btn-lg" onclick="topFunction()" id="myBtn"><span class="glyphicon glyphicon-menu-up"></span><b> ไปข้างบน </b></a>
 	</div>	
</form>

	



	<form name="logoutForm"   action="logout" 	    method="post" th:hidden= "true"></form>
	<form name="insertForm"   action="gotoInsert"   method="post" th:hidden= "true"></form>
	<form name="userAllForm"  action="gotoUserAll"  method="post" th:hidden= "true"></form>
	<form name="RequestForm"  action="gotoRequest"  	method="post" th:hidden= "true"></form>

<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
</script>

</body>
</html>