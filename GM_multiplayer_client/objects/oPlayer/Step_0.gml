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
x += hSpeed;
y += vSpeed;


//Update
if (x != xprevious || y != yprevious) {

	//Send Position To Server
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);
	buffer_write(buff, buffer_u16, x);
	buffer_write(buff, buffer_u16, y);
	network_send_buffer_to_server();
	
}
