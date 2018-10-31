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
<title>ข้อมูลสาขา มหาวิทยาลัยราชภัฏบุรีรัมย์</title>

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

	<script src="/js/jquery-3.3.1.min.js"></script>
<!-- 	<script src="/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>	 -->
	<script src="/js/1-10-19jquery.dataTables.min.js"></script>
	<script src="/js/1-10-19dataTables.bootstrap.min.js"></script>
	<script src="/js/add-department.js"></script>
	<script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>


<body class="w3-light-grey w3-content" style="max-width: 100%">

	<%@include file="NavAdmin.jsp"%>

	<form name="welcome" action="#" method="post" class="modal-content w3-animate-bottom" style="width: 90%; margin-top: 3%; margin-left: 5%">
		<input type="hidden" name="userId" id="userId">
		<div class="w3-container w3-blue" align="left">
			<h2><i class="glyphicon glyphicon-folder-open w3-margin-right"></i>ข้อมูลสาขา มหาวิทยาลัยราชภัฏบุรีรัมย์</h2>
		</div>
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#Modal" style="margin: 1%">เพิ่มสาขา</button>
		<div style="overflow: auto;" >
		<div class="w3-container w3-white w3-padding-16">
			<table id="addDepartmentTable" class="table table-striped table-bordered nowrap" style="width: 100%; margin-top: 5%;">
				<thead>
					<tr style="background: purple; color: white;">
						<th style="text-align: center">รหัสสาขา</th>
						<th style="text-align: center">สาขา</th>
						<th style="text-align: center">คณะ</th>
						<th style="text-align: center">แก้ไข</th>
					</tr>
				</thead>
			</table>
		</div>
		</div>
	</form>
	
                <!-- Modal -->
                <div id="Modal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
					<form>
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มสาขา</h4>
                            </div>
                            <div class="modal-body">
                            	<div class="form-group">
                             		<label class="control-label mb-10">ชื่อสาขา</label>
                                	<input type="text" class="form-control" id="departmentName" placeholder="ชื่อคณะ" required>
                                	<div class="hide" id="error-departmentName"><label style="color: red;">กรุณากรอก ชื่อสาขา</label></div>
                           	</div> 
                           	<div class="form-group">
								<label for="exampleFormControlSelect1">คณะ</label> 
								<select class="form-control" name="" id="facultyCode">
									<option value="">== กรุณาเลือก ==</option>
								</select>
								<div class="hide" id="error-facultyCode"><label style="color: red;">กรุณากรอก เลือกคณะ</label></div>
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
                                <h4 class="modal-title">แก้ชื่อสาขา</h4>
                            </div>
                            <form name="updateAddDepartment" action="/updateAddDepartment" method="POST">
                            <div class="modal-body">
                            	<input type="hidden" name="departmentCode" id="code">
                             	<div class="form-group">
                               		<label class="control-label mb-10">ชื่อสาขา เดิม</label>
                                	<input type="text" class="form-control" id="name" name="departmentName" placeholder="ชื่อสาขา" required disabled="disabled">
                                </div>
                                <div class="form-group">
                        			<label class="control-label mb-10">ชื่อสาขา ใหม่</label>
                                	<input type="text" id="" name="departmentName" placeholder="ชื่อสาขา" required class="w3-input w3-border w3-hover-blue">
                                </div>
                                <div class="form-group">
									<label class="control-label mb-10">ชื่อคณะ เดิม</label>
                                	<input type="text" class="form-control" id="depName" placeholder="ชื่อคณะ" required disabled="disabled">
                                </div>
                                <div class="form-group">
									<label for="exampleFormControlSelect1">ชื่อคณะ ใหม่</label> 
									<select class="form-control" name="facultyCode" id="faculty" required>
										<option value="">== กรุณาเลือก ==</option>
									</select>
								<div class="hide" id="error-facultyCode"><label style="color: red;">กรุณากรอก เลือกคณะ</label></div>
							</div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">บันทึก แก้ไข</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                
	<input id="departmentCode" type="hidden">

                
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