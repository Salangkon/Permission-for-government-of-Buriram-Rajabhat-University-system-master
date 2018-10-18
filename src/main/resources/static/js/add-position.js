$(document).ready(function() {
	
		var table = $('#addPosition').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addPositionTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "positionId",
						"sWidth" : "60px" 
					},{
						"mData" : "positionName",
//						"sWidth" : "60px" 
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


