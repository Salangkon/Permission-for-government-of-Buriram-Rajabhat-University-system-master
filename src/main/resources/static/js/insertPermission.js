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
		status = "ผู้บริหาร";
	});
	$("#status2").change(function(){
		status = "ผู้สอน";
	});
	$("#status3").change(function(){
		status = "ผู้สนับสนุนการสอน";
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
		commitA	 = "มี";
	});
	$("#commitA2").change(function(){
		commitA	 = "ไม่มี";
	});
	//commitB
	$("#commitB1").change(function(){
		commitB	 = "มี";
	});
	$("#commitB2").change(function(){
		commitB	 = "ไม่มี";
	});
	//commitC
	$("#commitC1").change(function(){
		commitC	 = "มี";
	});
	$("#commitC2").change(function(){
		commitC	 = "ไม่มี";
	});
	//commitD
	$("#commitD1").change(function(){
		commitD	 = "มี";
	});
	$("#commitD2").change(function(){
		commitD	 = "ไม่มี";
	});
	
	//insertPermission
	$('#saveExpenseEstimate').click(function(){
	
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
	
	//insertExpenseSumary
	$('#saveExpenseEstimate').click(function() {

		var esBean = {
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

		$.ajax({
			type : "POST",
			url : "/insertExpenseSumary",
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