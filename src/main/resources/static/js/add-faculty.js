$(document).ready(function() {
	
		var table = $('#addFaculty').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addFacultyTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "facultyId",
						"sWidth" : "60px" 
					},
					{
						"mData" : "facultyName",
						"sWidth" : "60px" 
					},{
						"mData" : "facultyId",
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
								// ตาราง
								return '<div align="center"><a href="#"> <span class="glyphicon glyphicon-edit"></span>' + '</a></div>' ;
						}
					},]
				});
});//end fn ready


