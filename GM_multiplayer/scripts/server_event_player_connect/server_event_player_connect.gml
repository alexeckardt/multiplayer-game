// @desc
//
//
//
function server_event_player_connect(map) {

	//Add client to list
	var socket = ds_map_find_value(map, "socket");
	ds_list_add(socket_list, socket);
	
	//Create a Player
	var _spwnx  = playerSpawnX + irandoms(spawnRange);
	var _spwny  = playerSpawnY + irandoms(spawnRange);
	var playerinst = instance_create_depth(_spwnx, _spwny, depth, oPlayer);
	
	//Bundle Player Info
	var struct = {};
	struct.instid = playerinst;
	struct.username = "";
	
	//Store
	socket_info[? socket] = struct;
	
	//Show
	print("Added Socket ["+string(socket)+"]");
	
	//Generate Player Info To Send to Sockets
	var buff = server_buffer;
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.player_connect);

	//Write to buffer
	buffer_write(buff, buffer_u8, socket);
	buffer_write(buff, buffer_u16, _spwnx);
	buffer_write(buff, buffer_u16, _spwny);

	//
	network_send_buffer_to_socket(socket);
	
}