
<%@page import="com.hillert.model.PermissionBean"%>
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
<title>WelcomeAdmin</title>

<%

	UserBean bean = null;
	UserBean countUser = null;
	PermissionBean countPer = null;
	FacultyBean countFac1,countFac2,countFac3,countFac4,countFac5,countFac6 = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
	countUser = (UserBean) request.getSession().getAttribute("countUser");
	countPer = (PermissionBean) request.getSession().getAttribute("countPer");
	countFac1 = (FacultyBean) request.getSession().getAttribute("countFac1");
	countFac2 = (FacultyBean) request.getSession().getAttribute("countFac2");
	countFac3 = (FacultyBean) request.getSession().getAttribute("countFac3");
	countFac4 = (FacultyBean) request.getSession().getAttribute("countFac4");
	countFac5 = (FacultyBean) request.getSession().getAttribute("countFac5");
	countFac6 = (FacultyBean) request.getSession().getAttribute("countFac6");
	
%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	
	<!-- กราฟ -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>


<body class="w3-light-gray w3-content" style="max-width:100%">

<%@include file="NavAdmin.jsp" %>


<!-- !PAGE CONTENT! -->
<div class="w3-main  w3-animate-opacity"" style="margin-top:10px;">

<marquee direction="alternate" scrollamount="4" height="100cm" width="40%">
	<header class="w3-container" style="padding-top:22px">
		<h3><b><i class="fa fa-dashboard"></i> ข้อมูลเชิงวิเคราะห์ ระบบขออนุญาตไปราชการ มรภ.บร</b></h3>
	</header>
</marquee>

  <div class="w3-row-padding w3-margin-bottom " >
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>52</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Messages</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>99</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Views</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="w3-xxxlarge glyphicon glyphicon-file"></i></div>
        <div class="w3-right">
          <h3><%=countPer.getPermissionId() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Permission Form</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="w3-xxxlarge glyphicon glyphicon-user"></i></div>
        <div class="w3-right">
          <h3><%=countUser.getUserId() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Users</h4>
      </div>
    </div>
  </div>


  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
        <h5>เปอร์เซ็น ในการขอไปราชการของแต่ละคณะ</h5>
         <div class="w3-white w3-ul w3-card-4" id="piechart"></div>
        </div>
      <div class="w3-twothird">
       <h5>การขออนุญาตไปราชการ ของคณะในมหาวิทยาลัยราชภัฏบุรีรัมย์</h5>
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white w3-ul w3-card-4">
          <tr>
            <td><i class="fa fa-mortar-board w3-text-blue w3-large"></i></td>
            <td>คณะครุศาสตร์.</td>
            <td><i><%=countFac1.getFacultyId() %> ครั้ง</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-thermometer-3 w3-text-red w3-large"></i></td>
            <td>คณะวิทยาศาสตร์.</td>
            <td><i><%=countFac2.getFacultyId() %> ครั้ง</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-users w3-text-yellow w3-large"></i></td>
            <td>คณะมนุษยศาสตร์และสังคมศาสตร์.</td>
            <td><i><%=countFac3.getFacultyId() %> ครั้ง</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-laptop w3-text-red w3-large"></i></td>
            <td>คณะวิทยาการจัดการ.</td>
            <td><i><%=countFac4.getFacultyId() %> ครั้ง</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-wrench w3-text-blue w3-large"></i></td>
            <td>คณะเทคโนโลยีอุตสาหกรรม.</td>
            <td><i><%=countFac5.getFacultyId() %> ครั้ง</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-tree w3-text-red w3-large" ></i></td>
            <td>คณะเทคโนโลยีการเกษตร.</td>
            <td><i><%=countFac6.getFacultyId() %> ครั้ง</i></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>General Stats</h5>
    <p>New Visitors</p>
    <div class="w3-grey">
      <div class="w3-container w3-center w3-padding w3-green" style="width:100%">100%</div>
    </div>

    <p>New Users</p>
    <div class="w3-grey">
      <div class="w3-container w3-center w3-padding w3-orange" style="width:50%">50%</div>
    </div>

    <p>Bounce Rate</p>
    <div class="w3-grey">
      <div class="w3-container w3-center w3-padding w3-red" style="width:75%">75%</div>
    </div>
  </div>
  <hr>

  <div class="w3-container">
    <h5>Countries</h5>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
      <tr>
        <td>United States</td>
        <td>65%</td>
      </tr>
      <tr>
        <td>UK</td>
        <td>15.7%</td>
      </tr>
      <tr>
        <td>Russia</td>
        <td>5.6%</td>
      </tr>
      <tr>
        <td>Spain</td>
        <td>2.1%</td>
      </tr>
      <tr>
        <td>India</td>
        <td>1.9%</td>
      </tr>
      <tr>
        <td>France</td>
        <td>1.5%</td>
      </tr>
    </table><br>
</div>

  </div>


	<form name="logoutForm"   action="logout" 	    method="post" th:hidden= "true"></form>
	<form name="insertForm"   action="gotoInsert"   method="post" th:hidden= "true"></form>
	<form name="userAllForm"  action="gotoUserAll"  method="post" th:hidden= "true"></form>
	<form name="RequestForm"  action="gotoRequest"  	method="post" th:hidden= "true"></form>


<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['ครุศาสตร์.', <%=countFac1.getFacultyId() %>],
  ['วิทยาศาสตร์.', <%=countFac2.getFacultyId() %>],
  ['มนุษยศาสตร์และสังคมศาสตร์.', <%=countFac3.getFacultyId() %>],
  ['วิทยาการจัดการ.', <%=countFac4.getFacultyId() %>],
  ['เทคโนโลยีอุตสาหกรรม.', <%=countFac6.getFacultyId() %>]
  //['คณะเทคโนโลยีการเกษตร.', 80]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'width':500, 'height':225};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
	
</body>
</html>