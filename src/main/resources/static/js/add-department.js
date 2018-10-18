$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "/faculty",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				for(var i=0; i<msg.length; i++) {
					$('#faculty').append('<option value="' + msg[i].facultyCode+ '">' + msg[i].facultyName + '</option>');
				}
				
			}
		});
		var table = $('#addDepartmentTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addDepartmentTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "departmentId",
						"sWidth" : "60px" 
					},
					{
						"mData" : "departmentName",
						"sWidth" : "60px" 
					},
					{
						"mData" : "facultyName",
						"sWidth" : "60px" 
					},
					{
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
								// ตาราง
								return '<div align="center"><a href="#"> <span class="glyphicon glyphicon-edit"></span>' + '</a></div>' ;
						}
					},]
				});
});//end fn ready


