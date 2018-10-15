
<%@page import="com.hillert.model.ExpenseSumaryBean"%>
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
	PermissionBean countPer , countPerBack = null;
	FacultyBean countFac1,countFac2,countFac3,countFac4,countFac5,countFac6 = null;
	ExpenseSumaryBean es, esFac1, esFac2, esFac3, esFac4, esFac5, esFac6 = null;
%>
<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
	countUser = (UserBean) request.getSession().getAttribute("countUser");
	countPer = (PermissionBean) request.getSession().getAttribute("countPer");
	countPerBack = (PermissionBean) request.getSession().getAttribute("countPerBack");
	countFac1 = (FacultyBean) request.getSession().getAttribute("countFac1");
	countFac2 = (FacultyBean) request.getSession().getAttribute("countFac2");
	countFac3 = (FacultyBean) request.getSession().getAttribute("countFac3");
	countFac4 = (FacultyBean) request.getSession().getAttribute("countFac4");
	countFac5 = (FacultyBean) request.getSession().getAttribute("countFac5");
	countFac6 = (FacultyBean) request.getSession().getAttribute("countFac6");
	es 		= (ExpenseSumaryBean) request.getSession().getAttribute("es");
	esFac1	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac1");
	esFac2	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac2");
	esFac3	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac3");
	esFac4	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac4");
	esFac5	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac5");
	esFac6	= (ExpenseSumaryBean) request.getSession().getAttribute("esFac6");
	
%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	
	<!-- กราฟ -->
	<script type="text/javascript" src="/js/loadercharts.js"></script>
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
        <div class="w3-left"><i class="w3-xxxlarge glyphicon glyphicon-usd"></i></div>
        <div class="w3-right">
          <h3><%=es.getExpenseEstimateSumTotal() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>งบประมาณทั้งหมด</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="w3-xxxlarge glyphicon glyphicon-file"></i></div>
        <div class="w3-right">
          <h3><%=countPer.getPermissionId() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Permission Forms</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16 w3-ul w3-card-4 w3-card w3-round w3-Turquoise">
        <div class="w3-left"><i class="w3-xxxlarge glyphicon glyphicon-file"></i></div>
        <div class="w3-right">
          <h3><%=countPerBack.getPermissionId() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Permission Back Forms</h4>
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

  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
        <h5>เปอร์เซ็น ในการขอเบิกค่าใช้จ่ายในการเดินทางไปราชการของแต่ละคณะ</h5>
         <div class="w3-white w3-ul w3-card-4" id="piechart1"></div>
        </div>
      <div class="w3-twothird">
      <h5>การขอเบิกค่าใช้จ่ายในการเดินทางไปราชการ ของแต่ละคณะในมหาวิทยาลัยราชภัฏบุรีรัมย์</h5>
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white w3-ul w3-card-4">
          <tr>
            <td><i class="fa fa-mortar-board w3-text-blue w3-large"></i></td>
            <td>คณะครุศาสตร์.</td>
            <td><i><%=esFac1.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-thermometer-3 w3-text-red w3-large"></i></td>
            <td>คณะวิทยาศาสตร์.</td>
            <td><i><%=esFac2.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-users w3-text-yellow w3-large"></i></td>
            <td>คณะมนุษยศาสตร์และสังคมศาสตร์.</td>
            <td><i><%=esFac3.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-laptop w3-text-red w3-large"></i></td>
            <td>คณะวิทยาการจัดการ.</td>
            <td><i><%=esFac4.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-wrench w3-text-blue w3-large"></i></td>
            <td>คณะเทคโนโลยีอุตสาหกรรม.</td>
            <td><i><%=esFac5.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-tree w3-text-red w3-large" ></i></td>
            <td>คณะเทคโนโลยีการเกษตร.</td>
            <td><i><%=esFac6.getExpenseEstimateSumTotal() %> บาท</i></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  </div>


	<form name="logoutForm"   action="logout" 	    method="post" th:hidden= "true"></form>
	<form name="insertForm"   action="gotoInsert"   method="post" th:hidden= "true"></form>
	<form name="userAllForm"  action="gotoUserAll"  method="post" th:hidden= "true"></form>
	<form name="RequestForm"  action="gotoRequest"  method="post" th:hidden= "true"></form>


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
  ['เทคโนโลยีการเกษตร.', <%=countFac5.getFacultyId() %>],
  ['เทคโนโลยีอุตสาหกรรม.', <%=countFac6.getFacultyId() %>]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'width':500, 'height':225};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart1);

// Draw the chart and set the chart values
function drawChart1() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['ครุศาสตร์.', <%=esFac1.getExpenseEstimateSumTotal() %>],
  ['วิทยาศาสตร์.', <%=esFac2.getExpenseEstimateSumTotal() %>],
  ['มนุษยศาสตร์และสังคมศาสตร์.', <%=esFac3.getExpenseEstimateSumTotal() %>],
  ['วิทยาการจัดการ.', <%=esFac4.getExpenseEstimateSumTotal() %>],
  ['เทคโนโลยีการเกษตร.', <%=esFac5.getExpenseEstimateSumTotal() %>],
  ['เทคโนโลยีอุตสาหกรรม.', <%=esFac6.getExpenseEstimateSumTotal() %>]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'width':500, 'height':225};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
  chart.draw(data, options);
}
</script>

	
</body>
</html>