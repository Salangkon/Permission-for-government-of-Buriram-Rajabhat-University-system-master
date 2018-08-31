$(document).ready(function() {
	
	//คำนวณ ค่าพาหนะ
	$('#TravelByPermission').on('change','input', function() { 
		var sum = $(this).parent().parent().find('td')[4];
		var number1 = $(this).parent().parent().find('td')[2];
		var number2= $(this).parent().parent().find('td')[3];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		if(''!=num1 && ''!=num2) {
			var total = (num1)*(num2);
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
		 $('#summary1').text(sum+" บาท");
	});
	
	//คำนวณ ค่าเบี้ยเลี้ยง
	$('#ExpenseByPermission').on('change','input', function() { 
		var sum1 = $(this).parent().parent().find('td')[6];
		var number1 = $(this).parent().parent().find('td')[4];
		var number2= $(this).parent().parent().find('td')[5];
		var num1 = $(number1).find('input.number1').val();
		var num2 = $(number2).find('input.number2').val();
		if(''!=num1 && ''!=num2) {
			var total = (num1)*(num2);
			$(sum1).find('input').val(total);
		}else{
			$(sum1).find('input').val(0);
		}
	});
	//คำนวณ ค่าที่พัก
	$('#ExpenseByPermission').on('change','input', function() { 
		var sum2 = $(this).parent().parent().find('td')[9];
		var number3 = $(this).parent().parent().find('td')[7];
		var number4= $(this).parent().parent().find('td')[8];
		var num3 = $(number3).find('input.number3').val();
		var num4 = $(number4).find('input.number4').val();
		if(''!=num3 && ''!=num4) {
			var total = (num3)*(num4);
			$(sum2).find('input').val(total);
		}else{
			$(sum2).find('input').val(0);
		}
	});
	
	//คำนวณ ค่าที่พัก ค่าเบี้ยเลี้ยง
	$('#ExpenseByPermission').on('change','input', function() { 
		var sum3 = $(this).parent().parent().find('td')[10];
		var sum1 = $(this).parent().parent().find('td')[6];
		var sum2 = $(this).parent().parent().find('td')[9];
		var sum1 = $(sum1).find('input.sum1').val();
		var sum2 = $(sum2).find('input.sum2').val();
		if(''!=sum1 && ''!=sum2) {
			var total = parseFloat(sum1)+ parseFloat(sum2);// parseFloat ตัวแปลค่า จาก Type String to int (parse เปลี่ยนค่า Type)
			$(sum3).find('input').val(total);
		}else{
			$(sum3).find('input').val(0);
		}
		var sumvalues = $("[name='userSum']");
		var sum = 0;
		for(var i = 0; i < sumvalues.length;i++){
			if($(sumvalues[i]).val() != ""){
				sum = sum + parseFloat($(sumvalues[i]).val());
			}
			
		}
		 $('#summary').text(sum+" บาท");
	});;

		var table = $('#userTable').DataTable({
				"sAjaxSource" : "/user",
				"sAjaxDataProp" : "",
				"aoColumns" : [ {
					"mData" : "userId" 
				}, {
					"mData" : "userFname"
				}, {
					"mData" : "userLname"
				}, {
					"mData" : "faculty"
				}, {
					"mData" : "department"
				}, {
					"mData" : "position"
				}, {
					"mData" : "subPosition"
				}]
			});
	
		var tableSelect = $('#ExpenseByPermission').DataTable({
					"sAjaxSource" : "/ExpenseByPermission",
					"sAjaxDataProp" : "",
					"aoColumns" : [{
						"mData" : "userId",
						"sWidth" : "50px" 
				},
				{
						"mData" : "userFname",
						"sWidth" : "170px" 
				},
				{
						"mData" : "userLname",
						"sWidth" : "170px" 
				},
				{
						"mData" : "subPosition",
						"sWidth" : "130px" 
				},
				{
						"mData" : "allowence",
						"sWidth" : "60px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control number1" type="number" id="allowence' 
								+ index.row
								+ '" value="240"/>';

						}
				},
				{
						"mData" : "allowencePerday",
						"sWidth" : "20px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control number2" type="number" id="allowencePerday'
								+ index.row
								+ '" value="'+row.allowencePerday+'" />';

						}
				},
				{
						"mData" : "allowenceSum",
						"sWidth" : "70px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control sum1" readonly="true" type="number" id="allowenceSum'
								+ index.row
								+ '" value="'+row.allowenceSum+'"/>';

						}
				},
				{
						"mData" : "rentDate",
						"sWidth" : "60px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control number3" type="number" id="rentDate'
								+ index.row
								+ '"  value="1800"/>';

						}
				},
				{
						"mData" : "rentDatePerday",
						"sWidth" : "20px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control number4" type="number" id="rentDatePerday'
								+ index.row
								+ '" value="'+row.rentDatePerday+'" />';

						}
				},	
				{
						"mData" : "rentDateSum",
						"sWidth" : "100px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control sum2" readonly="true" type="number" id="rentDateSum'
								+ index.row
								+ '" value="'+row.rentDateSum+'" />';
						}										
				},
				{
						"mData" : "userSum",
						"sWidth" : "170px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<input class="form-control sum3" readonly="true" type="number" name="userSum" id="userSum'
								+ index.row
								+ '" value="'+row.userSum+'"/>';
						}										
				},
				{
						"mData" : "",
						"sWidth" : "10px" ,
						"mRender" : function(data,
							type, row, index) {
						return '<button class="btn btn-danger" ><span class="glyphicon glyphicon-trash"> </span></button>';
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
		});
		 $('#ExpenseByPermission').on('click', 'button', function() {
			 $(this).parent().parent().remove().draw()
		});
		 
		 //พาหนะ
			var tableTravel = $('#travelTable').DataTable({
				"sAjaxSource" : "/travel",
				"sAjaxDataProp" : "",
				"aoColumns" : [ {
					"mData" : "id" 
				}, {
					"mData" : "travel"
				} ]
			});
			var tableSelectTravel = $('#TravelByPermission').DataTable( {
								"sAjaxSource" : "/TravelByPermission",
								"sAjaxDataProp" : "",
								"aoColumns" : [
										{
										"mData" : "id",
										"sWidth" : "20px" ,
										},
										{
											"mData" : "travel",
											"sWidth" : "100px" ,
										},
										{
											"mData" : "numberPer",
											"sWidth" : "100px" ,
											"mRender" : function(data,
													type, row, index) {
												return '<input class="form-control number1" type="number" id="numberPer'
														+ index.row
														+ '" value="'+row.numberPer+'" />';

											}
										},
										{
											"mData" : "travelExpenses",
											"sWidth" : "100px" ,
											"mRender" : function(data,
													type, row, index) {
												return '<input class="form-control number2" type="number" id="travelExpenses'
														+ index.row
														+ '" value="'+row.travelExpenses+'" />';

											}
										},
										{
											"mData" : "sum",
											"sWidth" : "100px" ,
											"mRender" : function(data,
													type, row, index) {
												return '<input class="form-control setSum" readonly="true" type="number" name="sum" id="sum'
														+ index.row
														+ '" value="'+row.sum+'" />';

											}
										},
										{
											"mData" : "vehicleC",
											"sWidth" : "340px" ,
											"mRender" : function(data,
													type, row, index) {
												return '<input class="form-control" type="text" id="vehicleC'
												+ index.row
												+ '" value="'+row.vehicleC+'" />';

											}
										},
										{
											"mData" : "",
											"sWidth" : "20px" ,
											"mRender" : function(data,
													type, row, index) {
												return '<button class="btn btn-danger" >ลบ</button>';
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
			});
			$('#TravelByPermission').on('click', 'button', function() {
				 $(this).parent().parent().remove().draw();
			});
		
});