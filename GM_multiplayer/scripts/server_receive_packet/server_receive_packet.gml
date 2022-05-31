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
			
			//Grab
			var socketInfo = socket_get_client_info(socket);
			print(string(socket) + ":" + string(socketInfo));
			
			var playerinst = socketInfo.instid;
			playerinst.x = _x;
			playerinst.y = _y;
			
			//
			//
			//Create the move buffer
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.move);
			buffer_write(server_buffer, buffer_u8, socket); //this is the moving player
			buffer_write(server_buffer, buffer_u16, _x);
			buffer_write(server_buffer, buffer_u16, _y);
			
			//
			//Send Info To All Players
			var s = ds_list_size(socket_list);
			for (var i = 0; i < s; i++) {
				
				//Get Socket
				var _sock = socket_list[| i];

				//Send to the sock
				network_send_buffer_to_socket(_sock);
			}
			
			break;
	}

	//All Good
	return 0;

}