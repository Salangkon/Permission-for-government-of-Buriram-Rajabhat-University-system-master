$(document).ready(function() {
	
		var table = $('#updateUserTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/user",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "facultyName"
					}, {
						"mData" : "departmentName"
					}, {
						"mData" : "positionName"
					}, {
						"mData" : "subPositionName"
					},
					{
						"mData": "",
						"sWidth" : "80px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง

							return '<div align="center"><a href="javascript: document.updateForm.submit()" onclick="gotoUpdate('+ full.userId  +')" class="btn btn-info "><span class="glyphicon glyphicon-search"></span></a></div>';

						}
					}]
				});
});//end fn ready