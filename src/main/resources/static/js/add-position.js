function gotoUpdate(positionCode) {
	document.getElementById("xx").value = positionCode;
	var testBean  = {
		"position": $('#xx').val()
	};
	
	$.ajax({
    	type: "POST",
    	url: "/gotoUpdatePosition",
    	data: JSON.stringify(testBean),
    	contentType: "application/json; charset=utf-8",
    	dataType: "json",
    	success: function(msg) {
    		console.log('ทำงานแล้ว')
        	$('#code').val(msg.positionCode);
            $('#name').val(msg.positionName);
        	}
    	});
	};

function insertConfirm() {
		var pass = true;
		if(''==$('#positionName').val()) {
			positionName.focus()
			$('#error-positionName').removeClass("hide")
			pass = false;
		}else{
			$('#error-positionName').addClass("hide")
		}
        var position = {
        	positionName: $('#positionName').val(),
       }
       if (pass) {
        	 $.ajax({
                 type: "POST",
                 url: "/insertAddPosition",
                 contentType: "application/json; charset=utf-8",
                 data: JSON.stringify(position),
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

function status(positionCode) {
	document.getElementById("positionCode").value = positionCode;
	
	var positionStatus = {
		positionStatus : $('#positionStatus').val(),
		positionCode : $('#positionCode').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updatePositionStatus",
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
function status1(positionCode) {
	document.getElementById("positionCode1").value = positionCode;
	
	var positionStatus = {
		positionStatus : $('#positionStatus1').val(),
		positionCode : $('#positionCode1').val(),
   }
//   alert(positionStatus);
    	 $.ajax({
             type: "POST",
             url: "/updatePositionStatus",
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
	
		var table = $('#addPosition').DataTable({
//					"order": [[ 0, 'desc' ]],
					"sAjaxSource" : "/addPositionTable",
					"iDisplayLength": 50,
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "positionCode",
						"sWidth" : "60px" 
					},{
						"mData" : "positionName",
//						"sWidth" : "60px" 
					},
					{
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							return '<div align="center"><a onclick="gotoUpdate(' + "'" + full.positionCode + "'" + ')"  class="btn btn-warning" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>' + '</a></div>';
						}
					},
					{
						"mData" : "",
						"sWidth" : "60px" ,
						"mRender": function (data, type, full) {// full คือ ข้อมูลของ
							// ตาราง
							if(full.positionStatus == 0){
								return '<div align="center"><button onclick="status(' + "'" + full.positionCode + "'" + ')"  '
								+'class="btn btn-danger w3-padding-small" value="1" type="submit" id="positionStatus" > '
								+'<input id="positionCode" type="hidden" > หยุดใช้งาน ' + '</button></div>';						
							} 
							if (full.positionStatus == 1) {
								return '<div align="center"><button onclick="status1(' + "'" + full.positionCode + "'" + ')"  '
								+'class="btn btn-success w3-padding-small" value="0" type="submit" id="positionStatus1" > '
								+'<input id="positionCode1" type="hidden" > ใช้งาน ' + '</button></div></from>';
							} 	
						} 
					},]
				});
});//end fn ready


