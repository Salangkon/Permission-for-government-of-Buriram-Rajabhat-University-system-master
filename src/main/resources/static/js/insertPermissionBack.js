function myFunction() {
	var aaa 
	if ($('#aaa').val() == "") {
		aaa = 0;
	} else {
		aaa = $('#aaa').val();
	};
 
	if ($('#travelSumTotal1').val() == "") {
		travelSumTotal1 = 0;
	} else {
		travelSumTotal1 = $('#travelSumTotal1').val(); 
	};
var x = document.getElementById("travelSumTotal1").value;
var r = parseFloat(x) + parseFloat(aaa)
document.getElementById("expenseEstimateSumTotal").value = parseFloat(r).toFixed(2);
}

function validateInput() {
	var pass = true;
	//province
	if(''==$('#province').val()) {
		$('#error-province').removeClass("hide")
		pass = false;
	}else{
		$('#error-province').addClass("hide")
	}
	//amphur
	if(''==$('#amphur').val()) {
		$('#error-amphur').removeClass("hide")
		pass = false;
	}else{
		$('#error-amphur').addClass("hide")
	}
	//district
	if(''==$('#district').val()) {
		$('#error-district').removeClass("hide")
		pass = false;
	}else{
		$('#error-district').addClass("hide")
	}
	//bSaveDate
	if(''==$('#bSaveDate').val()) {
		$('#error-bSaveDate').removeClass("hide")
		pass = false;
	}else{
		$('#error-bSaveDate').addClass("hide")
	}
	//bByOrderSave
	if(''==$('#bByOrderSave').val()) {
		$('#error-bByOrderSave').removeClass("hide")
		pass = false;
	}else{
		$('#error-bByOrderSave').addClass("hide")
	}//bDateAuthorized
	if(''==$('#bDateAuthorized').val()) {
		$('#error-bDateAuthorized').removeClass("hide")
		pass = false;
	}else{
		$('#error-bDateAuthorized').addClass("hide")
	}
	//bGoDate
	if(''==$('#bGoDate').val()) {
		$('#error-bGoDate').removeClass("hide")
		pass = false;
	}else{
		$('#error-bGoDate').addClass("hide")
	}
	//bGoTime
	if(''==$('#bGoTime').val()) {
		$('#error-bGoTime').removeClass("hide")
		pass = false;
	}else{
		$('#error-bGoTime').addClass("hide")
	}
	//bBackDate
	if(''==$('#bBackDate').val()) {
		$('#error-bBackDate').removeClass("hide")
		pass = false;
	}else{
		$('#error-bBackDate').addClass("hide")
	}
	//bBackTime
	if(''==$('#bBackTime').val()) {
		$('#error-bBackTime').removeClass("hide")
		pass = false;
	}else{
		$('#error-bBackTime').addClass("hide")
	}
	//bHouseNumber
	if(''==$('#bHouseNumber').val()) {
		$('#error-bHouseNumber').removeClass("hide")
		pass = false;
	}else{
		$('#error-bHouseNumber').addClass("hide")
	}
	//bRoad
	if(''==$('#bRoad').val()) {
		$('#error-bRoad').removeClass("hide")
		pass = false;
	}else{
		$('#error-bRoad').addClass("hide")
	}

	return pass;
}

var bDisbursedBy = "";
var bStartTravel = "";

var choiceBill1 = "";
var choiceBill2 = "";
var choiceBill3 = "";
var choiceBill4 = "";
var choiceBill5 = "";
var choiceBill6 = "";
var choiceBill7 = "";

