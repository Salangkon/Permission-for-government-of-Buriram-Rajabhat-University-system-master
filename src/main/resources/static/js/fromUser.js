$(document).ready(function() {
	
		var table = $('#userTable').DataTable({
					responsive: true,
					"lengthChange": false,
					"sAjaxSource" : "/tablePermissionUser",
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "permissionId" ,
					   "sWidth" : "20px" 
					},{
						"mData" : "goDate",
					   "sWidth" : "150px"
					}, {
						"mData" : "",
				        "sWidth" : "300px",
				        "mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<label>'+ full.sex + '</label>'+'<label>'+ full.userFname + '</label>' + '<label style="margin-left: 2mm">' + full.userLname + '</label>';
						}
					},  {
						"mData" : "topics",
					   "sWidth" : "300px" 
					}, {
						"mData" : "destinationName",
						   "sWidth" : "200px" 
					},
					{
						"mData": "",
						"sWidth" : "5px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a href="/permissionPDF/'+ full.permissionId  + '"> <span class="glyphicon glyphicon-print"></span>' + '</a></div>';

						}
					},  
					{
						"mData": "",
						"sWidth" : "5px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							if (full.permissionStatus == 0) {
				                return '<div align="center"><a href="javascript: document.permissionBack.submit()" onclick="permissionBack('+ full.permissionId  + ')" ><span class="glyphicon glyphicon-send" ></span>' + '</a></div>';
				            } else {
				            	return '<div align="center">บันทึกแล้ว</div>';
				            }				
						}
					},
					{
						"mData": "",
						"sWidth" : "5px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							if (full.permissionStatus == 0) {
								return '<div align="center">รอดำเนินการ</div>';

							} else {
								return '<div align="center"><a href="/permissionPDFBack/'+ full.permissionId  + '"> <span class="glyphicon glyphicon-print"></span>' + '</a></div>';

							}
							
						}
					}]
				});
		 new $.fn.dataTable.FixedHeader( table );
});