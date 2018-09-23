function dateDiff(){
//คำนวน ว/ด/ป
var myVar1 = document.getElementById('bBackDate').value;//prompt("Enter a start date: ")
var myVar2 = document.getElementById('bGoDate').value;//prompt("Enter a end date: ")

var date1 = new Date(myVar1);
var date2 = new Date(myVar2);
var timeDiff = Math.abs(date2.getTime() - date1.getTime());
var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24))+1; 
var diffTimes = Math.ceil(timeDiff / (1000 * 3600 )); 
var days = 0;
for(var i= 0 ; i  <=  diffDays ; i++ ){
	var a = diffTimes - 6;
	if(a >= 12){
		days = days + 1;
		diffTimes = diffTimes - 24;
	}else if(a > 0 ){
		days = days + 0.5;
		diffTimes = diffTimes - 6;
	}else{
		 break;
	}
}
console.log(days);
// alert(diffDays);
$('#bDayTotal').val(parseFloat(days).toFixed(1));

var strTime2=new Date(myVar1);
var strTime1=new Date(myVar2);

var myDate2=new Date(strTime2);
var timeStamp2=myDate2.getTime();

var myDate1=new Date(strTime1);
var timeStamp1=myDate1.getTime();

var timeDiff=(timeStamp2-timeStamp1)/1000;

var minutesDiff=timeDiff/60;
var minutesRemain=minutesDiff%60;

var hoursDiff=(minutesDiff-minutesRemain)/60;   
$("#bTimeTotal").val(hoursDiff+"."+minutesRemain);

}