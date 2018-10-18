$(document).ready(function() {
	
	$.ajax({
		type : "GET",
		url : "/position",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#position').append('<option value="' + msg[i].positionCode+ '">' + msg[i].positionName + '</option>');
			}
			
		}
	});
	
		var table = $('#addSubPositionTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addSubPositionTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "subPositionId",
						"sWidth" : "60px" 
					},{
						"mData" : "subPositionName",
						"sWidth" : "60px" 
					},{
						"mData" : "positionName",
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


