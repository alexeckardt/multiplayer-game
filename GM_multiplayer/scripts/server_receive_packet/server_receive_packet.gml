// @desc
//
//
//
function server_receive_packet(buffer, socket) {

	//Get Custom Message id
	var msgid = buffer_read(buffer, buffer_u8);
	
	//Switch
	switch (msgid) {
		
		//Hello World
		case 1: 
			//
			var msg = buffer_read(buffer, buffer_string);
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, 1);
			buffer_write(server_buffer, buffer_string, msg + "123");
			
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			break;
	}

	//All Good
	return 0;

}