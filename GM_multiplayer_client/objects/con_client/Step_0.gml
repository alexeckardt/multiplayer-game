/// @description 

if (keyboard_check_pressed(vk_space) && connected != 0) {
	
	//Connect
	connected = network_connect(client, ipaddress_connect, port_connect);
	print("Connection Result:" + string(connected));	
	
}
