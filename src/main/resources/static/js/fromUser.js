$(document).ready(function() {
	
		var table = $('#userTable').DataTable({
					"lengthChange": false,
					"sAjaxSource" : "/permissionCreareBy",
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "permissionId" ,
					   "sWidth" : "20px" 
					},{
						"mData" : "goDate",
					   "sWidth" : "100px"
					}, {
						"mData" : "",
				        "sWidth" : "200px",
				        "mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<label>'+ full.userFname + '</label>' + '<label style="margin-left: 2mm">' + full.userLname + '</label>';
						}
					},  {
						"mData" : "topics",
					   "sWidth" : "200px" 
					}, {
						"mData" : "destinationName",
						   "sWidth" : "200px" 
					},
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a href="/permissionPDF/'+ full.permissionId  + '"> <span class="glyphicon glyphicon-print"></span>' + '</a></div>';

						}
					},  
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a href="javascript: document.permissionBack.submit()" onclick="permissionBack('+ full.permissionId  + ')" ><span class="glyphicon glyphicon-send" ></span>' + '</a></div>';

						}
					}]
				});
});