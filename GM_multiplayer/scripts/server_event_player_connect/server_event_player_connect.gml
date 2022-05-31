// @desc
//
//
//
function server_event_player_connect(map) {

	//Add client to list
	var socket = ds_map_find_value(map, "socket");
	ds_list_add(socketList, socket);
	
	print("Added Socket ["+string(socket)+"]");
	
}