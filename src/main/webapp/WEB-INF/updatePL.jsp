<%@page import="com.hillert.model.PersonAddressBean"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>อัพเดท ขอมูลบุคลากร</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/js/listFaculty.js"></script>
	<script src="/js/listPosition.js"></script>

	<%
	UserBean bean= null;
	PersonAddressBean beanPL = null;
	String result = "";
	%>
	<%	
	bean   = (UserBean)request.getSession().getAttribute("userBean");
	beanPL = (PersonAddressBean)request.getAttribute("updatePL");
	result = (String)request.getAttribute("messesUpdate");
	%>
	
</head>
<body class="w3-light-gray w3-content w3-animate-zoom" >
<div class="w3-container w3-blue" style="margin-top: 5%">
  <h2>Input Form</h2>
  
</div>

<form class="w3-container w3-white" name="updatePL" action="updatePL" method="post">
	<% if (result.equals("S")) { %>
		<div class="alert alert-success" align="center">
			<strong>บันทึก </strong> เรียบร้อย
		</div>
	<% } else if (result.equals("F")) { %>
		<div class="alert alert-danger" align="center">
			<strong>บันทึก ล้มเหล้ว</strong> กรุณาลองอีกครั้ง !!
		</div>
	<% } %>
<input type="hidden" value="<%=beanPL.getPersonnelId()%>" name="personnelId"><br>
	<!-- คณะ  faculty -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">คณะ</label> 
		<select class="form-control" name="faculty" id="faculty">
			<option value="<%=beanPL.getFacultyCode()%>"><%=beanPL.getFacultyName()%></option>
		</select>
	</div>
	<!-- ภาควิชา  department -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">ภาควิชา</label>
		<select class="form-control" name="departmentCode" id="department">
			<option value="<%=beanPL.getDepartmentCode()%>"><%=beanPL.getDepartmentName()%></option>
		</select>
	</div>
	<!-- ตำแหน่ง  position -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">ตำแหน่ง</label> 
		<select class="form-control" name="position" id="position">
			<option value="<%=beanPL.getPositionCode()%>"><%=beanPL.getPositionName()%></option>
		</select>
	</div>
	<!-- ระดับ supPosition -->
	<div class="form-group">
		<label for="exampleFormControlSelect1">ระดับ</label>
		<select class="form-control" name="subPositionCode" id="subPosition">
			<option value="<%=beanPL.getSubPositionCode()%>"><%=beanPL.getSubPositionName()%></option>
		</select>
	</div>
	<div style="margin-bottom: 5%;text-align: right;">
	<button class="w3-btn w3-green" type="submit">ยืนยัน</button>
	<button class="w3-btn w3-red" onclick="window.location.href='/gotoUserAll'" type="button">หน้าแรก</button>
	</div>
</form>


</body>
</html>