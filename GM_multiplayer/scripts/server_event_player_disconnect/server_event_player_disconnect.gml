// @desc
//
//
//
function server_event_player_disconnect(map) {

	//Remove client to list
	var socket_removing = ds_map_find_value(map, "socket");
	var socket_list_positon = ds_list_find_index(socket_list, socket_removing);

	//Remove Socket from Refference
	ds_list_delete(socket_list, socket_list_positon);
	
	//Get Access + Remove from Map (No longer needed as i am disconnecting)
	var struct = socket_get_client_info(socket_removing);
	show_debug_message(struct);
	
		//Delete Player Obj
		var playerIndex = struct.instid;
		instance_destroy(playerIndex);
	
	//Remove from memory
	ds_map_delete(socket_info, socket_removing);
	delete struct;
	
	//
	//Get Other Clients to see their mirror removed
	var buff = server_buffer;
	var s = ds_list_size(socket_list);
		buffer_seek(buff,buffer_seek_start, 0);
		buffer_write(buff, buffer_u8, network.player_disconnect);
		buffer_write(buff, buffer_u8, socket_removing);
	for (var i = 0; i < s; i++) {
		//Send Buffer Out
		var _sock = socket_list[| i];
		network_send_buffer_to_socket(_sock);
	}
	
	
	
	//Display
	print("Socket ["+string(socket_removing)+"] Removed");
}
