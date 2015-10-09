function updateStatus(food) {
	if((food).style.backgroundColor == "yellow")
	{
		//red means the food item is being cooked
		(food).style.backgroundColor = "green";
	} else {
		//green means the food item is ready
		(food).style.backgroundColor = "yellow";
	}
}