$(document).ready(function() {
	
	//choiceBill
	$("#choiceBill1").change(function(){
		choiceBill1 = "1";
	});
	$("#choiceBill2").change(function(){
		choiceBill2 = "1";
	});
	$("#choiceBill3").change(function(){
		choiceBill3 = "1";
	});
	$("#choiceBill4").change(function(){
		choiceBill4 = "1";
	});
	$("#choiceBill5").change(function(){
		choiceBill5 = "1";
	});
	$("#choiceBill6").change(function(){
		choiceBill6 = "1";
	});
	$("#choiceBill7").change(function(){
		choiceBill7 = "1";
	});


	//bDisbursedBy
	$("#bDisbursedBy1").change(function(){
		bDisbursedBy = "1";
	});
	$("#bDisbursedBy2").change(function(){
		bDisbursedBy = "2";
	});
	
	//bStartTravel
	$("#bStartTravel1").change(function(){
		bStartTravel = 1;
	});
	$("#bStartTravel2").change(function(){
		bStartTravel = 2;
	});
	
	//bBackTravel
	$("#bBackTravel1").change(function(){
		bBackTravel = 1;
	});
	$("#bBackTravel2").change(function(){
		bBackTravel = 2;
	});
	
	//bAllowenceType ประเภทค่าเบี๋ยเลี้ยง
	$("#bAllowenceType1").change(function(){
		bAllowenceType = 1;
	});
	$("#bAllowenceType2").change(function(){
		bAllowenceType = 2;
	});
	
	//bRentDateType ประเภทค่าที่พัก
	$("#bRentDateType1").change(function(){
		bRentDateType = 1;
	});
	$("#bRentDateType2").change(function(){
		bRentDateType = 2;
	});

	
	//insertPermission
	$('#saveBack').click(function(){
		
		console.log("");
		var d ;
		var inputdata = [];
		for (var i = 0; i < tableSelect.data().length; i++) {
			d = tableSelect.data()[i];
			console.log(d);
			d.allowence = $("#allowence"+i).val(); //ค่าเบี้ยงเลี้ยง
			d.allowencePerday = $("#allowencePerday"+i).val();//จำนวนวันเบี๋ยเลี้ยง/วัน
			d.allowenceSum = $("#allowenceSum"+i).val(); //รวมเงินทั้งหมดเเต่ละ บุคคลากร
			d.rentDate = $("#rentDate"+i).val(); //ค่าที่พัก
			d.rentDatePerday = $("#rentDatePerday"+i).val(); //จำนวนวันที่พัก/คืน
			d.rentDateSum = $("#rentDateSum"+i).val(); //รวมค่าที่พัก
//			d.travelSum = $("#travelSum"+i).val(); //ค่าที่พัก
			d.otherSum = $("#otherSum"+i).val(); //จำนวนที่พัก/วัน
			d.expenseEstimateSum = $("#expenseEstimateSum"+i).val(); //ค่าที่พัก
			d.allowenceType = $("#allowenceType"+i).val();
			inputdata.push(d);
		}
		
		
		var esBean = {
			permissionId : $('#permissionId').val(),
			userSumTotal : $('#userSumTotal').text(),
			allowenceSumTotal : $('#allowenceSumTotal').text(),
			rentDateSumTotal : $('#rentDateSumTotal').text(),
			travelSumTotal : $('#travelSumTotal1').val(),
			otherSumTotal : $('#otherSumTotal').text(),
			expenseEstimateSumTotal : $('#expenseEstimateSumTotal').val(),
		
			allowencePerdayTotal : $('#allowencePerdayTotal').text(),
			rentDatePerdayTotal : $('#rentDatePerdayTotal').text(),
		}
		var perBean = {
				permissionId 	: $('#permissionId').val(),
			}
		
		var pass = true;	
		pass = validateInput();
		
		var pmBean = {
			permissionId 	: $('#permissionId').val(),
			bSaveDate		: $('#bSaveDate').val(),
			bByOrderSave 	: $('#bByOrderSave').val(),
			bDateAuthorized : $('#bDateAuthorized').val(),

			bDisbursedBy 	: bDisbursedBy,
			bAllowenceType 	: bAllowenceType,
			bRentDateType 	: bRentDateType,
			bStartTravel 	: bStartTravel,
			bBackTravel 	: bBackTravel,
			bHouseNumber 	: $('#bHouseNumber').val(),

			bRoad 			: $('#bRoad').val(),
			district 		: $('#district').val(),
			bGoDate 		: $('#bGoDate').val(),
			bGoTime 		: $('#bGoTime').val(),
			bBackDate 		: $('#bBackDate').val(),
			bBackTime 		: $('#bBackTime').val(),

			bDaySum 		: $('#bDaySum ').val(),
			bTimeSum 		: $('#bTimeSum ').val(),
			
			bBenefitRecord 	: $('#bBenefitRecord').val(),
			bBenefitCourses : $('#bBenefitCourses').val(),
			bBenefitUse 	: $('#bBenefitUse').val(),
			
			choiceBill1		: choiceBill1,
			choiceBill2		: choiceBill2,
			choiceBill3		: choiceBill3,
			choiceBill4		: choiceBill4,
			choiceBill5		: choiceBill5,
			choiceBill6		: choiceBill6,
			choiceBill7		: choiceBill7,
			choiceBill7C	: $('#choiceBill7C').val(),
			
			billGoDate		: $('#billGoDate').val(),
			billDetail1		: $('#billDetail1').val(),
			billBackDate	: $('#billBackDate').val(),
			billDetail2		: $('#billDetail2').val(),

			esBean			: esBean ,
			eeBean			: inputdata ,
			permissionBean	: perBean
		}
		
		if(pass) {
			swal({
				  title: "คุณแน่ใจไหม !",
				  text: "ที่จะบันทึก ข้อมูลนี้!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "ยืนยัน",
				  cancelButtonText: "ยกเลิก",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm) {
				  if (isConfirm) {
					  swal("เรียบร้อย!", "บันทึกสำเร็จ", "success") ;
					  $.ajax({
							
					        type: "POST",
					        url: "/insertPermissionBack",
					        data: JSON.stringify(pmBean),
					        dataType: "json",
					        async: false,
					        contentType: "application/json; charset=utf-8",
					        success: function (res) {
					        	console.log(res)
					        	window.location.href = res.page;
					        },
						 	error: function () {
						 		console.log('[ae] xx ')
						 		window.location.href = "insertPermissionFail";
						    }
						});
				  } else {
					  swal("ยกเลิก", "ไม่บันทึก", "error");
				  }
				});

		}
		
		
	});
	
	//insertExpenseSumary
//	$('#saveBack').click(function() {
//
//		var esBean = {
//			permissionId : $('#permissionId').val(),
//			userSumTotal : $('#userSumTotal').text(),
//			allowenceSumTotal : $('#allowenceSumTotal').text(),
//			rentDateSumTotal : $('#rentDateSumTotal').text(),
//			travelSumTotal : $('#travelSumTotal').text(),
//			otherSumTotal : $('#otherSumTotal').text(),
//			expenseEstimateSumTotal : $('#expenseEstimateSumTotal').text(),
//
//			allowencePerdayTotal : $('#allowencePerdayTotal').text(),
//			rentDatePerdayTotal : $('#rentDatePerdayTotal').text(),
//		}
//
//		$.ajax({
//			type : "POST",
//			url : "/insertExpenseSumaryBack",
//	        data: JSON.stringify(esBean),
//	        dataType: "json",
//	        async: false,
//	        contentType: "application/json; charset=utf-8",
//	        success: function (res) {
//	        	console.log(res)
////	        	window.location.href = res.page;
//	        },
//			error : function() {
//				window.location.href = "insertPermissionFail";
//			}
//		});
//
//	});
	
	//คำนวณ ค่าเบี้ยเลี้ยง
	$('#addUser').on('keyup','input', function() { 
		var sum6 = $(this).parent().parent().find('td')[7];
		var number1 = $(this).parent().parent().find('td')[5];
		var number2= $(this).parent().parent().find('td')[6];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		if(''!=num1 && ''!=num2) {
			var total = (num1)*(num2);
			$(sum6).find('input').val(total);
		}else{
			$(sum6).find('input').val(0);
		}
	
	//คำนวณ ค่าที่พัก
		var sum9 = $(this).parent().parent().find('td')[10];
		var number3 = $(this).parent().parent().find('td')[8];
		var number4= $(this).parent().parent().find('td')[9];
		var num3 = $(number3).find('input.number3').val();
		var num4 = $(number4).find('input.number4').val();
		if(''!=num3 && ''!=num4) {
			var total = (num3)*(num4);
			$(sum9).find('input').val(total);
		}else{
			$(sum9).find('input').val(0);
		}
	
	//คำนวณ ค่าที่พัก ค่าเบี้ยเลี้ยง
		var sum12 = $(this).parent().parent().find('td')[12];
		var sum6 = $(this).parent().parent().find('td')[7];
		var sum9 = $(this).parent().parent().find('td')[10];
//		var sum10 = $(this).parent().parent().find('td')[11];
		var sum11 = $(this).parent().parent().find('td')[11];
		var sum6 = $(sum6).find('input.sum6').val();
		var sum9 = $(sum9).find('input.sum9').val();
		// var sum10 = $(sum10).find('input.sum10').val();
		var sum11 = $(sum11).find('input.sum11').val();
		if(''!=sum6 && ''!=sum9 && /*''!=sum10 &&*/ ''!=sum11) {
			var total = parseFloat(sum6) + parseFloat(sum9)+ /*parseFloat(sum10)+*/ parseFloat(sum11);// parseFloat ตัวแปลค่า จาก Type String to int (parse เปลี่ยนค่า Type)
			$(sum12).find('input').val(total);
		}else{
			$(sum12).find('input').val(0);
		}
		// allowenceSum รวมค่าเบี้ยเลี้ยง
		var sumvalues = $("[name='allowenceSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}	
		}
		$('#allowenceSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
		
		// rentDateSum รวมค่าที่พัก
		var sumvalues = $("[name='rentDateSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}	
		}
		$('#rentDateSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
		
		// travelSum รวมค่าพาหนะ
		var sumvalues = $("[name='travelSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#travelSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
		// otherSum รวมค่าพาหนะ
		var sumvalues = $("[name='otherSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#otherSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
		// expenseEstimateSum รวมค่าพาหนะ
		var sumvalues = $("[name='expenseEstimateSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#expenseEstimateSumTotal1').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
		$('#aaa').val(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); // .val ใช้กับ tag ที่เป็น input
	
		// allowencePerdayTotal รวมค่าที่พัก
		var num = $('#addUser').DataTable().rows().data().length;
		var sumvalues = $("[name='allowencePerday']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
			}	
		}
		$('#allowencePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
		
		// allowencePerdayTotal รวมค่าที่พัก
		var num = $('#addUser').DataTable().rows().data().length;
		var sumvalues = $("[name='rentDatePerday']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
			}	
		}
		$('#rentDatePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
	});
	
		var table = $('#userTable').DataTable({
					"sAjaxSource" : "/personnel",
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "personnelId" ,
						className: 'select-checkbox',
						"mRender" : function(data,
								type, row, index) {
							return '';
						}
					}, {
						"mData" : "userUsername"
					},{
						"mData" : "userFname"
					}, {
						"mData" : "userLname"
					},
//					{
//						"mData" : "facultyName"
//					}, 
					{
						"mData" : "departmentName"
					}, 
//					{
//						"mData" : "positionName"
//					}, 
					{
						"mData" : "subPositionName"
					}, {
						"mData" : "allowence"
					}, {
						"mData" : "rentDate"
					}
					]
				});
		var tableSelect = $('#addUser').DataTable({
				"bInfo" : false,//Showing 0 to 0 of 0 entries
				"sAjaxSource"	: "/ExpenseByPermission",
				"sAjaxDataProp" : "",
				"aoColumns" : [{
						"mData" : "personnelId",
						"sWidth" : "20px" ,
						"sClass": "center",
				},
				{
						"mData" : "userFname",
						"sWidth" : "180px" 
				},
				{
						"mData" : "userLname",
						"sWidth" : "180px" 
				},
				{
						"mData" : "subPositionName",
						"sWidth" : "100px" 
				},{
					"mData" : "",
					"sWidth" : "30px",
					"mRender" : function(data,
							type, row, index) {
						if (row.allowenceType == '1') {
							return '<select  class="form-control "  style="width: 15mm;" name="allowenceType" id="allowenceType'+index.row+'" onchange="setAllowEnce('+index.row+','+row.allowenceType+')" >'
							+'<option  value="1">ก</option>'
							+'<option  value="2">ข</option>'
							+'</select>';
			            } else if (row.allowenceType == '2') {
			            	return '<select  class="form-control "  style="width: 15mm;" name="allowenceType" id="allowenceType'+index.row+'" onchange="setAllowEnce('+index.row+','+row.allowenceType+')" >'
							+'<option  value="2">ข</option>'
							+'<option  value="1">ก</option>'
							+'</select>';
			            } else {
			            	return '<select  class="form-control "  style="width: 15mm;" name="allowenceType" id="allowenceType'+index.row+'" onchange="setAllowEnce('+index.row+','+row.allowenceType+')" >'
			            	+'<option  value="1">ก</option>'
							+'<option  value="2">ข</option>'
							+'</select>';
			            } 
					}
				},
				{
					"mData" : "allowence",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						if (row.allowence != null) {
							return '<input class="form-control number1" style="width: 15mm;height: 7mm" type="text" name="allowence" id="allowence' 
							+ index.row
							+ '" value="'+row.allowence+'"/>';
						}else {
							return '<input class="form-control number1" style="width: 15mm;height: 7mm" type="text" name="allowence" id="allowence' 
							+ index.row
							+ '" value=""/>';
						}
					}	
				},
				{    
					"mData" : "allowencePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {	
						var data1 = $('#bDaySum').val();
						if (row.allowencePerday != null) {
							return '<input class="form-control number2" style="width: 16mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="allowencePerday" id="allowencePerday'
							+ index.row
							+ '" value="'+row.allowencePerday+'" />';
			            } else {
			            	return '<input class="form-control number2" style="width: 16mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="allowencePerday" id="allowencePerday'
							+ index.row
							+ '" value="'+data1+'" />';
			            }
					}
				},
				{
					"mData" : "allowenceSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						var data1 = $('#bDaySum').val();
						if (row.allowenceSum != null) {
							return '<input class="form-control sum6" disabled readonly="true" type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="allowenceSum" id="allowenceSum'
							+ index.row
							+ '" value="'+row.allowenceSum+'"/>';
			            } else {
			            	return '<input class="form-control sum6" disabled readonly="true" type="text" OnKeyPress="return chkNumber(this)" style="width: 20mm;height: 7mm" name="allowenceSum" id="allowenceSum'
							+ index.row
							+ '" value="'+(row.allowence)*(data1)+'" />';
					}
			            }
				},
				{
					"mData" : "rentDate",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number3" type="text" OnKeyPress="return chkNumber(this)" style="width: 20mm;height: 7mm" id="rentDate'
							+ index.row
							+ '" value="'+row.rentDate+'"/>';
					}
				},
				{
					"mData" : "rentDatePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {
						var data2 = $('#bNight').val();
						if (row.rentDatePerday != null) {
							return '<input class="form-control number4" type="text" OnKeyPress="return chkNumber(this)" style="width: 16mm;height: 7mm" name="rentDatePerday" id="rentDatePerday'
							+ index.row
							+ '" value="'+row.rentDatePerday+'"/>';
			            } else {
			            	return '<input class="form-control number4" type="text" OnKeyPress="return chkNumber(this)" style="width: 16mm;height: 7mm" name="rentDatePerday" id="rentDatePerday'
							+ index.row
							+ '" value="'+data2+'"/>';
			            }
					
					}
				},	
				{
					"mData" : "rentDateSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						var data2 = $('#bNight').val();
						if (row.rentDateSum != null) {
							return '<input class="form-control sum9" disabled readonly="true" type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="rentDateSum" id="rentDateSum'
							+ index.row
							+ '" value="'+row.rentDateSum+'"/>';
			            } else {
			            	return '<input class="form-control sum9" disabled readonly="true" type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="rentDateSum" id="rentDateSum'
							+ index.row
							+ '" value="'+(row.rentDate)*(data2)+'"/>';
			            }
					}										
				},
//				{
//					"mData" : "travelSum",
//					"sWidth" : "60px" ,
//					"mRender" : function(data,
//						type, row, index) {
//						if (row.travelSum != null) {
//							return '<input class="form-control sum10"  type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="travelSum" id="travelSum'
//							+ index.row 
//							+ '" value="'+row.travelSum+'" />';
//			            } else {
//			            	return '<input class="form-control sum10"  type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="travelSum" id="travelSum'
//							+ index.row 
//							+ '" value="0" />';
//			            }
//					
//					}										
//				},
				{
					"mData" : "otherSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						if (row.otherSum != null) {
							return '<input class="form-control sum11"  type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="otherSum" id="otherSum'
							+ index.row 
							+ '" value="'+row.otherSum+'" />';
			            } else {
			            	return '<input class="form-control sum11"  type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="otherSum" id="otherSum'
							+ index.row 
							+ '" value="0" />';
			            }
					}										
				},
				{
				"mData" : "expenseEstimateSum",
				"sWidth" : "60px" ,
				"mRender" : function(data,
					type, row, index) {
					var data1 = $('#bDaySum').val();
					var data2 = $('#bNight').val();
					var a = (parseFloat(row.allowence)*parseFloat(data1)) + (parseFloat(row.rentDate)*parseFloat(data2))/* + (parseFloat(row.otherSum))*/;
					if (row.expenseEstimateSum != null) {
							return '<input class="form-control sum12" disabled readonly="true" type="number" style="width: 22mm;height: 7mm" name="expenseEstimateSum" id="expenseEstimateSum'
							+ index.row 
							+ '" value="'+row.expenseEstimateSum+'"/>';
						}	else {
							return '<input class="form-control sum12" disabled readonly="true" type="number" style="width: 22mm;height: 7mm" name="expenseEstimateSum" id="expenseEstimateSum'
							+ index.row  
							+ '" value="'+(parseFloat(a))+'"/>';
		            	}	
					}
				},
				{
						"mData" : "",
						"sWidth" : "5px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<a class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></a>';
						}										
				}]
		});
					$('#userTable').on('click', 'tr', function() {
						$(this).toggleClass('selected');
					});
					$('#buttonAdd1').click(function() {
						var datas = table.rows('.selected').data();
						tableSelect.rows.add(datas).draw(false);
						table.rows('.selected').remove().draw();
						console.log(datas);
						var num = $('#addUser').DataTable().rows().data().length;
						$('#userSumTotal').text(num);
						// allowenceSum รวมค่าเบี้ยเลี้ยง
						var sumvalues = $("[name='allowenceSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}	
						}
						$('#allowenceSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						
						// rentDateSum รวมค่าที่พัก
						var sumvalues = $("[name='rentDateSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}	
						}
						$('#rentDateSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
						
						// travelSum รวมค่าพาหนะ
						var sumvalues = $("[name='travelSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#travelSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						// otherSum รวมค่าพาหนะ
						var sumvalues = $("[name='otherSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#otherSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						// expenseEstimateSum รวมค่าพาหนะ
						var sumvalues = $("[name='expenseEstimateSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#expenseEstimateSumTotal1').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						$('#aaa').val(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); // .val ใช้กับ tag ที่เป็น input
					
						// allowencePerdayTotal รวมค่าที่พัก
						var num = $('#addUser').DataTable().rows().data().length;
						var sumvalues = $("[name='allowencePerday']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
							}	
						}
						$('#allowencePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
						
						// allowencePerdayTotal รวมค่าที่พัก
						var num = $('#addUser').DataTable().rows().data().length;
						var sumvalues = $("[name='rentDatePerday']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
							}	
						}
						$('#rentDatePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
						
					});
					 $('#addUser').on('click', 'a', function() {
						tableSelect.row( $(this).parents('tr') ).remove().draw();
						var num = $('#addUser').DataTable().rows().data().length;
						$('#userSumTotal').text(num);
						// allowenceSum รวมค่าเบี้ยเลี้ยง
						var sumvalues = $("[name='allowenceSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}	
						}
						$('#allowenceSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						
						// rentDateSum รวมค่าที่พัก
						var sumvalues = $("[name='rentDateSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}	
						}
						$('#rentDateSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
						
						// travelSum รวมค่าพาหนะ
						var sumvalues = $("[name='travelSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#travelSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						// otherSum รวมค่าพาหนะ
						var sumvalues = $("[name='otherSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#otherSumTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						// expenseEstimateSum รวมค่าพาหนะ
						var sumvalues = $("[name='expenseEstimateSum']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val());
							}
						}
						$('#expenseEstimateSumTotal1').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/);
						$('#aaa').val(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); // .val ใช้กับ tag ที่เป็น input
					
						// allowencePerdayTotal รวมค่าที่พัก
						var num = $('#addUser').DataTable().rows().data().length;
						var sumvalues = $("[name='allowencePerday']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
							}	
						}
						$('#allowencePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
						
						// allowencePerdayTotal รวมค่าที่พัก
						var num = $('#addUser').DataTable().rows().data().length;
						var sumvalues = $("[name='rentDatePerday']");
						var sum = 0;
						for(var i = 0; i < sumvalues.length;i++){
							if($(sumvalues[i]).val() != ""){
								sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
							}	
						}
						$('#rentDatePerdayTotal').text(parseFloat(sum).toFixed(0)/*.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")*/); 
					});
				
					

//					$('#saveBack').click(function() {
//						console.log("");
//						var d ;
//						var inputdata = [];
//						for (var i = 0; i < tableSelect.data().length; i++) {
//							d = tableSelect.data()[i];
//							console.log(d);
//							d.allowence = $("#allowence"+i).val(); //ค่าเบี้ยงเลี้ยง
//							d.allowencePerday = $("#allowencePerday"+i).val();//จำนวนวันเบี๋ยเลี้ยง/วัน
//							d.allowenceSum = $("#allowenceSum"+i).val(); //รวมเงินทั้งหมดเเต่ละ บุคคลากร
//							d.rentDate = $("#rentDate"+i).val(); //ค่าที่พัก
//							d.rentDatePerday = $("#rentDatePerday"+i).val(); //จำนวนวันที่พัก/คืน
//							d.rentDateSum = $("#rentDateSum"+i).val(); //รวมค่าที่พัก
//							d.travelSum = $("#travelSum"+i).val(); //ค่าที่พัก
//							d.otherSum = $("#otherSum"+i).val(); //จำนวนที่พัก/วัน
//							d.expenseEstimateSum = $("#expenseEstimateSum"+i).val(); //ค่าที่พัก
//							d.allowenceType = $("#allowenceType"+i).val();
//							inputdata.push(d);
//						}
//
//						$.ajax({
//							type : "POST",
//							url : "/insertExpenseEstimateBack",
//							data : JSON.stringify(inputdata),
//							dataType : "json",
//							async : false,
//							contentType : "application/json; charset=utf-8",
//							success : function(res) {
//								// console.log(res)
////								window.location.href = res.page;
//							},
//							error : function() {
//								window.location.href = "insertPermissionFail";
//							}
//						});
//
//					});


});//end
