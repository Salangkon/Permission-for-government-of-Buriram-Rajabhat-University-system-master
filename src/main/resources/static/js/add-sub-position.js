function gotoUpdate(supPositionCode) {
	document.getElementById("xx").value = supPositionCode;
	var testBean  = {
		"subPosition": $('#xx').val()
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdateSubPosition",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
    		console.log('ทำงานแล้ว')
        	$('#code').val(msg.supPositionCode);
            $('#name').val(msg.subPositionName);
        	$('#a').val(msg.allowence);
        	$('#r').val(msg.rentDate);
        	$('#posCade').val(msg.positionCode);
        	$('#posName').val(msg.positionCode);
        	}
    	});
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
	};


function insertConfirm() {
		var pass = true;
		if(''==$('#subPositionName').val()) {
			subPositionName.focus()
			$('#error-subPositionName').removeClass("hide")
			pass = false;
		}else{
			$('#error-subPositionName').addClass("hide")
		}
		if(''==$('#allowence').val()) {
			allowence.focus()
			$('#error-allowence').removeClass("hide")
			pass = false;
		}else{
			$('#error-allowence').addClass("hide")
		}
		if(''==$('#rentDate').val()) {
			allowence.focus()
			$('#error-rentDate').removeClass("hide")
			pass = false;
		}else{
			$('#error-rentDate').addClass("hide")
		}
		if(''==$('#positionCode').val()) {
			positionCode.focus()
			$('#error-positionCode').removeClass("hide")
			pass = false;
		}else{
			$('#error-positionCode').addClass("hide")
		}
        var subPosition = {
        		subPositionName	: $('#subPositionName').val(),
        		positionCode 	: $('#positionCode').val(),
        		allowence		: $('#allowence').val(),
        		rentDate 		: $('#rentDate').val(),
       }
       if (pass) {
        	 $.ajax({
                 type: "POST",
                 url: "/insertAddSubPosition",
                 contentType: "application/json; charset=utf-8",
                 data: JSON.stringify(subPosition),
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
function status(supPositionCode) {
	document.getElementById("supPositionCode").value = supPositionCode;
	
	var subPositionStatus = {
		subPositionStatus	: $('#subPositionStatus').val(),
		supPositionCode 	: $('#supPositionCode').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updateSubPositionStatus",
             contentType: "application/json; charset=utf-8",
             data: JSON.stringify(subPositionStatus),
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

function status1(supPositionCode) {
	document.getElementById("supPositionCode1").value = supPositionCode;
	
	var subPositionStatus = {
		subPositionStatus : $('#subPositionStatus1').val(),
		supPositionCode : $('#supPositionCode1').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updateSubPositionStatus",
             contentType: "application/json; charset=utf-8",
             data: JSON.stringify(subPositionStatus),
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
	
	$.ajax({
		type : "GET",
		url : "/position",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#positionCode').append('<option value="' + msg[i].positionCode+ '">' + msg[i].positionName + '</option>');
			}
			
		}
	});
	
		var table = $('#addSubPositionTable').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addSubPositionTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "supPositionCode",
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
							return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.supPositionCode + "'" + ')"  class="btn btn-warning" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>' + '</a></div>';
						}
					},
					{
						"mData" : "",
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							if(full.subPositionStatus == 0){
								return '<div align="center"><button onclick="status(' + "'" + full.supPositionCode + "'" + ')"  '
								+'class="btn btn-danger w3-padding-small" value="1" type="submit" id="subPositionStatus"> '
								+'<input id="supPositionCode" type="hidden"> หยุดใช้งาน ' + '</button></div>';						
							} 
							if (full.subPositionStatus == 1) {
								return '<div align="center"><button onclick="status1(' + "'" + full.supPositionCode + "'" + ')"  '
								+'class="btn btn-success w3-padding-small" value="0" type="submit" id="subPositionStatus1"> '
								+'<input id="supPositionCode1" type="hidden" > เริ่มใช้งาน ' + '</button></div>';
//								return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.facultyCode + "'" + ')"  class="btn btn-success w3-padding-small" value="0"> เริ่มใช้งาน ' + '</a></div>';
							} 	
						} 
					},]
				});
});//end fn ready


