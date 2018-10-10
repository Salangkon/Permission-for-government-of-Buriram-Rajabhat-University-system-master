var status = "";

var purpose = "";
var purpose1 = "";
var purpose2 = "";

var commitA	 = "";
var commitB	 = "";
var commitC	 = "";
var commitD	 = "";

$(document).ready(function() {
	
	//userPersonnel
	$.ajax({
		type : "GET",
		url : "/userPersonnel",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			console.log('Success')
			for(var i=0; i<msg.length; i++) {
				$('#personnelId').append('<option value="' + msg[i].personnelId+ '">' + msg[i].facultyName + ' / ' + msg[i].departmentName + ' / ' + msg[i].positionName + ' / ' + msg[i].subPositionName +'</option>');
			}
		}
	});
	
	//status
	$("#status1").change(function(){
		status = "1";
	});
	$("#status2").change(function(){
		status = "2";
	});
	$("#status3").change(function(){
		status = "3";
	});
	//purpose
	$("#purpose").change(function(){
		purpose = "ขออนุญาต";
	});
	$("#purpose1").change(function(){
		purpose1 = "ได้รับคำสั่ง";
	});
	$("#purpose2").change(function(){
		purpose2 = "ไปราชการ";
	});
	//commitA
	$("#commitA1").change(function(){
		commitA	 = "1";
	});
	$("#commitA2").change(function(){
		commitA	 = "2";
	});
	//commitB
	$("#commitB1").change(function(){
		commitB	 = "1";
	});
	$("#commitB2").change(function(){
		commitB	 = "2";
	});
	//commitC
	$("#commitC1").change(function(){
		commitC	 = "1";
	});
	$("#commitC2").change(function(){
		commitC	 = "2";
	});
	//commitD
	$("#commitD1").change(function(){
		commitD	 = "1";
	});
	$("#commitD2").change(function(){
		commitD	 = "2";
	});
	
	//insertPermission
	$('#saveExpenseEstimate').click(function(){
		
		console.log("");
		var d ;
		var inputdata = [];
		for (var i = 0; i < tableSelect.data().length; i++) {
			d = tableSelect.data()[i];
			console.log(d);
			d.allowenceType		= $("#allowenceType"+i).val(); //ค่าเบี้ยงเลี้ยง ประเภท
			d.allowence			= $("#allowence"+i).val(); //ค่าเบี้ยงเลี้ยง
			d.allowencePerday 	= $("#allowencePerday"+i).val();//จำนวนวันเบี๋ยเลี้ยง/วัน
			d.allowenceSum 		= $("#allowenceSum"+i).val(); //รวมเงินทั้งหมดเเต่ละ บุคคลากร
			d.rentDate 			= $("#rentDate"+i).val(); //ค่าที่พัก
			d.rentDatePerday	= $("#rentDatePerday"+i).val(); //จำนวนวันที่พัก/คืน
			d.rentDateSum 		= $("#rentDateSum"+i).val(); //รวมค่าที่พัก
			d.travelSum 		= $("#travelSum"+i).val(); //ค่าที่พัก
			d.otherSum 			= $("#otherSum"+i).val(); //จำนวนที่พัก/วัน
			d.expenseEstimateSum = $("#expenseEstimateSum"+i).val(); //ค่าที่พัก
			inputdata.push(d);
		}


		console.log("");
		var d ;
		var inputdataTe = [];
		for (var i = 0; i < tableSelectTravel.data().length; i++) {
			 d = tableSelectTravel.data()[i];
			console.log(d);
			d.numberPer = $("#numberPer"+i).val();
			d.travelExpenses = $("#travelExpenses"+i).val();
			d.userSum = $("#userSum"+i).val();
			d.sum = $("#sum"+i).val();
			d.vehicleC = $("#vehicleC"+i).val();
			inputdataTe.push(d);
		}				


		console.log("");
		var d ;
		var inputdataTefc = [];
		for (var i = 0; i < tableSelectTravel1.data().length; i++) {
			d = tableSelectTravel1.data()[i];
			console.log(d);
			d.distance = $("#distance"+i).val();
			d.numberPer = $("#numberPer"+i).val()
			d.fuelCost = $("#fuelCost"+i).val();
			d.rateFuelCost = $("#rateFuelCost"+i).val();
			d.fuelCostSum = $("#fuelCostSum"+i).val();
			d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
			d.sum = $("#sum"+i).val();
			d.vehicleC = $("#vehicleC"+i).val();
			inputdataTefc.push(d);
		}				
			

		console.log("");
		var d ;
		var inputdataTefc1 = [];
		for (var i = 0; i < tableSelectPrivateCar.data().length; i++) {
			d = tableSelectPrivateCar.data()[i];
			console.log(d);
			d.distance 		= $("#distance"+i).val();
			d.numberPer 	= $("#numberPer"+i).val()
			d.rateFuelCost	= $("#rateFuelCost"+i).val();
			d.fuelCostSum 	= $("#fuelCostSum"+i).val();
			d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
			d.sum = $("#sum"+i).val();
			d.vehicleC = $("#vehicleC"+i).val();
			inputdataTefc1.push(d);
		}				

		
		esBean1 = {
				userSumTotal			: $('#userSumTotal').text(),	
				allowenceSumTotal		: $('#allowenceSumTotal').text(),	
				rentDateSumTotal		: $('#rentDateSumTotal').text(),	
				travelSumTotal			: $('#travelSumTotal').text(),	
				otherSumTotal			: $('#otherSumTotal').text(),	
				expenseEstimateSumTotal	: $('#expenseEstimateSumTotal').text(),

				allowencePerdayTotal	: $('#allowencePerdayTotal').text(),	
				rentDatePerdayTotal		: $('#rentDatePerdayTotal').text(),	
				
				allowenceDetails		: $('#allowenceDetails').val(),
				rentDateDetails			: $('#rentDateDetails').val(),
		}

		var pmBean = {
				permissionDate	: $('#permissionDate').val(),
				personnelId		: $('#personnelId').val(),
				district		: $('#district').val(),

				purpose			: purpose,
				purpose1		: purpose1,
				purpose2		: purpose2,
				topics			: $('#topics').val(),
			
				status			: status,
				object			: $('#object').val(),
				destinationName	: $('#destinationName').val(),
				
				goDate			: $('#goDate').val(),
				goTime			: $('#goTime').val(),
				backDate		: $('#backDate').val(),
				backTime		: $('#backTime').val(),
				
				budget			: $('#budget').val(),
				budgetExpenses	: $('#budgetExpenses').val(),
				budgetBy		: $('#budgetBy').val(),
				budgetProject	: $('#budgetProject').val(),
				budgetPass		: $('#budgetPass').val(),
				travel			: $('#travel').val(),
				
				travelIdcard	: $('#travelIdcard').val(),
				travelDriver	: $('#travelDriver').val(),
				
				commitA			: commitA,
				commitADt		: $('#commitADt').val(),
				commitB			: commitB,
				commitBDt		: $('#commitBDt').val(),
				commitC			: commitC,
				commitCDt		: $('#commitCDt').val(),
				commitD			: commitD,
				other			: $('#other').val(),
				commitDDt		: $('#commitDDt').val(),
				
				eeBean			: inputdata ,
				teBean			: inputdataTe ,
				tefcBean		: inputdataTefc ,
				tefcBean		: inputdataTefc1 ,
				esBean			: esBean1
		}

		$.ajax({
		
	        type: "POST",
	        url: "/insertPermission",
	        data: JSON.stringify(pmBean),
	        dataType: "json",
	        async: false,
	        contentType: "application/json; charset=utf-8",
	        success: function (res) {
	        	console.log(res)
	        	window.location.href = res.page;
	        },
		 	error: function () {
//		 		console.log('[ae] xx ')
		 		window.location.href = "insertPermissionFail";
		    }
		});
		
	});
	
//	//insertExpenseSumary
//	$('#saveExpenseEstimate').click(function() {
//
//		var esBean = {
//				userSumTotal			: $('#userSumTotal').text(),	
//				allowenceSumTotal		: $('#allowenceSumTotal').text(),	
//				rentDateSumTotal		: $('#rentDateSumTotal').text(),	
//				travelSumTotal			: $('#travelSumTotal').text(),	
//				otherSumTotal			: $('#otherSumTotal').text(),	
//				expenseEstimateSumTotal	: $('#expenseEstimateSumTotal').text(),
//
//				allowencePerdayTotal	: $('#allowencePerdayTotal').text(),	
//				rentDatePerdayTotal		: $('#rentDatePerdayTotal').text(),	
//				
//				allowenceDetails		: $('#allowenceDetails').val(),
//				rentDateDetails			: $('#rentDateDetails').val(),
//		}
//
//		$.ajax({
//			type : "POST",
//			url : "/insertExpenseSumary",
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
	
	
	
	//คำนวณ ค่าพาหนะ ประจำทาง
	$('#addTravel').on('change','input', function() { 	
		var sum = $(this).parent().parent().find('td')[5];
		var number1 = $(this).parent().parent().find('td')[2];
		var number2= $(this).parent().parent().find('td')[3];
		var number3 = $(this).parent().parent().find('td')[4];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		var num3 = $(number3).find('input.number3').val();
		if(''!=num1 && ''!=num2 && ''!=num3) {
			var total = (num1)*(num2)*(num3);
			$(sum).find('input').val(total);
		}else{
			$(sum).find('input').val(0);
		}
		var sumvalues = $("[name='sum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}			
		}
		 $('#summary1').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
	});
	
	$('#addTravel').on('change','input', function() { 	
		var sumPerPerson = $(this).parent().parent().find('td')[6];
		var number1 = $(this).parent().parent().find('td')[2];
		var number2= $(this).parent().parent().find('td')[3];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		if(''!=num1 && ''!=num2 ) {
			var total = (num1)*(num2);
			$(sumPerPerson).find('input').val(total);
		}else{
			$(sumPerPerson).find('input').val(0);
		}
		var sumvalues = $("[name='sumPerPerson']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}			
		}
//		 $('#summary2').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		 $('#sumPerPerson1').val(parseFloat(sum).toFixed(0));
	});

	//คำนวณ รถส่วนตัว 
	$('#addPrivateCar').on('change','input', function() { 
		var sum1= $(this).parent().parent().find('td')[5];
		var number1 = $(this).parent().parent().find('td')[2];
		var number2= $(this).parent().parent().find('td')[3];
		var number3 = $(this).parent().parent().find('td')[4];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		var num3 = $(number3).find('input.number3').val();
		if(''!=num1 && ''!=num2 /*&& ''!=num3 */) {
			var total = (num1)*(num2)/**(num3)*/;
			$(sum1).find('input').val((total).toFixed(0));
		}else{
			$(sum1).find('input').val(0);
		}
	});
	//คำนวณ ค่าทางด่วน รถส่วนตัว สรูป
	$('#addPrivateCar').on('change','input', function() { 
		var sum= $(this).parent().parent().find('td')[7];
		var sum1= $(this).parent().parent().find('td')[5];
		var number3 = $(this).parent().parent().find('td')[6];
		var sum1 = $(sum1).find('input.sum1').val();
		var num4 = $(number3).find('input.number4').val();
		if(''!=sum1 && ''!=num4) {
			var total = parseFloat(sum1)+parseFloat(num4);
			$(sum).find('input').val(total);
		}else{
			$(sum).find('input').val(0);
		}
	});

	//คำนวณ รถขอไปราชการ
	$('#addTravel1').on('change','input', function() { 
		var sum1 = $(this).parent().parent().find('td')[6];
		var number1 = $(this).parent().parent().find('td')[2];
		var number2= $(this).parent().parent().find('td')[3];
		var number3 = $(this).parent().parent().find('td')[4];
		var number4 = $(this).parent().parent().find('td')[5];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		var num3 = $(number3).find('input.number3').val();
		var num4 = $(number4).find('input.number4').val();
		if(''!=num1 && ''!=num2 && ''!=num3 && ''!=num4) {
			var total = (num1)*(num2)*(num3)/(num4);
			$(sum1).find('input').val((total).toFixed(0));
		}else{
			$(sum1).find('input').val(0);
		}
	});
	//คำนวณ ค่าทางด่วน รถขอไปราชการ สรูป
	$('#addTravel1').on('change','input', function() { 
		var sum = $(this).parent().parent().find('td')[8];
		var sum1 = $(this).parent().parent().find('td')[6];
		var number5= $(this).parent().parent().find('td')[7];
		var sum1 = $(sum1).find('input.sum1').val();
		var num5 = $(number5).find('input.number5').val();
		if(''!=sum1 && ''!=num5 ){
			var total = parseFloat(sum1)+parseFloat(num5);
			$(sum).find('input').val(total);
		}else{
			$(sum).find('input').val(0);
		}
	});

	//คำนวณ ค่าเบี้ยเลี้ยง
	$('#addUser').on('change','input', function() { 
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
	});
	
	//คำนวณ ค่าที่พัก
	$('#addUser').on('change','input', function() { 
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
	});
	//คำนวณ ค่าที่พัก ค่าเบี้ยเลี้ยง
	$('#addUser').on('change','input', function() { 
		var sum12 = $(this).parent().parent().find('td')[13];
		var sum6 = $(this).parent().parent().find('td')[7];
		var sum9 = $(this).parent().parent().find('td')[10];
		var sum10 = $(this).parent().parent().find('td')[11];
		var sum11 = $(this).parent().parent().find('td')[12];
		var sum6 = $(sum6).find('input.sum6').val();
		var sum9 = $(sum9).find('input.sum9').val();
		var sum10 = $(sum10).find('input.sum10').val();
		var sum11 = $(sum11).find('input.sum11').val();
		if(''!=sum6 && ''!=sum9 && ''!=sum10 && ''!=sum11) {
			var total = parseFloat(sum6)+ parseFloat(sum9)+ parseFloat(sum10)+ parseFloat(sum11);// parseFloat ตัวแปลค่า จาก Type String to int (parse เปลี่ยนค่า Type)
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
		$('#allowenceSumTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		
		// rentDateSum รวมค่าที่พัก
		var sumvalues = $("[name='rentDateSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}	
		}
		$('#rentDateSumTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); 
		
		// travelSum รวมค่าพาหนะ
		var sumvalues = $("[name='travelSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#travelSumTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		// otherSum รวมค่าพาหนะ
		var sumvalues = $("[name='otherSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#otherSumTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		// expenseEstimateSum รวมค่าพาหนะ
		var sumvalues = $("[name='expenseEstimateSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
		}
		$('#expenseEstimateSumTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		$('#aaa').val(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); // .val ใช้กับ tag ที่เป็น input
	
		// allowencePerdayTotal รวมค่าที่พัก
		var num = $('#addUser').DataTable().rows().data().length;
		var sumvalues = $("[name='allowencePerday']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
			}	
		}
		$('#allowencePerdayTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); 
		
		// allowencePerdayTotal รวมค่าที่พัก
		var num = $('#addUser').DataTable().rows().data().length;
		var sumvalues = $("[name='rentDatePerday']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val())/parseFloat(num);
			}	
		}
		$('#rentDatePerdayTotal').text(parseFloat(sum).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); 
	});
	
		var table = $('#userTable').DataTable({
					responsive	: true,
//					"iDisplayLength": 7,
					"sAjaxSource" : "/personnel",
					"sAjaxDataProp" : "",
					"order": [
                        [0, "DESC"]
                    ],
					"aoColumns" : [ {
						"mData" : "personnelId" ,
						className: 'select-checkbox',
						"mRender" : function(data,
								type, row, index) {
						return '';
						}
					}, {
						"mData" : "userFname"
					}, {
						"mData" : "userLname"
					}, {
						"mData" : "facultyName"
					}, {
						"mData" : "departmentName"
					}, {
						"mData" : "positionName"
					}, {
						"mData" : "subPositionName"
					}, {
						"mData" : "allowence"
					}, {
						"mData" : "rentDate"
					}
					]
				});
		var tableSelect = $('#addUser').DataTable({
				responsive	: true,
				"sAjaxDataProp" : "",
				"aoColumns" : [{
						"mData" : "userId",
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
						return '<select  class="form-control "  style="width: 15mm;" name="allowenceType" id="allowenceType'+index.row+'" onchange="setAllowEnce('+index.row+','+row.allowenceType+')" >'
								+'<option  value="1">ก</option>'
								+'<option  value="2">ข</option>'
								+'</select>';
						}
				},
				{
					"mData" : "allowence",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number1" disabled style="width: 15mm;height: 7mm" type="text" name="allowence" id="allowence' 
							+ index.row
							+ '" value="'+row.allowence+'"/>';
					}
				},
				{    
					"mData" : "allowencePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {	
						var data1 = $('#DayTotal').val();
					return '<input class="form-control number2" style="width: 16mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="allowencePerday" id="allowencePerday'
							+ index.row
							+ '" value="'+data1+'" />';
					}
				},
				{
					"mData" : "allowenceSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum6" disabled readonly="true"  type="text"  style="width: 20mm;height: 7mm" name="allowenceSum" id="allowenceSum'
							+ index.row
							+ '" value="0" />';
					}
				},
				{
					"mData" : "rentDate",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number3" type="text" OnKeyPress="return chkNumber(this)" style="width: 20mm;height: 7mm" id="rentDate'
							+ index.row
							+ '"  value="'+row.rentDate+'"/>';
					}
				},
				{
					"mData" : "rentDatePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {
						var data2 = $('#d').val();
					return '<input class="form-control number4" type="text" OnKeyPress="return chkNumber(this)" style="width: 16mm;height: 7mm" name="rentDatePerday" id="rentDatePerday'
							+ index.row
							+ '" value="'+data2+'"/>';
					}
				},	
				{
					"mData" : "rentDateSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum9" disabled readonly="true" type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="rentDateSum" id="rentDateSum'
							+ index.row
							+ '" value="0"/>';
					}										
				},
				{
					"mData" : "travelSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						var sumPerPerson1 = $('#sumPerPerson1').val();
					return '<input class="form-control sum10"  type="text" OnKeyPress="return chkNumber(this)" style="width: 22mm;height: 7mm" name="travelSum" id="travelSum'
							+ index.row 
							+ '" value="'+ sumPerPerson1 +'" />';
					}										
				},
				{
					"mData" : "otherSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
						var otherSum = $('#otherSum').val();
					return '<input class="form-control sum11"  type="number" style="width: 22mm;height: 7mm" name="otherSum" id="otherSum'
							+ index.row 
							+ '" value="'+ parseFloat(otherSum).toFixed(0) +'" />';
					}										
				},
				{
				"mData" : "expenseEstimateSum",
				"sWidth" : "60px" ,
				"mRender" : function(data,
					type, row, index) {
				return '<input class="form-control sum12" disabled readonly="true" type="number" style="width: 22mm;height: 7mm" name="expenseEstimateSum" id="expenseEstimateSum'
						+ index.row 
						+ '" />';
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
					});
					$('#addUser').on('click', 'a', function() {
						tableSelect.row( $(this).parents('tr') ).remove().draw();
						var num = $('#addUser').DataTable().rows().data().length;
						$('#userSumTotal').text(num);

					});
					

