/// @description 

var buff = client_get_buffer();

var left = keyboard_check(leftKey);
var right = keyboard_check(rightKey);
var up = keyboard_check(upKey);
var down = keyboard_check(downKey);

var mx = right - left;
var my = down - up;

//Speed
hSpeed = walkSpeed*mx;
vSpeed = walkSpeed*my;

//Move
xposLast = xpos;
yposLast = ypos;
xpos += hSpeed;
ypos += vSpeed;

//Update
if (xpos != xposLast || ypos != yposLast) {

	//Send Position To Server
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);
	buffer_write(buff, buffer_u16, xpos);
	buffer_write(buff, buffer_u16, ypos);
	network_send_buffer_to_server();
}
