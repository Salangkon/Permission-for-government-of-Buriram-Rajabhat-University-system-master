
<%@page import="com.hillert.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ระบบลาไปราชการ</title>

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="/css/table.css">

<%
	UserBean bean = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
%>

</head>



<body class="w3-light-grey w3-content" style="max-width:100%">

<%@include file="Nav.jsp"%>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/images/bru.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container" align="center" style="background-color:purple;">
    <h1 style="margin-top: 3%;"><b style="color: white;">ประวัติไปราชการ</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">

    </div>
    </div>
  </header>
	
<table id="customers" style="margin-bottom: 10mm;margin-top: 10mm">
	<tr>
    <th rowspan="2">รหัส<br>อ้างอิง</th>
	<th rowspan="2">วัน<br>เดือน<br>ปี</th>
	<th rowspan="2">ชื่อ-สกุล     </th>
	<th rowspan="2">สถานที่     </th>
    <th colspan="3">ผลการอนุมัติ</th>
    <th rowspan="2" align="right">แก้ไข</th>
    <th rowspan="2" align="right">พิมพ์</th>
	</tr> 
	<tr>
		<th>หัวหน้า<br>หน่วย</th>
		<th>คณะบดี<br> ผอ.สถาบัน</th>
		<th>ธรุการ<br>รับเรื่อง</th>
	</tr>
	
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td align="center"> <a href="#" >
        	<span class="glyphicon glyphicon-check"></span>  </a> 
        </td>
		<td align="center"> <a href="#" >
        	<span class="glyphicon glyphicon-check"></span>  </a> 
        </td>
		<td align="center"> <a href="#" >
        	<span class="glyphicon glyphicon-check"></span>  </a> 
        </td>
		<td align="center"> <a href="#" >
        	<span class="glyphicon glyphicon-edit"></span> Edit </a> 
        </td>
		<td align="center"> <a href="#" >
        	<span class="glyphicon glyphicon-print"></span> Print </a> 
        </td>
	</tr>
</table>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
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
	
		
</body>
</html>