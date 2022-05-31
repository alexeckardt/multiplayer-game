// @desc
//
//
//
function server_event_player_disconnect(map) {

	//Remove client to list
	var socket = ds_map_find_value(map, "socket");
	var socketId = ds_list_find_index(socket_list, socket);

	//
	ds_list_delete(socket_list, socketId);
	
	//Get Access + Remove from Map (No longer needed as i am disconnecting)
	var struct = socket_info[? socket];
	
		show_debug_message(struct);
	
		//Delete Player Obj
		instance_destroy(struct.instid);
	
	//Remove from memory
	ds_map_delete(socket_info, socketId);
	delete struct;
	
	//Display
	print("Socket ["+string(socketId)+"] Removed");
}
