
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hillert.model.UserBean"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<title>Insert to users.</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="/css/w3.css">
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/NewFile.css">
	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css">

	<script src="/js/jQuery v3.3.1.js"></script>
	<script src="/js/insertUser.js"></script>
<!-- 	<script src="/js/alertInsert.js"></script> -->
	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">var dataSet = []</script>

	<script type="text/javascript">
		//กรอกได้เฉพราะ ตัวเลข
		function chkNumber(ele)
		{
		var vchar = String.fromCharCode(event.keyCode);
		if ((vchar<'0' || vchar>'9') && (vchar != '.')) return false;
		ele.onKeyPress=vchar;
		}
	</script>
<%
	UserBean bean = null;
	String result = "";
	%>
	<%
	bean = (UserBean) request.getSession().getAttribute("userBean");
	result = (String) request.getAttribute("messes");
	%>


</head>
<body class="w3-light-grey w3-content" style="max-width:100%" >

	<%@include file="NavAdmin.jsp" %>

<!-- <form action="nserOK" onsubmit="return insertConfirm()" name=""  method="post"> -->

	<div class="container w3-animate-opacity" >
		<div class="panel panel-primary" style="margin-top: 5%;" >
			<div class="panel-heading" >Welcome to register.</div>
			<% if (result.equals("S")) { %>
					<div class="alert alert-success" align="center">
					<strong>บันทึก </strong> เรียบร้อย
				</div>
				<% } else if (result.equals("F")) { %>
					<div class="alert alert-danger" align="center">
						<strong>บันทึก ล้มเหล้ว</strong> กรุณาลองอีกครั้ง !!
					</div>
			<% } %>
			<div class="panel-body">

				<div style="size: 10" class="col-sm-6" >
	
					<div class="col-sm-9">
						<div class="form-group">
							<label for="exampleInputEmail1">UserName</label> 
							<input type="text" min="10" maxlength="12" class="form-control" name="userUsername" id="userUsername" required> 
							<label for="exampleInputEmail1" id="check"> </label>
							
						</div>
					</div>
			<div class="col-sm-3">
				<div class="form-group" style="margin-top: 1mm"><br>
					<button type="button" class="btn btn-info" onclick="check()"> ตรวจสอบ </button>
				</div>
			</div>
			
			<div class="col-sm-9">
				<div class="form-group">
					<label for="exampleInputEmail1">Password</label> <input type="text"
					class="form-control" name="userPassword" id="userPassword" required>	
					
				</div>
			</div>
			<div style="size: 10" class="col-sm-3"> 
				<div class="form-group">
					<label for="exampleFormControlSelect1">สิทธิ์</label>
					<select name="role" id="role" class="form-control">
						<option value="2">USER</option>
						<option value="1">ADMIN</option>
					</select>
				</div>
			</div>
			
			<div class="col-sm-6" >
				<label> คำนำหน้า </label>
				<div class="form-group">
					<input name="sex" id="sex1" type="radio"  style="margin-left: 2%"><label style="margin-left: 2%">นาย    	 </label>
        			<input name="sex" id="sex2" type="radio"  style="margin-left: 2%"><label style="margin-left: 2%">นาง		 </label>	
        			<input name="sex" id="sex3" type="radio"  style="margin-left: 2%"><label style="margin-left: 2%">นางสาว</label>
        			<input name="sex" type="radio"  style="margin-left: 2%" ><label style="margin-left: 2%">อื่นๆ</label>
        		</div>
			</div>
				
			<div class="col-sm-6" >
				<label> คำนำหน้าอื่นๆ </label>
				<div class="form-group" >
					<input type="text"  id="sex4" class="form-control" placeholder="กรุณากรอก">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-6">
					<label for="exampleInputEmail1">ชื่อ</label> <input type="text"
					class="form-control" id="userFname" name="userFname" placeholder="ชื่อ" required>
					
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
					<label for="exampleInputEmail1">นามสกุล</label> <input type="text"
					class="form-control" id="userLname" name="userLname" placeholder="นามสกุล" required>
				</div>
			</div>

			<div style="size: 10" class="col-sm-6"> 
				<div class="form-group"><label> วันเข้ารับราชการ </label>
					<input class="form-control" type='date' id="setdate" required>
				</div> 
			</div>
			
						
			<div style="size: 10" class="col-sm-6"> 
				<div class="form-group">
					<label for="exampleFormControlSelect1">หมายเลขโทรศัพท์</label>
					<input class="form-control" type="text" id="numberPhone" maxlength="10" max="10" OnKeyPress="return chkNumber(this)">
					
				</div>
			</div>
		</div>

	
		<div style="size: 10" class="col-sm-6" >   
			<!-- คณะ  faculty -->
			<div class="form-group">
				<label for="exampleFormControlSelect1">คณะ</label> 
				<select class="form-control" name="" id="faculty">
					<option value="faculty">== กรุณาเลือก ==</option>
				</select>
			</div>
			<!-- ภาควิชา  department -->
			<div class="form-group">
				<label for="exampleFormControlSelect1">ภาควิชา</label>
				<select class="form-control" name="" id="departmentCode">
					<option value="departmentCode">== กรุณาเลือก ==</option>
				</select>
			</div>
			<!-- ตำแหน่ง  position -->
			<div class="form-group">
				<label for="exampleFormControlSelect1">ตำแหน่ง</label> 
				<select class="form-control" name="" id="position">
					<option value="position">== กรุณาเลือก ==</option>
				</select>
			</div>
			<!-- ระดับ supPosition -->
			<div class="form-group">
				<label for="exampleFormControlSelect1">ภาควิชา</label>
				<select class="form-control" name="" id="subPositionCode">
					<option value="subPositionCode">== กรุณาเลือก ==</option>
				</select>
			</div>
			<div align="right">
				เพิ่มเข้าตาราง (เพื่อยืนยัน) <button type="button" class="btn btn-info" id="addPosition">เพิ่ม</button>
			</div>
			<br>

		</div>
		<table id="addPersonnel" class="table table-bordered" style="width: 100%;background-color: yellow;">
			<thead>
				<tr>
					<th>คณะ</th>
					<th>สาขา</th>
					<th>ตำแหน่ง</th>
					<th>ระดับ</th>
					<th>ลบ</th>
				</tr>
			</thead>
		</table>
		<div class="alert alert-success" class="col-sm-12" align="center">	
			<button type="button" class="btn btn-success" id="save" >ยืนยัน</button>
			<button type="button" onclick="window.location.href='/gotoUserAll'" class="btn btn-danger">ยกเลิก</button>
		</div>
		
<!-- 		<div class="alert alert-success" class="col-sm-12" align="center">	 -->
<!-- 			<button type="submit" class="btn btn-success">ยืนยัน</button> -->
<!-- 			<button type="reset" class="btn btn-danger">รีเซต</button> -->
<!-- 		</div> -->

	</div>
</div>
</div>
<!-- </form> -->

<form name="logoutForm"   action="logout" 	    method="post" th:hidden= "true"></form>
<form name="insertForm"   action="gotoInsert"   method="post" th:hidden= "true"></form>
<form name="userAllForm"  action="gotoUserAll"  method="post" th:hidden= "true"></form>
<form name="RequestForm"  action="gotoRequest"  method="post" th:hidden= "true"></form>

</body>

</html>


