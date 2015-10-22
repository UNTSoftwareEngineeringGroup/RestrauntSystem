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