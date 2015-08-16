

function validAdRoom() {
	var hotelName=document.frm.hotelName.value;
	var roomNo=document.frm.roomNo.value;
	var roomType=document.frm.roomType.value;
	var pnr=document.frm.perNightRate.value;
	var available=document.frm.available.value;
	
	
	if (hotelName =="select") {
		alert("Select the Hotel Name");
		document.frm.hotelName.focus();
		return false;
	} 
	if (roomNo == "") {
		alert("Select the room No");
		document.frm.roomNo.focus();
		return false;
	} 
	if (roomType == "select") {
		alert("Select the room Type");
		document.frm.roomType.focus();
		return false;
	} 
	if (pnr == "") {
		alert("Select the per night rate");
		document.frm.perNightRate.focus();
		return false;
	} 
	
	
	return (true);

}

function delvali() {
	var roomId=document.frm1.roomId.value;
	var room=document.getElementById('txt');
	
	if (roomId == "") {
		
		document.frm1.roomId.placeholder="   Enter the room Id";
		
		room.title="*Enter the room Id";
		room.style.borderColor='red';
		
		
		return false;
	} 
	
	return (true);
	
	
}

function rru() {
	var roomId=document.frm2.roomId.value;
	var perNightRate=document.frm2.perNightRate.value;
	var room=document.getElementById('txt');
	var rate=document.getElementById('txt1');
	if (roomId == "") {
		
		document.frm2.roomId.placeholder="   Enter room Id";
		room.title="Enter room Id";
		room.style.borderColor='red';
		
		document.frm2.roomId.focus();
		return false;
	} 
	if (perNightRate == "") {
		
		document.frm2.perNightRate.placeholder="   Enter per night rate";
		rate.title="*Enter the Rate per night";
		room.style.borderColor='yellow';
		rate.style.borderColor='red';
		
		return false;
	} 
	return (true);
	
	
}
function upld() {
	var up=document.frm9.fileUpload.value;
	//var room=document.getElementById('txt');
	
	if (up == "") {
		
		document.frm9.fileUpload.placeholder="   Select a file";
		
		room.title="*select a file";
		room.style.borderColor='red';
		
		
		return false;
	} 
	
	return (true);
	
	
}