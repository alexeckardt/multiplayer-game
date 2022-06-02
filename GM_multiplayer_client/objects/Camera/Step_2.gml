/// @desc

//Move
if (instance_exists(target)) {
	var goalx = target.x;
	var goaly = target.y;
	
	x = lerp(x, goalx, cameraFollowSpeed);
	y = lerp(y, goaly, cameraFollowSpeed);
}

//Clamp

//Move
camera_set_view_pos(camera, x - w div 2, y - h div 2);
