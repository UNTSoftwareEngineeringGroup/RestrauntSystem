function updateStatus(food) {
	var inProgress = "rgb(255, 255, 163)";
	var done = "#66FF99";

	if((food).style.backgroundColor == inProgress)
	{
		(food).style.backgroundColor = done;
	} else {
		(food).style.backgroundColor = inProgress;
	}
}

function loadStatus(status, name) {

	var inProgress = "rgb(255, 255, 163)";
	var done = "#66FF99";

	alert(status);

	if (status == 0) {
		
	} else if (status == 1) {
		document.getElementById(name).style.backgroundColor = inProgress;
	} else {
		document.getElementById(name).style.backgroundColor = done;
	}
}