/// @description 

if (requestSetup) {
	requestSetup = false;
	
	//Create Username (Once) 
	while (!username_valid(username)) {
		username = get_string("Enter a Username", username);
	}
	
	ipaddress_connect = get_string("Enter IP Address", ipaddress_connect);
	port_connect = real(get_string("Enter Port", string(port_connect)));
	
	
	//
	//Connect
	print("Establishing Connection To" + string(ipaddress_connect) + ":" + string(port_connect));
	connected = network_connect(client, ipaddress_connect, port_connect);
	print("Connection Result:" + string(connected));	
	
	
	//Connected!
	if (connected >= 0) {
		
		//Get Buffer
		var buff = client_get_buffer();

		//Write message id
		buffer_seek(buff, buffer_seek_start, 0);
		buffer_write(buff, buffer_u8, network.set_username);
		buffer_write(buff, buffer_string, username);
		network_send_buffer_to_server();
	
	
	//Not Connected
	} else {
	
		//Redo Setup
		requestSetup = true;
		
	}
}
