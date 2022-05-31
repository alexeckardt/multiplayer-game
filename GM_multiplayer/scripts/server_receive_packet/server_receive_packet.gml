// @desc
//
//
//
function server_receive_packet(buffer, socket) {

	//Go To the start of the buffer
	buffer_seek(buffer, buffer_seek_start, 0);

	//Get Custom Message id
	var msgid = buffer_read(buffer, buffer_u8);
	
	//Switch
	switch (msgid) {
		
		//Hello World
		case network.move:
		
			//Get Info
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);

			//Send Info Back
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.move);
			buffer_write(server_buffer, buffer_u16, _x);
			buffer_write(server_buffer, buffer_u16, _y);
			network_send_buffer_to_socket(socket);
			
			//print("move " + string(socket) + "to position (" + string(_x) + ", " + string(_y) + ").");
			
			break;
	}

	//All Good
	return 0;

}