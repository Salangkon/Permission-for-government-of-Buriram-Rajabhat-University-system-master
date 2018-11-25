function gotoUpdate(facultyCode) {
	document.getElementById("xx").value = facultyCode;
	var testBean  = {
		"faculty": $('#xx').val(),
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdateFaculty",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
//    		console.log('ทำงานแล้ว')
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
               
function status(facultyCode) {
	document.getElementById("facultyCode").value = facultyCode;
	
	var positionStatus = {
		facultyStatus : $('#facultyStatus').val(),
		facultyCode : $('#facultyCode').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updateFacultyStaus",
             contentType: "application/json; charset=utf-8",
             data: JSON.stringify(positionStatus),
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
    }//end insertConfirm
function status1(facultyCode) {
	document.getElementById("facultyCode1").value = facultyCode;
	
	var positionStatus = {
		facultyStatus : $('#facultyStatus1').val(),
		facultyCode : $('#facultyCode1').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updateFacultyStaus",
             contentType: "application/json; charset=utf-8",
             data: JSON.stringify(positionStatus),
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
					},
					{
						"mData" : "",
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							if(full.facultyStatus == 0){
								return '<div align="center"><button onclick="status(' + "'" + full.facultyCode + "'" + ')"  '
								+'class="btn btn-danger w3-padding-small" value="1" type="submit" id="facultyStatus"> '
								+'<input id="facultyCode" type="hidden"> หยุดใช้งาน ' + '</button></div>';						
							} 
							if (full.facultyStatus == 1) {
								return '<div align="center"><button onclick="status1(' + "'" + full.facultyCode + "'" + ')"  '
								+'class="btn btn-success w3-padding-small" value="0" type="submit" id="facultyStatus1"> '
								+'<input id="facultyCode1" type="hidden" > เริ่มใช้งาน ' + '</button></div>';
//								return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.facultyCode + "'" + ')"  class="btn btn-success w3-padding-small" value="0"> เริ่มใช้งาน ' + '</a></div>';
							} 	
						} 
					},]
				});
});//end fn ready



