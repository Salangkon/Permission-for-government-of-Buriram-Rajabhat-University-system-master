function gotoUpdate(departmentCode) {
	document.getElementById("xx").value = departmentCode;
	var testBean  = {
		"department": $('#xx').val()
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdateDepartment",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
    		console.log('ทำงานแล้ว')
        	$('#code').val(msg.departmentCode);
            $('#name').val(msg.departmentName);
        	}
    	});
	};

function insertConfirm() {
		var pass = true;
		if(''==$('#departmentName').val()) {
			departmentName.focus()
			$('#error-departmentName').removeClass("hide")
			pass = false;
		}else{
			$('#error-departmentName').addClass("hide")
		}
		if(''==$('#facultyCode').val()) {
			facultyCode.focus()
			$('#error-facultyCode').removeClass("hide")
			pass = false;
		}else{
			$('#error-facultyCode').addClass("hide")
		}
        var department = {
        		departmentName: $('#departmentName').val(),
        		facultyCode : $('#facultyCode').val(),
       }
       if (pass) {
        	 $.ajax({
                 type: "POST",
                 url: "/insertAddDepartment",
                 contentType: "application/json; charset=utf-8",
                 data: JSON.stringify(department),
                 dataType: "json",
                 success: function(msg) {
                     console.log("success")
                     window.location.reload();
                 },
                 error: function() {
                     console.log("error")
                     $('#Modal').modal('hide')
                     window.location.reload();
                 }
             });
         }	
        }//end insertConfirm
               

$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "/faculty",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				console.log('Success')
				for(var i=0; i<msg.length; i++) {
					$('#facultyCode').append('<option value="' + msg[i].facultyCode+ '">' + msg[i].facultyName + '</option>');
				}
				
			}
		});
		var table = $('#addDepartmentTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addDepartmentTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "departmentCode",
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
							return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.departmentCode + "'" + ')"  class="btn btn-warning" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>' + '</a></div>';
						}
					},]
				});
});//end fn ready