//					$('#saveExpenseEstimate').click(function() {
//						console.log("");
//						var d ;
//						var inputdata = [];
//						for (var i = 0; i < tableSelect.data().length; i++) {
//							d = tableSelect.data()[i];
//							console.log(d);
//							d.allowenceType		= $("#allowenceType"+i).val(); //ค่าเบี้ยงเลี้ยง ประเภท
//							d.allowence			= $("#allowence"+i).val(); //ค่าเบี้ยงเลี้ยง
//							d.allowencePerday 	= $("#allowencePerday"+i).val();//จำนวนวันเบี๋ยเลี้ยง/วัน
//							d.allowenceSum 		= $("#allowenceSum"+i).val(); //รวมเงินทั้งหมดเเต่ละ บุคคลากร
//							d.rentDate 			= $("#rentDate"+i).val(); //ค่าที่พัก
//							d.rentDatePerday	= $("#rentDatePerday"+i).val(); //จำนวนวันที่พัก/คืน
//							d.rentDateSum 		= $("#rentDateSum"+i).val(); //รวมค่าที่พัก
//							d.travelSum 		= $("#travelSum"+i).val(); //ค่าที่พัก
//							d.otherSum 			= $("#otherSum"+i).val(); //จำนวนที่พัก/วัน
//							d.expenseEstimateSum = $("#expenseEstimateSum"+i).val(); //ค่าที่พัก
//							inputdata.push(d);
//						}
//
//						$.ajax({
//							type : "POST",
//							url : "/insertExpenseEstimate",
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
				
					//พาหนะ
					var tableTravel = $('#travelTable').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxSource" : "/travel",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							className: 'select-checkbox',
							"mRender" : function(data,
									type, row, index) {
							return '';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					var tableSelectTravel = $('#addTravel').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxDataProp" : "",
						"aoColumns" : [
							{
								"mData" : "travelId",
								"sWidth" : "20px",
							},
							{
								"mData" : "vehicleName",
								"sWidth" : "130px",
							},
							{
								"mData" : "numberPer", //จำนวนเที่ยว
								"sWidth" : "10px",
								"mRender" : function(data,
									type, row, index) {
									return '<input class="form-control number1" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" id="numberPer'
										+ index.row
										+ '" />';
								}
							},
							{
								"mData" : "travelExpenses", //ค่าใช้จ่ายในการเดินทาง
								"sWidth" : "10px",
								"mRender" : function(data,
									type, row, index) {
									return '<input class="form-control number2" style="width: 25mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" id="travelExpenses'
										+ index.row
										+ '"   />';
								}
							},
							{
								"mData" : "userSum",// จำนวนบุคคลากรร่วม
								"sWidth" : "10px",
								"mRender" : function(data,
									type, row, index, num) {
									return '<input class="form-control number3" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="" id="userSum'
										+ index.row
										+ '"   />';
								}
							},
							{
								"mData" : "sum", //รวมเงิน
								"sWidth" : "20px",
								"mRender" : function(data,
									type, row, index) {
									return '<input class="form-control sum" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="sum" id="sum'
										+ index.row
										+ '" />';
								}
							},
							{
								"mData" : "sumPerPerson", //รวมเงิน
								"sWidth" : "20px",
								"mRender" : function(data,
									type, row, index) {
									return '<input class="form-control sum" style="width: 25mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="sumPerPerson" id="sumPerPerson'
										+ index.row
										+ '" />';
								}
							},
							{
								"mData" : "vehicleC", //หมายเหตุ
								"sWidth" : "340px",
								"mRender" : function(data,
									type, row, index) {
									return '<input class="form-control" style="width: 150mm;height: 7mm" type="text" id="vehicleC'
										+ index.row
										+ '" />';
								}
							},
							{
								"mData" : "",
								"sWidth" : "10px",
								"mRender" : function(data,
									type, row, index) {
									return '<a class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></a>';
								}
							}]
					});
					$('#travelTable').on('click', 'tr', function() {
						$(this).toggleClass('selected');	
					});		
					$('#buttonAdd2').click(function() {
						var datas = tableTravel.rows('.selected').data();
						tableSelectTravel.rows.add(datas).draw(false);
						tableTravel.rows('.selected').remove().draw();
						console.log(datas);		
						var num = $('#addUser').DataTable().rows().data().length;
						$('#userSum').text(num + ' คน');

					});
					$('#addTravel').on('click', 'a', function() {
						tableSelectTravel.row( $(this).parents('tr') ).remove().draw();
					});
