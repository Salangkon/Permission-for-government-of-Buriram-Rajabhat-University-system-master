
<%@page import="com.hillert.model.FacultyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hillert.model.UserBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ข้อมูลคณะ มหาวิทยาลัยราชภัฏบุรีรัมย์</title>

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
	<!-- 	<link rel="stylesheet" href="/DataTables-1.10.18/css/jquery.dataTables.css"> -->
	<link rel="stylesheet" href="/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

	<script src="/js/jquery-3.3.1.min.js"></script>
<!-- 	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>	 -->
	<script src="/js/1-10-19jquery.dataTables.min.js"></script>
	<script src="/js/1-10-19dataTables.bootstrap.min.js"></script>
	<script src="/js/add-faculty.js"></script>
	<script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>


<body class="w3-light-grey w3-content" style="max-width: 100%">

	<%@include file="NavAdmin.jsp"%>

	<form name="" action="" method="post" class="modal-content w3-animate-bottom" style="width: 90%; margin-top: 3%; margin-left: 5%">
		<input type="hidden" name="userId" id="userId">
		<div class="w3-container w3-blue" align="left">
			<h2><i class="glyphicon glyphicon-folder-open w3-margin-right"></i>ข้อมูลคณะ มหาวิทยาลัยราชภัฏบุรีรัมย์</h2>
		</div>
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#Modal" style="margin: 1%">เพิ่มคณะ</button>
		<div style="overflow: auto;" >
		<div class="w3-container w3-white w3-padding-16">
			<table id="addFaculty" class="table table-striped table-bordered nowrap" style="width: 100%; margin-top: 5%;">
				<thead>
					<tr style="background: purple; color: white;">
						<th style="text-align: center">รหัสคณะ</th>
						<th style="text-align: center">คณะ</th>
						<th style="text-align: center">แกไข</th>
						<th style="text-align: center">สถานะ</th>
					</tr>
				</thead>
			</table>
		</div>
		</div>
	</form>

                <!-- Modal insert-->
                <div id="Modal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
					<form>
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มคณะ</h4>
                            </div>
                            <div class="modal-body">
                            	<div class="form-group">
                             		<label class="control-label mb-10">ชื่อคณะ</label>
                                	<input type="text" class="form-control" id="facultyName" placeholder="ชื่อคณะ" required>
                                	<div class="hide" id="error-facultyName"><label style="color: red;">กรุณากรอก ชื่อคณะ</label></div>
                           	</div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="insertConfirm()">บันทึก</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                            </div>
                        </div>
					</form>
                    </div>
                </div>
                
 				<!-- Modal update-->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ชื่อคณะ</h4>
                            </div>
                            <form name="updateAddFaculty" action="/updateAddFaculty" method="POST">
                            <div class="modal-body">
                            	<input type="hidden" name="facultyCode" id="code">
                             	<div class="form-group">
                               		<label class="control-label mb-10">ชื่อคณะ เดิม</label>
                                	<input type="text" class="form-control" id="name" name="" placeholder="ชื่อคณะ" disabled="disabled">
                                </div>
                                <div class="form-group">
                               		<label class="control-label mb-10">ชื่อคณะ ใหม่</label>
                                	<input type="text" class="form-control" id="" name="facultyName" placeholder="ชื่อคณะ" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">บันทึก</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                
	<input id="xx" type="hidden">

	<form name="logoutForm"  action="logout" 		method="post" th:hidden="true"></form>
	<form name="insertForm"  action="gotoInsert" 	method="post" th:hidden="true"></form>
	<form name="userAllForm" action="gotoUserAll" 	method="post" th:hidden="true"></form>
	<form name="RequestForm" action="gotoRequest"	method="post" th:hidden="true"></form>
	<form name="addFaculty"  	action="addFaculty" 	method="post" th:hidden= "true"></form>
	<form name="addDepartment"  action="addDepartment" 	method="post" th:hidden= "true"></form>
	<form name="addPosition"  	action="addPosition" 	method="post" th:hidden= "true"></form>
	<form name="addSubPosition" action="addSubPosition" method="post" th:hidden= "true"></form>

</body>
</html>