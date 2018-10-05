var bDisbursedBy = "";
var bStartTravel = "";
var bBackTravel = "";

$(document).ready(function() {
	
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

			bRoad 		: $('#bRoad').val(),
			district 	: $('#district').val(),
			bGoDate 	: $('#bGoDate').val(),
			bGoTime 	: $('#bGoTime').val(),
			bBackDate 	: $('#bBackDate').val(),
			bBackTime 	: $('#bBackTime').val(),

			bDaySum 	: $('#bDaySum ').val(),
			bTimeSum : $('#bTimeSum ').val(),
		}

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
		
	});
	
	//insertExpenseSumary
	$('#saveBack').click(function() {

		var esBean = {
			permissionId : $('#permissionId').val(),
			userSumTotal : $('#userSumTotal').text(),
			allowenceSumTotal : $('#allowenceSumTotal').text(),
			rentDateSumTotal : $('#rentDateSumTotal').text(),
			travelSumTotal : $('#travelSumTotal').text(),
			otherSumTotal : $('#otherSumTotal').text(),
			expenseEstimateSumTotal : $('#expenseEstimateSumTotal').text(),

			allowencePerdayTotal : $('#allowencePerdayTotal').text(),
			rentDatePerdayTotal : $('#rentDatePerdayTotal').text(),
		}

		$.ajax({
			type : "POST",
			url : "/insertExpenseSumaryBack",
	        data: JSON.stringify(esBean),
	        dataType: "json",
	        async: false,
	        contentType: "application/json; charset=utf-8",
	        success: function (res) {
	        	console.log(res)
//	        	window.location.href = res.page;
	        },
			error : function() {
				window.location.href = "insertPermissionFail";
			}
		});

	});

});//end
