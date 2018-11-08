$(document).ready(function() {
	
	$.ajax({
		type : "POST",
		url : "/userUpdateStory",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			$('#fNameV').val(msg.userFname);
			$('#lNameV').val(msg.userLname);
			$('#password').val(msg.userPassword);
			$('#sexV').val(msg.sex);
			$('#phone').val(msg.numberPhone);
		}
	});
	
	//ข้อมูลบุคคลากร คณะ สาขา ตำแหน่ง ระดับ
	var table = $('#userPersonnelTable').DataTable({
		"searching"	  : false, 
	    "lengthChange": false,
		"bInfo" : false,
		"ordering": false,
		"sAjaxSource" : "/userPersonnel",
		"sAjaxDataProp" : "",
		"aoColumns" : [ {
			"mData" : "facultyName"
		}, {
			"mData" : "departmentName"
		}, {
			"mData" : "positionName"
		}, {
			"mData" : "subPositionName"
		}
		]
	});
	
	//ข้อมูลบุคคลากร คณะ สาขา ตำแหน่ง ระดับ
	var table = $('#userPersonnelTableUpdate').DataTable({
		"searching"	  : false, 
	    "lengthChange": false,
		"bInfo" : false,
		"ordering": false,
		"sAjaxSource" : "/userPersonnel",
		"sAjaxDataProp" : "",
		"aoColumns" : [ {
			"mData" : "facultyName"
		}, {
			"mData" : "departmentName"
		}, {
			"mData" : "positionName"
		}, {
			"mData" : "subPositionName"
		},{
			"mData": "",
			"sWidth" : "80px" ,
			"mRender": function (data, type, full) {// full คือ ข้อมูลของ
				// ตาราง
				return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.personnelId + "'" + ')" class="btn btn-info" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-search"></span></a></div>';

			}
		}]
	});
});//end Ready

function gotoUpdate(PersonnelId) {
	document.getElementById("xx").value = PersonnelId;
	var testBean  = {
		"personnelId": $('#xx').val()
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdatePLUser",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
    		console.log('ทำงานแล้ว')
        	$('#personnel').val(msg.personnelId);
            $('#name').val(msg.facultyName);
        	}
    	});
	
	};
