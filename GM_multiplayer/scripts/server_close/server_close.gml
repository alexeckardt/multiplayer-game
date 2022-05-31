// @desc
//
//Send Info back to all clients
//
function server_close(){

	var s = ds_list_size(socket_list);
	for (var i = 0; i < s; i++) {
	
		var _sock = socket_list[| i];
	
		buffer_seek(server_buffer, buffer_seek_start, 0);
		buffer_write(server_buffer, buffer_u8, network.close_server);
		network_send_buffer_to_socket(_sock);

	}

}