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

////insert
//function insertConfirm() {
////	console.log(warranty)
//	var userBean = {
//			permissionDate	: $('#userUsername').val(),
//			name			: $('#name').val(),
//			faculty			: $('#faculty').val(),
//			department		: $('#department').val(),
//			position		: $('#position').val(),
//			subPosition		: $('#subPosition').val(),
//			status			: $('#status').val(),
//			object			: $('#object').val(),
//			destinationName	: $('#destinationName').val(),
//			province		: $('#province').val(),
//			amphur			: $('#amphur').val(),
//			district		: $('#district').val(),
//			goDate			: $('#userUsername').val(),
//			goTime			: $('#userUsername').val(),
//			backDate		: $('#userUsername').val(),
//			backTime		: $('#userUsername').val(),
//			budget			: $('#budget').val(),
//			budgetExpenses	: $('#budgetExpenses').val(),
//			budgetBy		: $('#budgetBy').val(),
//			budgetProject	: $('#budgetProject').val(),
//			budgetPass		: $('#budgetPass').val(),
//			travel			: $('#travel').val(),
//			travelIdcard	: $('#travelIdcard').val(),
//			travelDriver	: $('#travelDriver').val(),
//			commitA			: $('#commitA').val(),
//			commitADt		: $('#commitADt').val(),
//			commitB			: $('#commitB').val(),
//			commitBDt		: $('#commitBDt').val(),
//			commitC			: $('#commitC').val(),
//			commitCDt		: $('#commitCDt').val(),
//			commitD			: $('#commitD').val(),
//			commitDDt		: $('#commitDDt').val(),
//	}
//
//	$.ajax({
//		type : "POST",
//		url : "/insertPermisstion",
//		contentType : "application/json; charset=utf-8",
//		data : JSON.stringify(userBean),
//		dataType : "json",
//		success : function(msg) {
//		console.log('Success')
//		 
//		}
//	});
//}