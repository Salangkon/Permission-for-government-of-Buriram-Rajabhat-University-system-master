function dateDiff() {
	// คำนวน ว/ด/ป
	
	var myVar1 = document.getElementById('backDate').value;
	var myVar2 = document.getElementById('goDate').value;
	var myVar3 = document.getElementById('backTime').value;
	var myVar4 = document.getElementById('goTime').value;

	var date1 = new Date(myVar1);
	var date2 = new Date(myVar2);
	var timeDiff = Math.abs(date2.getTime() - date1.getTime());
	var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
	// var diffTimes = Math.ceil(timeDiff / (1000 * 3600 ));

	var strTime2 = new Date(myVar1+" "+myVar3);
	var strTime1 = new Date(myVar2+" "+myVar4);

	var myDate2 = new Date(strTime2);
	var timeStamp2 = myDate2.getTime();

	var myDate1 = new Date(strTime1);
	var timeStamp1 = myDate1.getTime();

	var timeDiff = (timeStamp2 - timeStamp1) / 1000;

	var minutesDiff = timeDiff / 60;
	var minutesRemain = minutesDiff % 60;

	var hoursDiff = (minutesDiff - minutesRemain) / 60;
	var minutesRemainT = (minutesRemain / 100)
	var diffTimesHours = (minutesRemainT + hoursDiff)

	var days = 0;
	for (var i = 0; i <= diffDays; i++) {
		var a = diffTimesHours - 6;
		if (a >= 12) {
			days = days + 1;
			diffTimesHours = diffTimesHours - 24;
		} else if (a >= 0) {
			days = days + 0.5;
			diffTimesHours = diffTimesHours - 6;
		} else {
			break;
		}
	}
	console.log(days);
	// alert(diffDays);
	for (var i = 0; i <= days; i++) {
		if (days > 0.5) {
			night = days - 1;
		} else {
			night = 0;
		}
	}
	$('#night').val(parseFloat(night));

	$('#DayTotal').val(parseFloat(days).toFixed(1));

	$("#TimeTotal").val(hoursDiff + '.' + minutesRemain);
	
	
}
function otherSum1() {
	//ค่าใช้จายอื่นๆ
//	otherSum = "";
	$('#otherSum').val(parseFloat(otherSum).toFixed());	
}			
