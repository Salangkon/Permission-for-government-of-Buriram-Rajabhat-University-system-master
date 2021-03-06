$(document).ready(function() {
	
		var table = $('#userTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/user",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					dom: 'Bfrtip',
					buttons: [
						'copy', 'csv', 'excel', 'pdf', 'print'
					],
					"aoColumns" : [{
						"mData" : "userUsername",
						"sWidth" : "150px" 
					}, {
						"mData" : "",
						"sWidth" : "600px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
								// ตาราง
								return full.sex + full.userFname ;
						}
					}, {
						"mData" : "userLname",
						"sWidth" : "600px" 
					}, 
					{
						"mData" : "",
						"sWidth" : "80px" ,
						"mRender" : function(data, type, row, index) {
							if (row.role == '1') {
								return '<div align="center"> <label style="color:blue" > ผู้ดูแลระบบ</label></div>';
							} else if (row.role == '2') {
								return '<div align="center"> <label style="color:green" > รับราชการ </label></div>';
		                	}
							else if (row.role == '3') {
								return '<div align="center"> <label style="color:red"   >ออกราชการ</label></div>';
		                	}
						}
					},
					{
						"mData": "",
						"sWidth" : "80px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง

							return '<div align="center"><a onclick="gotoUpdate('+ full.userId  +')" class="btn btn-info "><span class="glyphicon glyphicon-search"></span></a></div>';

						}
					}]
				});
});//end fn ready


