
var sex = "";

$(document).ready(function() {	
	
	$("#sex1").change(function(){
		sex = "นาย";
	});
	$("#sex2").change(function(){
		sex = "นาง";
	});
	$("#sex3").change(function(){
		sex = "นางสาว";
	});
	$("#sex4").change(function(){
		sex = $('#sex4').val();
	});
	
	$('#save').click(function(){
		console.log("");
		var d ;
		var inputdata = [];
		for (var i = 0; i < tableSelect.data().length; i++) {
			d = tableSelect.data()[i];
			console.log(d);
			inputdata.push(d);
		}
		var pass = true;
		
		pass = validateInput();

		var userBean = {
				userUsername : $('#userUsername').val(),
				userPassword : $('#userPassword').val(),
				sex  		 : sex,
				userFname    : $('#userFname').val(),
				userLname    : $('#userLname').val(),	
				numberPhone  : $('#numberPhone').val(),
				dateStr		 : $('#setdate').val(),
				role         : $('#role').val(),
				plBean       : inputdata
		}

		if(pass) {
			$.ajax({
		        type: "POST",
		        url: "/insertUser",
		        data: JSON.stringify(userBean),
		        dataType: "json",
		        async: false,
		        contentType: "application/json; charset=utf-8",
		        success: function (res) {
		        	console.log(res)
		        	window.location.href = res.page;
		        },
			 	error: function () {
			 		window.location.href = "nser";	
			    }
			});
		}
		
	});//and userBaan
	
	$('#addPosition').click(function() {	
		 var newRegister = {
		 	faculty 		: $('#faculty').val(),
		 	departmentCode 	: $('#departmentCode').val(),
		 	position   		: $('#position').val(),
		 	subPositionCode : $('#subPositionCode').val()
	}
		
		dataSet.push(newRegister);
		var tableSelect = $('#addPersonnel').DataTable().row.add(newRegister).draw();
		
	});
	$('#addPersonnel').on('click', 'a', function() {
		tableSelect.row( $(this).parents('tr') ).remove().draw();
		var num = $('#addPersonnel').DataTable().rows().data().length;
		
	});
	

	

//Drop Dawn คณะ และ สังกีด 
$.ajax({
	type : "GET",
	url : "/faculty",
	contentType : "application/json; charset=utf-8",
	dataType : "json",
	success : function(msg) {
		console.log('Success')
		for(var i=0; i<msg.length; i++) {
			$('#faculty').append('<option value="' + msg[i].facultyCode+ '">' + msg[i].facultyName + '</option>');
		}
		
	}
});
$('#faculty').change(function () {
	$('#departmentCode').empty();
	var faculty = { "faculty" :  $('#faculty').val()};
	
	$.ajax({
		type : "POST",
		url : "/department",
		data: JSON.stringify(faculty) ,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			$('#departmentCode').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
			for(var i=0; i<msg.length; i++) {
				$('#departmentCode').append('<option value="' + msg[i].departmentCode+ '">' + msg[i].departmentName + '</option>');
			}
			
		}
	});
});//end faculty

// Drop Dawn ตำแหน่ง และ ระดับ
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
$('#position').change(function () {
	$('#subPositionCode').empty();
	var position = { "position" :  $('#position').val()};
	
	$.ajax({
		type : "POST",
		url : "/subPosition",
		data: JSON.stringify(position) ,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			$('#subPositionCode').append('<option value="'+'">' + "== กรุณาเลือก ==" + '</option>');
			for(var i=0; i<msg.length; i++) {
				$('#subPositionCode').append('<option value="' + msg[i].subPositionId+ '">' + msg[i].subPositionName + '</option>');
			}
			
		}
	});
});//end position
	


