function validate() {

	var userId = document.frm1.userId.value;
	var password = document.frm1.password.value;
	var uid=document.getElementById('txt');
	var pawd=document.getElementById('txt1');
	if (userId == "") {
		document.frm1.userId.placeholder="   Enter User Id";
		uid.title="Enter User Id";
		uid.style.borderColor='red';
		document.frm1.userId.focus();
		return false;
	} else if (password == "") {
		document.frm1.password.placeholder="   Enter Password";
		pawd.title="Enter Password";
		pawd.style.borderColor='red';
		document.frm1.password.focus();
		return false;
	}

	return (true);

}

function validate1() {

	var userId = document.frm5.userId.value;
	var password = document.frm5.password.value;
	var uid=document.getElementById('txt');
	var pawd=document.getElementById('txt1');
	if (userId == "") {
		document.frm5.userId.placeholder="   Enter User Id";
		uid.title="Enter User Id";
		uid.style.borderColor='red';
		document.frm5.userId.focus();
		return false;
	} else if (password == "") {
		document.frm5.password.placeholder="   Enter Password";
		pawd.title="Enter Password";
		uid.style.borderColor='yellow';
		pawd.style.borderColor='red';
		document.frm5.password.focus();
		return false;
	}

	return (true);

}

function validateBook() {
	var userId = document.frm2.userId.value;
	var roomId = document.frm2.roomId.value;
	var datein = document.frm2.bookedFromDate.value;
	var dateout = document.frm2.bookedToDate.value;
	var dateout1=new Date(dateout);
	var datein1=new Date(datein);
	var noOfAdults = document.frm2.noOfAdults.value;
	var noOfChildren = document.frm2.noOfChildren.value;
	var amount = document.frm2.amount.value;
	 
	if (datein == "") {
		alert("Select the Checkin Date");
		document.frm2.datein.focus();
		return false;
	} else if (dateout == "") {
		alert("Select the Checkout Date");
		document.frm2.dateout.focus();
		return false;
	} else if (new Date(datein) > new Date(dateout)) {
		alert("Check-out date cannot be less than Check-in Date");
		document.frm2.datein.focus();
		return false;
	} else if(new Date(datein)< new Date ) {
		
		alert("Check-in Date cant be less than current date");
		document.frm2.datein.focus();
		return false;
	}
	
	else if (noOfAdults == "0") {
		alert("Select the No.Of Adults");
		document.frm2.noOfAdults.focus();
		
		return false;
	} 
	
	else if (noOfChildren == "-1") {
		alert("Select the No.Of Children");
		document.frm2.noOfChildren.focus();
		return false;
	}
	/*else{
	document.frm2.amount.value = document.frm2.amount.value*(dateout1.getDate()-datein1.getDate());
	
		return true;
	}*/
	return (true);

}
function calcAmount()
{	
	var amount1=parseInt(document.frm2.amount1.value);
	var datein = document.frm2.bookedFromDate.value;
	var dateout = document.frm2.bookedToDate.value;
	var dateout1=new Date(dateout);
	var datein1=new Date(datein);
	
	
	if (new Date(datein) > new Date(dateout)) {
		document.frm2.amount.value="0";
	}
	
	else{
	document.frm2.amount.value =document.frm2.amount1.value*(dateout1.getDate()-datein1.getDate());
	}
	}

