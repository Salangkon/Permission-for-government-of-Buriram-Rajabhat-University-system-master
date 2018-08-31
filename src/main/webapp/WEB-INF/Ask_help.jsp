
<%@page import="java.util.List"%>
<%@page import="com.hillert.model.UserBean"%>
<%
	//@page import="com.hillert.model.UserBean"
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ระบบลาไปราชการ</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/w3.css">	
	
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
    <a href="#"><img src="images/bru.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container" align="center" style="background-color:purple;">
    	<h1 style="margin-top: 3%;"><b style="color: white;">สอบถาม</b></h1>
    	<div class="w3-section w3-bottombar w3-padding-16">
      
   	 </div>
    </div>
  </header>
	
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