var tableSelect = $('#addPersonnel').DataTable({
	"searching": false, 
    "lengthChange": false,
	"sAjaxDataProp" : "",
	"aoColumns" : [
		{"mData" : "faculty",
		"mRender" : function(data, type, row, index) {
			if (row.faculty == '1') {
                return 'คณะครุศาสตร์';
            } else if (row.faculty == '2') {
                return 'คณะวิทยาศาสตร์';
            } else if (row.faculty == '3') {
                return 'คณะมนุษยศาสตร์และสังคมศาสตร์';
            } else if (row.faculty == '4') {
                return 'คณะวิทยาการจัดการ';
            } else if (row.faculty == '5') {
                return 'คณะเทคโนโลยีอุตสาหกรรม';
            } else if (row.faculty == '6') {
                return 'คณะเทคโนโลยีการเกษตร';
            }
			}
		},
		{"mData" : "departmentCode",
		"mRender" : function(data, type, row, index) {
			if (row.departmentCode == '1') {
                return 'สาขาวิชาเทคโนโลยีและนวัตกรรมศึกษา';
            } else if (row.departmentCode == '2') {
                return 'สาขาวิชาเทคโนโลยีและคอมพิวเตอร์เพื่อการศึกษา';
            } else if (row.departmentCode == '3') {
                return 'สาขาวิชาภาษาไทย';
            } else if (row.departmentCode == '4') {
                return 'สาขาวิชาภาษาอังกฤษ';
            } else if (row.departmentCode == '5') {
                return 'สาขาวิชาการศึกษาปฐมวัย';
            } else if (row.departmentCode == '6') {
                return 'สาขาวิชาสังคมศึกษา';
            }else if (row.departmentCode == '7') {
                return 'สาขาวิชาคณิตศาสตร์';
            } else if (row.departmentCode == '8') {
                return 'สาขาวิชาฟิสิกส์';
            } else if (row.facdepartmentCodeulty == '9') {
                return 'สาขาวิชาวิทยาศาสตร์ทั่วไป';
            } else if (row.departmentCode == '10') {
                return 'สาขาวิชาพลศึกษา';
            } else if (row.departmentCode == '11') {
                return 'สาขาวิชาดนตรีศึกษา';
            }else if (row.departmentCode == '12') {
                return 'สาขาวิชาศิลปะศึกษา';
            } else if (row.departmentCode == '13') {
                return 'สาขาวิชานาฏสิลป์';
            } else if (row.departmentCode == '14') {
                return 'สาขาวิชาวิจัยและประเมิลผลการศึกษา';
            } else if (row.departmentCode == '15') {
                return 'สาขาวิชาบริหารการศึกษา';
            } else if (row.departmentCode == '16') {
                return 'สาขาวิชาหลักสูตรและรียนการสอน';
            }else if (row.departmentCode == '17') {
                return 'สาขาวิชาดนตรีศึกษา (ป.ตรี)';
            } else if (row.departmentCode == '18') {
                return 'สาขาวิชาคณิตศาสตร์';
            } else if (row.departmentCode == '19') {
                return 'สาขาวิชาเคมี';
            } else if (row.departmentCode == '20') {
                return 'สาขาวิชาฟิสิกส์';
            } else if (row.departmentCode == '21') {
                return 'สาขาวิชาชีววิทยา';
            }else if (row.departmentCode == '22') {
                return 'สาขาวิชาสถิติประยุกต์';
            } else if (row.departmentCode == '23') {
                return 'สาขาวิชาวิทยาศาสตร์การกีฬา';
            } else if (row.departmentCode == '24') {
                return 'สาขาวิชาวิทยาการคอมพิวเตอร์';
            } else if (row.departmentCode == '25') {
                return 'สาขาวิชาวิทยาศาสตร์สิ่งทอ';
            } else if (row.departmentCode == '26') {
                return 'สาขาวิชาสาธารสุขชุมชน';
            }else if (row.departmentCode == '27') {
                return 'สาขาวิชาภูมิสาสตร์และภูมิสารสนเทศ';
            } else if (row.departmentCode == '28') {
                return 'สาขาวิชาวิทยาศาสตร์สิ่งแวดล้อม';
            } else if (row.departmentCode == '29') {
                return 'สาขาวิชาเทคโนโลยีสารสนเทศ';
            } else if (row.departmentCode == '30') {
                return 'สาขาวิชาภาษาไทย ศศ.บ';
            } else if (row.departmentCode == '31') {
                return 'สาขาวิชาภาษาอังกฤษ';
            }else if (row.departmentCode == '32') {
                return 'สาขาวิชาภาษาอังกฤษธุรกิจ';
            } else if (row.departmentCode == '33') {
                return 'สาขาวิชานิติศาสตร์';
            } else if (row.departmentCode == '34') {
                return 'สาขาวิชารัฐศาสนศาสตร์';
            } else if (row.departmentCode == '35') {
                return 'สาขาวิชาการพัฒนาสังคม';
            } else if (row.departmentCode == '36') {
                return 'สาขาวิชาดนตร์';
            }else if (row.departmentCode == '37') {
                return 'สาขาวิชาบรรณารักษศาสตร์';
            } else if (row.departmentCode == '38') {
                return 'สาขาวิชาศิลปะดิจิทัล';
            } else if (row.departmentCode == '39') {
                return 'สาขาวิชาการตลาด';
            } else if (row.departmentCode == '40') {
                return 'สาขาวิชาบัญชี';
            } else if (row.departmentCode == '41') {
                return 'สาขาวิชาการจัดการ';
            }else if (row.departmentCode == '42') {
                return 'สาขาวิชาเศรษฐศาสตร์';
            } else if (row.departmentCode == '43') {
                return 'สาขาวิชาคอมพิวเตอร์ธุระกิจ';
            } else if (row.departmentCode == '44') {
                return 'สาขาวิชาการสื่อสารมวลชน';
            } else if (row.departmentCode == '45') {
                return 'สาขาวิชาการเงินและการธนาคาร';
            } else if (row.departmentCode == '46') {
                return 'สาขาวิชาบริหารทรัพยากรมนุษย์';
            }else if (row.departmentCode == '47') {
                return 'สาขาวิชาการท่องเที่ยวและการโรงแรม';
            } else if (row.departmentCode == '48') {
                return 'สาขาวิชาเศรษฐศาสตร์ มหาบัณฑิต(ป.โท)';
            } else if (row.departmentCode == '49') {
                return 'สาขาวิชาเทคโนโลยีวิศวะกรรมโยธา';
            }else if (row.departmentCode == '50') {
                return 'สาขาวิชาเทคโนโลยีสถาปัตยกรรม';
            } else if (row.departmentCode == '51') {
                return 'สาขาวิชาเทคโนโลยีวิศวกรรมไฟฟ้า';
            } else if (row.departmentCode == '52') {
                return 'สาขาวิชาวิศวกรรมการจัดการอุตสาหกรรม';
            } else if (row.departmentCode == '53') {
                return 'สาขาวิชาเทคโนโลยีออกแบบผลิตภัณฑ์อุตสาหกรรม';
            } else if (row.departmentCode == '54') {
                return 'สาขาวิชาเทคโนโลยีเซรามิกส์และการออกแบบ';
			}else if (row.departmentCode == '55') {
                return 'สาขาวิชาประมง';
            } else if (row.departmentCode == '56') {
                return 'สาขาวิชาเกษตร';
            } else if (row.departmentCode == '57') {
                return 'สาขาวิชาสัตวศาสตร์';
            }
			}
		},
		{"mData" : "position",
		"mRender" : function(data, type, row, index) {
			if (row.position == '1') {
        	    return 'ตำเเหน่งวิชาการ';
            } else if (row.position == '2') {
                return 'ตำเเหน่งบริหาร';
            } else if (row.position == '3') {
                    return 'ตำเเหน่งวิชาชีพเฉพาะ';
            } else if (row.position == '4') {
                return 'ตำเเหน่งทั่วไป';
            } 
			}	
		},
		{"mData" : "subPositionCode",
		"mRender" : function(data, type, row, index) {
			if (row.subPositionCode == '1') {
                return 'ศาสตร์ตราจารย์';
            } else if (row.subPositionCode == '2') {
                return 'รองศาสตร์ตราจารย์';
            } else if (row.subPositionCode == '3') {
                return 'ผู้ช่วยศาสตราจารย์ ';
            } else if (row.subPositionCode == '4') {
                return 'อธิการบดี';
            } else if (row.subPositionCode == '5') {
                return 'รองอธิการบดี';
            } else if (row.subPositionCode == '6') {
                return 'คณะบดี';
            }else if (row.subPositionCode == '7') {
                return 'หัวหน้าหน่วยงาน';
            } else if (row.subPositionCode == '8') {
                return 'ผู้ช่วยอธิการบดี';
            } else if (row.subPositionCode == '9') {
                return 'รองคณะบดี';
            } else if (row.subPositionCode == '10') {
                return 'ผู้อำนวยการสำนักงานอธิการบดี';
            } else if (row.subPositionCode == '11') {
                return 'เชียวชาญพิเศษ';
            }else if (row.subPositionCode == '12') {
                return 'เชียวชาญ';
            } else if (row.subPositionCode == '13') {
                return 'ชำนาญการพิเสษ';
            } else if (row.subPositionCode == '14') {
                return 'ชำนาญการ';
            } else if (row.subPositionCode == '15') {
                return 'ปฏิบัตการ';
            } else if (row.subPositionCode == '16') {
                return 'ชำนาญงานพิเศษ';
            }else if (row.subPositionCode == '17') {
                return 'ชำนาญงาน';
            } else if (row.subPositionCode == '18') {
                return 'ปฏิบัติงาน';
            }	
		}
		},
		{
			"mData" : "",
			"sWidth" : "10px" ,
			"mRender" : function(data,
				type, row, index) {
			return '<a class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></a>';
			}										
	}]
});
	
