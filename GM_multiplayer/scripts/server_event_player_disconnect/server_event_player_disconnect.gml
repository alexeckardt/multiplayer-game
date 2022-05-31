// @desc
//
//
//
function server_event_player_disconnect(map) {

	//Remove client to list
	var socket = ds_map_find_value(map, "socket");
	var socketId = ds_list_find_index(socketList, socket);

	//
	ds_list_delete(socketList, socketId);
	
	print("Socket ["+string(socketId)+"] Removed");
}
