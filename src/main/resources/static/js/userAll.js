$(document).ready(function() {
	
		var table = $('#userTable').DataTable({
						responsive: true,
					"sAjaxSource" : "/user",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
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
								return '<div align="center"> <label style="color:green" > รับราชการ </label></div>';
							} else if (row.role == '2') {
								return '<div align="center"> <label style="color:green" > รับราชการ </label></div>';
		                	}
							else if (row.role == '3') {
								return '<div align="center"> <label style="color:red"   >ออกราชการ</label></div>';
		                	}
						}
					},
//					{
//						"mData": "",
//						"sWidth" : "80px" ,
//						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
//							// ตาราง
//
//							return '<div align="center"><a href="/gotoUpdate/' + full.userId + '" class="btn btn-info "><span class="glyphicon glyphicon-search"></span></a></div>';
//
//						}
//					}
					{
						"mData": "",
						"sWidth" : "80px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง

							return '<div align="center"><a href="javascript: document.updateForm.submit()" onclick="gotoUpdate('+ full.userId  +')" class="btn btn-info "><span class="glyphicon glyphicon-search"></span></a></div>';

						}
					}]
				});
		new $.fn.dataTable.FixedHeader( table );
});//end fn ready