$('#checkUser').click(check)
});//end function ready

function check() {																
	$('#check').empty();
	
	$('#userUsername').ready(function () {	
		
		var testAjex = { "userName": $('#userUsername').val()};		
		$.ajax({
			type: "POST",
			url: "/checkId",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(testAjex),
			dataType: "json",
			success: function (msg) {				
				if(msg.userUsername != null){					 
					 $('#check').append('<div style="color: red;"><strong>กรอกรหัสใหม่ !!! </strong> มีการใช้งานเเล้ว...</div>');
				}
				else if(msg.userUsername == null){					 		
					 $('#check').append('<div style="color: green;"><strong>ใช้ได้ !!! </strong> ยังไม่มีการใช้งาน...</div>');
				}
			}
		});
	});
}//end function check

function validateInput() {
	var pass = true;
	//userUsername
	if(''==$('#userUsername').val()) {
		$('#error-username').removeClass("hide")
		pass = false;
	}else{
		$('#error-username').addClass("hide")
	}
	//userPassword
	if(''==$('#userPassword').val()) {
		$('#error-password').removeClass("hide")
		pass = false;
	}else{
		$('#error-password').addClass("hide")
	}
	//userFname
	if(''==$('#userFname').val()) {
		$('#error-userFname').removeClass("hide")
		pass = false;
	}else{
		$('#error-userFname').addClass("hide")
	}
	//userLname
	if(''==$('#userLname').val()) {
		$('#error-userLname').removeClass("hide")
		pass = false;
	}else{
		$('#error-userLname').addClass("hide")
	}
	//setdate
	if(''==$('#setdate').val()) {
		$('#error-setdate').removeClass("hide")
		pass = false;
	}else{
		$('#error-setdate').addClass("hide")
	}

	return pass;
}