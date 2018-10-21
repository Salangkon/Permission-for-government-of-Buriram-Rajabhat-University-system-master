function gotoUpdate(facultyCode) {
	document.getElementById("xx").value = facultyCode;
	var testBean  = {
		"faculty": $('#xx').val()
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdateFaculty",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
    		console.log('ทำงานแล้ว')
        	$('#code').val(msg.facultyCode);
            $('#name').val(msg.facultyName);
        	}
    	});
	};

function insertConfirm() {
		var pass = true;
		if(''==$('#facultyName').val()) {
			facultyName.focus()
			$('#error-facultyName').removeClass("hide")
			pass = false;
		}else{
			$('#error-facultyName').addClass("hide")
		}
        var faculty = {
              facultyName: $('#facultyName').val(),
       }
       if (pass) {
        	 $.ajax({
                 type: "POST",
                 url: "/insertAddFaculty",
                 contentType: "application/json; charset=utf-8",
                 data: JSON.stringify(faculty),
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
	
		var table = $('#addFaculty').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addFacultyTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "facultyCode",
						"sWidth" : "60px" 
					},
					{
						"mData" : "facultyName",
						"sWidth" : "60px" 
					},{
						"mData" : "facultyCode",
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.facultyCode + "'" + ')"  class="btn btn-warning" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>' + '</a></div>';
						}
					},]
				});
});//end fn ready