//					$('#saveExpenseEstimate').click(function() {
//						console.log("");
//						var d ;
//						var inputdata = [];
//						for (var i = 0; i < tableSelectTravel.data().length; i++) {
//							 d = tableSelectTravel.data()[i];
//							console.log(d);
//							d.numberPer = $("#numberPer"+i).val();
//							d.travelExpenses = $("#travelExpenses"+i).val();
//							d.userSum = $("#userSum"+i).val();
//							d.sum = $("#sum"+i).val();
//							d.vehicleC = $("#vehicleC"+i).val();
//							inputdata.push(d);
//						}				
//						$.ajax({
//							type : "POST",
//							url : "/insertTravelEstimate",
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

					//รถไปราชการ
					var tableTravel1 = $('#travelTable1').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxSource" : "/travel1",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							className: 'select-checkbox',
							"mRender" : function(data,
									type, row, index) {
							return '';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					//รถไปราชการ
					var tableSelectTravel1 = $('#addTravel1').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxDataProp" : "",
						"aoColumns" : [
							{
								"mData" : "travelId",
								"sWidth" : "20px",
							},
							{
								"mData" : "vehicleName",
								"sWidth" : "100px",
							},
							{	//ระยะทาง
								"mData" : "distance",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control number1" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" id="distance'
											+ index.row
											+ '" />';
								}
							},
							{	//เที่ยว
								"mData" : "numberPer",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control number2" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" id="numberPer'
											+ index.row
											+ '"   value="2"/>';
								}
							},
							{	//ค่าน้ำมัน
								"mData" : "fuelCost",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number3" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="" id="fuelCost'
											+ index.row
											+ '"   />';
								}
							},
							{	//อัตราการกินค่าเชื้อเพลิง
								"mData" : "rateFuelCost",
								"sWidth" : "10px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number4" style="width: 15mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="" id="rateFuelCost'
											+ index.row
											+ '" value="7"  />';
								}
							},
							{	//รวมค่าเชื้อเพลิง
								"mData" : "fuelCostSum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control sum1" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="fuelCostSum'
											+ index.row
											+ '" />';
								}
							},
							{	//ค่าทางด่วน
								"mData" : "expresswayExpensesSum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number5" style="width: 20mm;height: 7mm" type="text" OnKeyPress="return chkNumber(this)" name="" id="expresswayExpensesSum'
											+ index.row
											+ '"   />';
								}
							},
							{	//รวมทั้งหมด
								"mData" : "sum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control sum" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="sum'
											+ index.row
											+ '" />';
								}
							},
							{
								"mData" : "vehicleC",
								"sWidth" : "500px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control" style="width: 100mm;height: 7mm" type="text" id="vehicleC'
											+ index.row
											+ '" />';
								}
							},
							{
								"mData" : "",
								"sWidth" : "10px",
								"mRender" : function(data,
									type, row, index) {
									return '<a class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></a>';
								}
							}]
					});
					$('#travelTable1').on('click', 'tr', function() {
						$(this).toggleClass('selected');	
					});		
					$('#buttonAdd3').click(function() {
						var datas = tableTravel1.rows('.selected').data();
						tableSelectTravel1.rows.add(datas).draw(false);
						tableTravel1.rows('.selected').remove().draw();
						console.log(datas);						
					});
					$('#addTravel1').on('click', 'a', function() {
						tableSelectTravel1.row( $(this).parents('tr') ).remove().draw();
					});
