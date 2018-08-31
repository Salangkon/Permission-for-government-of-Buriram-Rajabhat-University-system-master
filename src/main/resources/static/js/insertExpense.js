$(document).ready(function() {
	
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

	//คำนวณ รถส่วนตัว 
	$('#addTravel1').on('change','input', function() { 
		var sum6 = $(this).parent().parent().find('td')[6];
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
			$(sum6).find('input').val((total).toFixed(0));
		}else{
			$(sum6).find('input').val(0);
		}
 
	});
	//คำนวณ ค่าทางด่วน  รถส่วนตัว 
	$('#addTravel1').on('change','input', function() { 
		var sum9 = $(this).parent().parent().find('td')[9];
		var number7 = $(this).parent().parent().find('td')[7];
		var number8= $(this).parent().parent().find('td')[8];
		var num7 = $(number7).find('input.number7').val();
		var num8 = $(number8).find('input.number8').val();
		if(''!=num7 && ''!=num8 ){
			var total = (num7)*(num8);
			$(sum9).find('input').val(total);
		}else{
			$(sum9).find('input').val(0);
		}
 
	});
	//คำนวณ ค่าทางด่วน รถส่วนตัว สรูป
	$('#addTravel1').on('change','input', function() { 
		var sum10 = $(this).parent().parent().find('td')[10];
		var sum6 = $(this).parent().parent().find('td')[6];
		var sum9= $(this).parent().parent().find('td')[9];
		var sum6 = $(sum6).find('input.sum6').val();
		var sum9 = $(sum9).find('input.sum9').val();
		if(''!=sum6 && ''!=sum9 ){
			var total = parseFloat(sum6)+parseFloat(sum9);
			$(sum10).find('input').val(total.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		}else{
			$(sum10).find('input').val(0);
		}
	});

	//คำนวณ รถขอไปราชการ
	$('#addTravel2').on('change','input', function() { 
		var sum6 = $(this).parent().parent().find('td')[6];
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
			$(sum6).find('input').val((total).toFixed(0));
		}else{
			$(sum6).find('input').val(0);
		}
 
	});
	//คำนวณ ค่าทางด่วน รถขอไปราชการ
	$('#addTravel2').on('change','input', function() { 
		var sum9 = $(this).parent().parent().find('td')[9];
		var number7 = $(this).parent().parent().find('td')[7];
		var number8= $(this).parent().parent().find('td')[8];
		var num7 = $(number7).find('input.number7').val();
		var num8 = $(number8).find('input.number8').val();
		if(''!=num7 && ''!=num8 ){
			var total = (num7)*(num8);
			$(sum9).find('input').val(total);
		}else{
			$(sum9).find('input').val(0);
		}
 
	});
	//คำนวณ ค่าทางด่วน รถขอไปราชการ สรูป
	$('#addTravel2').on('change','input', function() { 
		var sum10 = $(this).parent().parent().find('td')[10];
		var sum6 = $(this).parent().parent().find('td')[6];
		var sum9= $(this).parent().parent().find('td')[9];
		var sum6 = $(sum6).find('input.sum6').val();
		var sum9 = $(sum9).find('input.sum9').val();
		if(''!=sum6 && ''!=sum9 ){
			var total = parseFloat(sum6)+parseFloat(sum9);
			$(sum10).find('input').val(total.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		}else{
			$(sum10).find('input').val(0);
		}
	});

	//คำนวณ ค่าเบี้ยเลี้ยง
	$('#addUser').on('change','input', function() { 
		var sum6 = $(this).parent().parent().find('td')[6];
		var number1 = $(this).parent().parent().find('td')[4];
		var number2= $(this).parent().parent().find('td')[5];
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
		var sum9 = $(this).parent().parent().find('td')[9];
		var number3 = $(this).parent().parent().find('td')[7];
		var number4= $(this).parent().parent().find('td')[8];
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
		var sum12 = $(this).parent().parent().find('td')[12];
		var sum6 = $(this).parent().parent().find('td')[6];
		var sum9 = $(this).parent().parent().find('td')[9];
		var sum10 = $(this).parent().parent().find('td')[10];
		var sum11 = $(this).parent().parent().find('td')[11];
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
					"sAjaxSource" : "/personnel",
					"sAjaxDataProp" : "",
					"aoColumns" : [ {
						"mData" : "personnelId" ,
						"mRender" : function(data,
								type, row, index) {
						return '<input class="form-control"  type="checkbox" />';
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
				},
				{
					"mData" : "allowence",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number1" style="width: 20mm;height: 7mm" type="number" id="allowence' 
							+ index.row
							+ '" value="'+row.allowence+'"/>';

					}
				},
				{
					"mData" : "allowencePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number2" style="width: 16mm;height: 7mm" type="number" name="allowencePerday" id="allowencePerday'
							+ index.row
							+ '" />';

					}
				},
				{
					"mData" : "allowenceSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum6" disabled readonly="true"  type="text"  style="width: 23mm;height: 7mm" name="allowenceSum" id="allowenceSum'
							+ index.row
							+ '" value="0" />';

					}
				},
				{
					"mData" : "rentDate",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number3" type="number" style="width: 20mm;height: 7mm" id="rentDate'
							+ index.row
							+ '"  value="'+row.rentDate+'"/>';

					}
				},
				{
					"mData" : "rentDatePerday",
					"sWidth" : "50px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control number4" type="number" style="width: 16mm;height: 7mm" name="rentDatePerday" id="rentDatePerday'
							+ index.row
							+ '" />';

					}
				},	
				{
					"mData" : "rentDateSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum9" disabled readonly="true"  type="text" style="width: 22mm;height: 7mm" name="rentDateSum" id="rentDateSum'
							+ index.row
							+ '" value="0"/>';
					}										
				},
				{
					"mData" : "travelSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum10"  type="number" style="width: 22mm;height: 7mm" name="travelSum" id="travelSum'
							+ index.row 
							+ '" value="0" />';
					}										
				},
				{
					"mData" : "otherSum",
					"sWidth" : "60px" ,
					"mRender" : function(data,
						type, row, index) {
					return '<input class="form-control sum11"  type="number" style="width: 22mm;height: 7mm" name="otherSum" id="otherSum'
							+ index.row 
							+ '" value="0" />';
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
						"sWidth" : "10px" ,
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
					

					$('#saveExpenseEstimate').click(function() {
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
							d.travelSum = $("#travelSum"+i).val(); //ค่าที่พัก
							d.otherSum = $("#otherSum"+i).val(); //จำนวนที่พัก/วัน
							d.expenseEstimateSum = $("#expenseEstimateSum"+i).val(); //ค่าที่พัก
							inputdata.push(d);
						}

						$.ajax({
							type : "POST",
							url : "/insertExpenseEstimate",
							data : JSON.stringify(inputdata),
							dataType : "json",
							async : false,
							contentType : "application/json; charset=utf-8",
							success : function(res) {
								// console.log(res)
								window.location.href = res.page;
							},
							error : function() {
								window.location.href = "Ask_la";
							}
						});

					});
				
					//พาหนะ
					var tableTravel = $('#travelTable').DataTable({
						"sAjaxSource" : "/travel",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							"mRender" : function(data,
									type, row, index) {
							return '<input class="form-control"  type="checkbox" />';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					var tableSelectTravel = $('#addTravel').DataTable({
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
												{
													"mData" : "numberPer", //จำนวนเที่ยว
													"sWidth" : "20px",
													"mRender" : function(data,
															type, row, index) {
														return '<input class="form-control number1" style="width: 30mm;height: 7mm" type="number" id="numberPer'
																+ index.row
																+ '" />';
													}
												},
												{
													"mData" : "travelExpenses", //ค่าใช้จ่ายในการเดินทาง
													"sWidth" : "20px",
													"mRender" : function(data,
															type, row, index) {
														return '<input class="form-control number2" style="width: 30mm;height: 7mm" type="number" id="travelExpenses'
																+ index.row
																+ '"   />';
													}
												},
												{
													"mData" : "userSum",// จำนวนบุคคลากรร่วม
													"sWidth" : "20px",
													"mRender" : function(data,
															type, row, index, num) {
														return '<input class="form-control number3" style="width: 30mm;height: 7mm" type="number" name="" id="userSum'
																+ index.row
																+ '"   />';
													}
												},
												{
													"mData" : "sum", //รวมเงิน
													"sWidth" : "20px",
													"mRender" : function(data,
															type, row, index) {
														return '<input class="form-control sum" style="width: 40mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="sum" id="sum'
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
					$('#saveExpenseEstimate').click(function() {
						console.log("");
						var d ;
						var inputdata = [];
						for (var i = 0; i < tableSelectTravel.data().length; i++) {
							 d = tableSelectTravel.data()[i];
							console.log(d);
							d.numberPer = $("#numberPer"+i).val();
							d.travelExpenses = $("#travelExpenses"+i).val();
							d.userSum = $("#userSum"+i).val();
							d.sum = $("#sum"+i).val();
							d.vehicleC = $("#vehicleC"+i).val();
							inputdata.push(d);
						}				
						$.ajax({
							type : "POST",
							url : "/insertTravelEstimate",
							data : JSON.stringify(inputdata),
							dataType : "json",
							async : false,
							contentType : "application/json; charset=utf-8",
							success : function(res) {
								// console.log(res)
								window.location.href = res.page;
							},
							error : function() {
								window.location.href = "Ask_la";
							}
						});

					});

					//พาหนะ รถส่วนตัว
					var tableTravel1 = $('#travelTable1').DataTable({
						"sAjaxSource" : "/travel1",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							"mRender" : function(data,
									type, row, index) {
							return '<input class="form-control"  type="checkbox" />';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					//รถส่วนตัว
					var tableSelectTravel1 = $('#addTravel1').DataTable({
						
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
											+ '"   />';
								}
							},
							{	//ค่าน้ำมัน
								"mData" : "fuelCost",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number3" style="width: 20mm;height: 7mm" type="number" name="" id="fuelCost'
											+ index.row
											+ '"   />';
								}
							},
							{	//หารด้วย
								"mData" : "divide",
								"sWidth" : "10px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number4" style="width: 15mm;height: 7mm" type="number" name="" id="divide'
											+ index.row
											+ '" value="7"  />';
								}
							},
							{	//รวมค่าเชื้อเพลิง
								"mData" : "fuelCostSum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control sum6" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="fuelCostSum'
											+ index.row
											+ '" />';
								}
							},
							{	//ค่าทางด่วน/ครั้งละ/บาท
								"mData" : "expresswayExpenses",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number7" style="width: 20mm;height: 7mm" type="number" name="" id="expresswayExpenses'
											+ index.row
											+ '"   />';
								}
							},
							{   //ค่าทางด่วน/ครั้ง
								"mData" : "expresswayNumberPer",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index, num) {
									return '<input class="form-control number8" style="width: 20mm;height: 7mm" type="number" name="" id="expresswayNumberPer'
											+ index.row
											+ '" value=""  />';
								}
							},
							{	//รวม ค่าทางด่วน
								"mData" : "expresswayExpensesSum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control sum9" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="expresswayExpensesSum'
											+ index.row
											+ '" />';
								}
							},
							{	//รวมทั้งหมด
								"mData" : "sum",
								"sWidth" : "20px",
								"mRender" : function(data,
										type, row, index) {
									return '<input class="form-control sum10" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="sum'
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
					$('#saveExpenseEstimate').click(function() {
						console.log("");
						var d ;
						var inputdata = [];
						for (var i = 0; i < tableSelectTravel1.data().length; i++) {
							d = tableSelectTravel1.data()[i];
							console.log(d);
							d.distance = $("#distance"+i).val();
							d.fuelCost = $("#fuelCost"+i).val();
							d.divide = $("#divide"+i).val();
							d.fuelCostSum = $("#fuelCostSum"+i).val();
							d.expresswayExpenses = $("#expresswayExpenses"+i).val();
							d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
							d.sum = $("#sum"+i).val();
							d.vehicleC = $("#vehicleC"+i).val();
							inputdata.push(d);
						}				
						$.ajax({
							type : "POST",
							url : "/insertTravelExpensesFuelCost",
							data : JSON.stringify(inputdata),
							dataType : "json",
							async : false,
							contentType : "application/json; charset=utf-8",
							success : function(res) {
								// console.log(res)
								window.location.href = res.page;
							},
							error : function() {
								window.location.href = "Ask_la";
							}
						});

					});
					
					//รถรถขอไปราชการ
					var tableTravel2 = $('#travelTable2').DataTable({
						"sAjaxSource" : "/travel1",
						"sAjaxDataProp" : "",
						"aoColumns" : [ {
							"mData" : "travelId" ,
							"mRender" : function(data,
									type, row, index) {
							return '<input class="form-control"  type="checkbox" />';
							}
						}, {
							"mData" : "vehicleName"
						} ]
					});
					//รถรถขอไปราชการ
					var tableSelectTravel2 = $('#addTravel2').DataTable({
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
												+ '"   />';
									}
								},
								{	//ค่าน้ำมัน
									"mData" : "fuelCost",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number3" style="width: 20mm;height: 7mm" type="number" name="" id="fuelCost'
												+ index.row
												+ '"   />';
									}
								},
								{	//หารด้วย
									"mData" : "divide",
									"sWidth" : "10px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number4" style="width: 15mm;height: 7mm" type="number" name="" id="divide'
												+ index.row
												+ '" value="7"  />';
									}
								},
								{	//รวมค่าเชื้อเพลิง
									"mData" : "fuelCostSum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control sum6" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="fuelCostSum'
												+ index.row
												+ '" />';
									}
								},
								{	//ค่าทางด่วน/ครั้งละ/บาท
									"mData" : "expresswayExpenses",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number7" style="width: 20mm;height: 7mm" type="number" name="" id="expresswayExpenses'
												+ index.row
												+ '"   />';
									}
								},
								{   //ค่าทางด่วน/ครั้ง
									"mData" : "expresswayNumberPer",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index, num) {
										return '<input class="form-control number8" style="width: 20mm;height: 7mm" type="number" name="" id="expresswayNumberPer'
												+ index.row
												+ '" value=""  />';
									}
								},
								{	//รวม ค่าทางด่วน
									"mData" : "expresswayExpensesSum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control sum9" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="expresswayExpensesSum'
												+ index.row
												+ '" />';
									}
								},
								{	//รวมทั้งหมด
									"mData" : "sum",
									"sWidth" : "20px",
									"mRender" : function(data,
											type, row, index) {
										return '<input class="form-control sum10" style="width: 30mm;height: 7mm" readonly="true" type="text" placeholder="รวม" name="" id="sum'
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
								}]
					});
					$('#travelTable2').on('click', 'tr', function() {
						$(this).toggleClass('selected');	
					});		
					$('#buttonAdd4').click(function() {
						var datas = tableTravel2.rows('.selected').data();
						tableSelectTravel2.rows.add(datas).draw(false);
						tableTravel2.rows('.selected').remove().draw();
						console.log(datas);		

					});
					$('#saveExpenseEstimate').click(function() {
						console.log("");
						var d ;
						var inputdata = [];
						for (var i = 0; i < tableSelectTravel2.data().length; i++) {
							d = tableSelectTravel2.data()[i];
							console.log(d);
							d.distance = $("#distance"+i).val();
							d.fuelCost = $("#fuelCost"+i).val();
							d.divide = $("#divide"+i).val();
							d.fuelCostSum = $("#fuelCostSum"+i).val();
							d.expresswayExpenses = $("#expresswayExpenses"+i).val();
							d.expresswayExpensesSum = $("#expresswayExpensesSum"+i).val();
							d.sum = $("#sum"+i).val();
							d.vehicleC = $("#vehicleC"+i).val();
							inputdata.push(d);
						}				
						$.ajax({
							type : "POST",
							url : "/insertTravelExpensesFuelCost",
							data : JSON.stringify(inputdata),
							dataType : "json",
							async : false,
							contentType : "application/json; charset=utf-8",
							success : function(res) {
								// console.log(res)
								window.location.href = res.page;
							},
							error : function() {
								window.location.href = "Ask_la";
							}
						});

					});
								
					
});//end
