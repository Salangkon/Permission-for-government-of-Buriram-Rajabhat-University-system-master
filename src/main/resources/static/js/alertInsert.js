function insertConfirm()
{

//	if(document.welcome.userIdcard.value == "")
//	{
//		alert('Please input Idcard');
//		document.welcome.focus();
//		return false;
//	}	

	if(document.welcome.userPassword.value == "")
	{
		alert('Please input Password');
		document.welcome.userPassword.focus();		
		return false;
	}	

	if(document.welcome.userFname.value == "")
	{
		alert('Please input Fname');
		document.welcome.userFname.focus();		
		return false;
	}	
	
	if(document.welcome.userLname.value == "")
	{
		alert('Please input Lname');
		document.welcome.userLname.focus();		
		return false;
	}	else{
		return true;
	}
	
	/*if(document.welcome.facId.value == "")
	{
		alert('Please input faculty');
		document.welcome.facId.focus();		
		return false;
	}	
	
	if(document.welcome.depId.value == "")
	{
		alert('Please input Department');
		document.welcome.depId.focus();		
		return false;
	}
	
	if(document.welcome.posId.value == "")
	{
		alert('Please input Position');
		document.welcome.posId.focus();		
		return false;
	}
	
	
	if(document.welcome.stepId.value == "")
	{
		alert('Please input Step');
		document.welcome.stepId.focus();		
		return false;
	}*/
	
//	if(document.welcome.roleId.value == "")
//	{
//		alert('Please input role');
//		document.welcome.roleId.focus();		
//		return false;
//	}

//	document.welcomeUser.submit();
}