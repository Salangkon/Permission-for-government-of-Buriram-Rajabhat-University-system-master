
// <!-- เรียกใช้รถ -->
function ShowReg(op) {
  document.getElementById('Manual Promotion1').style.display='none';
  document.getElementById('Manual Promotion1').style.display='none';
  document.getElementById('Manual Promotion2').style.display='none';
  document.getElementById('Manual Promotion3').style.display='none';
  if (op == "1") {
    document.getElementById('Manual Promotion1').style.display="block";
  }
  if (op == "2") {
    document.getElementById('Manual Promotion2').style.display="block";
  }
  if (op == "3") {
	document.getElementById('Manual Promotion3').style.display="block";
  }
  }

function ShowRegOther(op) {
	  document.getElementById('ManualOther Promotion1').style.display='none';
	  document.getElementById('ManualOther Promotion1').style.display='none';
	  if (op == "1") {
	    document.getElementById('ManualOther Promotion1').style.display="block";
	  }
	 }