$(document).ready(function() {
	//ข้อมูลบุคคลากร คณะ สาขา ตำแหน่ง ระดับ
	var table = $('#userPersonnelTable').DataTable({
		"searching"	  : false, 
	    "lengthChange": false,
		"bInfo" : false,
		"ordering": false,
		"sAjaxSource" : "/userPersonnel",
		"sAjaxDataProp" : "",
		"aoColumns" : [ {
			"mData" : "facultyName"
		}, {
			"mData" : "departmentName"
		}, {
			"mData" : "positionName"
		}, {
			"mData" : "subPositionName"
		}
		]
	});
});