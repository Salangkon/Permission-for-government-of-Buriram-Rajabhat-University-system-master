<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- ดูข้อมูลส่วนตัว-->
	<header class="w3-display-container w3-content">
	<div id="id05" class="modal">
		<form class="modal-content animate" action="" style="max-width: 95%; margin-top: 5%; margin-left: 25%; margin-right: 10%">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-address-card-o w3-margin-right"></i>
					ข้อมูลส่วนบุคคล
				</h2>

			</div>
			<div class="w3-container w3-white w3-padding-16">
				<!-- Page Container -->
				<div class="w3-container w3-content"
					style="max-width: 1400px; margin-top: 20px">
					<!-- Profile -->

					<div class="w3-container"
						style="padding: 10mm; background-color: white;">
						<div class="col-sm-2">
							<label>ชื่อ-นามสกุล : </label>
						</div>
						<div class="col-sm-7">
							<label style="margin-left: 2mm"> <%=bean.getSex()%><%=bean.getUserFname()%></label><label style="margin-left: 2mm"> <%=bean.getUserLname()%></label>
						</div>
						<div class="col-sm-3">สถานะ : 
							<label style="color: green;"> <%if (bean.getRole() == 1) {out.print("รับราชการ");} else if (bean.getRole() == 2) {out.print("รับราชการ");}%>
							</label> <label style="color: red;"> <%if (bean.getRole() == 3) {out.print("ออกราชการ");}%>
							</label>
						</div>
						<hr>
						<div class="col-sm-2">
							<label>เบอร์มือถือ :</label>
						</div>
						<div class="col-sm-10">
							<label style="margin-left: 2mm"> <%if (bean.getNumberPhone() != null) {out.print(bean.getNumberPhone());}%>
							</label>
						</div>
						<div class="col-sm-12" style="margin-top: 5%;overflow: auto;" >
							<table class="w3-table-all w3-hoverable" id="userPersonnelTable" style="width: 100%">
								<thead>
									<tr>
										<th style="background-color: yellow;">คณะ</th>
										<th style="background-color: yellow;">สาขา</th>
										<th style="background-color: yellow;">ตำแหน่ง</th>
										<th style="background-color: yellow;">ระดับ</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div align="right">
					<button type="button"
						onclick="document.getElementById('id05').style.display='none'"
						class="btn btn-danger">ปิด</button>
				</div>
			</div>
		</form>
	</div>
	</header>

	<script>
	<!-- ดูข้อมูลส่วนตัว-->
		var modal = document.getElementById('id05');

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>