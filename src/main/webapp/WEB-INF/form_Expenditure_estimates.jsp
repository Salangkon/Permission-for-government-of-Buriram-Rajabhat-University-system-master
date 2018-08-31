<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Expenditure estimates</title>
<link rel="stylesheet" href="/css/tables.css">
</head>
<body>

<form action="" method="post" name="">
<fieldset>
<legend style="margin-left: 10%" >ประมาณการรายจ่าย</legend>
<div style="margin-left: 15%;margin-right: 15%">
<table id="customers" style="margin-bottom: 5mm;">
	<tr>
    <th rowspan="2">ชื่อ - สกุล </th>
    <th colspan="3">ค่าเบี้ยเลี้ยงการเดินทาง</th>
	<th rowspan="2"></th>
	<th colspan="3">ค่าที่พัก</th>
    <th rowspan="2" align="center">รวม</th>

	</tr> 
	<tr>
		<th>เบี้ยเลี้ยง<br>วันละ</th>
		<th>จำนวน<br>วัน</th>
		<th>จำนวน<br>เงิน</th>
        <th>อัตรา<br>วันละ</th>
		<th>จำนวน<br>วัน</th>
		<th>จำนวนเงิน<br>บาท</th>
	</tr>
    
	
	<tr>
		<td></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"><input type="text" size="7"></td>
		<td align="center"></td>
	</tr>
</table>

<table id="customers" style="margin-bottom: 5mm;">
	<tr>
    <th >รายการ</th>
	<th >จำนวนเงิน</th>
	<th >หมายเหตุ</th>
	</tr>  
	<tr>
		<td>ค่ารถไฟ</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
    <tr>
        <td>ค่ารถยนต์ปรับอากาศ</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
    <tr>
        <td>แท็คซี่</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
    <tr>
        <td>สามล้อ/รับจ้าง</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
    <tr>
        <td>น้ำมันเชื้อเพลิง</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
    <tr>
        <td>ค่าลงทะเบียน</td>
 		<td align="center"><input type="text" size="10"></td>
		<td align="center"><textarea rows="3" cols="25"></textarea></td>
	</tr>
	<tr>
		<td align="center">รวม</td>
 		<td align="center"></td>
		<td ></td>
	</tr>
</table>

</div>
</fieldset>
</form>


</body>
</html>