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
					},]
				});
});//end fn ready


