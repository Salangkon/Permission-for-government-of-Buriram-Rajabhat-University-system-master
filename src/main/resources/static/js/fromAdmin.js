$(document).ready(function() {
	
		var table = $('#userTable').DataTable({
					"sAjaxSource" : "/permission",
					"order": [[ 0, 'desc' ]],
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "permissionId" ,
					   "sWidth" : "20px" 
					},{
						"mData" : "goDate",
					   "sWidth" : "100px"
					}, {
						"mData" : "",
				        "sWidth" : "300px",
				        "mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return ''+ full.sex + ''+''+ full.userFname + '' + '&nbsp;&nbsp; ' + full.userLname ;
						}
					}, {
						"mData" : "topics",
						   "sWidth" : "300px" 
						}, {
							"mData" : "destinationName",
							   "sWidth" : "200px" 
						}, {
							"mData" : "expenseEstimateSumTotalComma",
							   "sWidth" : "50px" 
						}, 
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a href="/permissionPDFAdmin/'+ full.permissionId  + '"> <span class="glyphicon glyphicon-print"></span>' + '</a></div>';

						}
					},
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full, row) {// full คือ ข้อมูลของ
							if (full.permissionStatus == 0) {
				                return '<div align="center" style="color:red">รอดำเนินการ</div>';
				            } else {
				            	return '<div align="center"><a href="/permissionPDFBackAdmin/'+ full.permissionId  + '"> <span class="glyphicon glyphicon-print"></span>' + '</a></div>';
				            }
						}
					}]
				});
});