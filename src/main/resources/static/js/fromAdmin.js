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
						"mData" : "userFname",
				       "sWidth" : "200px" 
					}, {
						"mData" : "destinationName",
					   "sWidth" : "200px" 
					}, 
//					{
//						"mData" : "",
//						"sWidth" : "20px" ,
//						"mRender": function (data, type, full, row) {// full คือ ข้อมูลของ
//							// ตาราง
//
//							return '<a href="/gotoPerUpdate/' + full.permissionId  + '" ' + '<span class="glyphicon glyphicon-edit">Update</span>' + '</a> '+ full.permissionId + '';
//						}
//					}, 
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '';

						}
					},
					{
						"mData": "",
						"sWidth" : "20px" ,
						"mRender": function (data, type, full, row) {// full คือ ข้อมูลของ
							// ตาราง

							return '';

						}
					}]
				});
});