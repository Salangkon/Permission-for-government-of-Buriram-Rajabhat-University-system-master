<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.hillert.model.LoginBean"%>
<%@ page import="java.util.List"%>
<%@page import="com.hillert.model.UserBean"%>
<html xmlns:th="http://www.thymeleaf.org">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	LoginBean bean = null;
	String result = "";
%>
<%
	bean = (LoginBean) request.getSession().getAttribute("LoginUser");
	result = (String) request.getAttribute("messes");
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>


<body>

	<a type="button" class="btn btn-danger" href="javascript: document.backForm.submit()"> Back</a>
			

	<form name="backForm"	 action="/"		 method="post" th:hidden="true"></form>
	<form name="logoutForm"  action="logout" method="post" th:hidden="true"></form>


	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		
	
	
</body>
</html>