//					$('#saveExpenseEstimate').click(function() {
//						console.log("");
//						var d ;
//						var inputdata = [];
//						for (var i = 0; i < tableSelectTravel1.data().length; i++) {
//							d = tableSelectTravel1.data()[i];
//							console.log(d);
//							d.distance = $("#distance"+i).val();
//							d.numberPer = $("#numberPer"+i).val()
//							d.fuelCost = $("#fuelCost"+i).val();
//							d.rateFuelCost = $("#rateFuelCost"+i).val();
//							d.fuelCostSum = $("#fuelCostSum"+i).val();
//							d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
//							d.sum = $("#sum"+i).val();
//							d.vehicleC = $("#vehicleC"+i).val();
//							inputdata.push(d);
//						}				
//						$.ajax({
//							type : "POST",
//							url : "/insertTravelExpensesOfficialCar",
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
					
					//รถส่วนตัว
					var tableTravel2 = $('#travelTable2').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxSource" : "/travel1",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							className: 'select-checkbox',
							"mRender" : function(data,
									type, row, index) {
							return '';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					//รถส่วนตัว
					var tableSelectPrivateCar  = $('#addPrivateCar').DataTable({
						responsive	: true,
						"searching"	  : false, 
					    "lengthChange": false,
						"bInfo" : false,
						"ordering": false,
						"sAjaxDataProp" : "",
						"aoColumns" : [
								{
									"mData" : "travelId",
									"sWidth" : "20px",
								},
								{
									"mData" : "vehicleName",
									"sWidth" : "100px",
								},
								{	//ระยะทาง
									"mData" : "distance",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control number1" style="width: 20mm;height: 7mm" type="number" id="distance'
												+ index.row
												+ '" />';
									}
								},
								{	//เที่ยว
									"mData" : "numberPer",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control number2" style="width: 20mm;height: 7mm" type="number" id="numberPer'
												+ index.row
												+ '"  value="2" />';
									}
								},
								{	//อัตราการกินค่าเชื้อเพลิง
									"mData" : "rateFuelCost",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number3" style="width: 20mm;height: 7mm" type="number" name="" id="rateFuelCost'
												+ index.row
												+ '"  value="4" />';
									}
								},
								{	//รวมค่าเชื้อเพลิง
									"mData" : "fuelCostSum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control sum1" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="fuelCostSum'
												+ index.row
												+ '" />';
									}
								},
								{	//ค่าทางด่วน
									"mData" : "expresswayExpensesSum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number4" style="width: 20mm;height: 7mm" type="number" name="" id="expresswayExpensesSum'
												+ index.row
												+ '"   />';
									}
								},
								{	//รวมทั้งหมด
									"mData" : "sum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control sum" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="sum'
												+ index.row
												+ '" />';
									}
								},
								{
									"mData" : "vehicleC",
									"sWidth" : "500px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control" style="width: 100mm;height: 7mm" type="text" id="vehicleC'
												+ index.row
												+ '" />';
									}
								},
								{
									"mData" : "",
									"sWidth" : "10px",
									"mRender" : function(data,
										type, row, index) {
										return '<a class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></a>';
									}
								}]
					});
					$('#travelTable2').on('click', 'tr', function() {
						$(this).toggleClass('selected');	
					});		
					$('#buttonPrivateCar').click(function() {
						var datas = tableTravel2.rows('.selected').data();
						tableSelectPrivateCar.rows.add(datas).draw(false);
						tableTravel2.rows('.selected').remove().draw();
						console.log(datas);		
					});
					$('#addPrivateCar').on('click', 'a', function() {
						tableSelectPrivateCar.row( $(this).parents('tr') ).remove().draw();
					});
//					$('#saveExpenseEstimate').click(function() {
//						console.log("");
//						var d ;
//						var inputdata = [];
//						for (var i = 0; i < tableSelectPrivateCar.data().length; i++) {
//							d = tableSelectPrivateCar.data()[i];
//							console.log(d);
//							d.distance 		= $("#distance"+i).val();
//							d.numberPer 	= $("#numberPer"+i).val()
//							d.rateFuelCost	= $("#rateFuelCost"+i).val();
//							d.fuelCostSum 	= $("#fuelCostSum"+i).val();
//							d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
//							d.sum = $("#sum"+i).val();
//							d.vehicleC = $("#vehicleC"+i).val();
//							inputdata.push(d);
//						}				
//						$.ajax({
//							type : "POST",
//							url : "/insertTravelExpensesPrivateCar",
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

