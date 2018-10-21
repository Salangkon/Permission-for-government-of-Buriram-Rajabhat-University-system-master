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
        	$('#code').val(msg.supPositionCode);allowence
            $('#name').val(msg.subPositionName);
        	$('#a').val(msg.allowence);
        	$('#r').val(msg.rentDate);
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
					},]
				});
});//end fn ready


