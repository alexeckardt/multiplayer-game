// @desc
//
//
//
function server_event_player_connect(map) {

	//Add client to list
	var new_player_socket = ds_map_find_value(map, "socket");
	ds_list_add(socket_list, new_player_socket);
	
	//Create a Player
	var _spwnx  = playerSpawnX + irandoms(spawnRange);
	var _spwny  = playerSpawnY + irandoms(spawnRange);
	var playerinst = instance_create_depth(_spwnx, _spwny, depth, oPlayer);
	
	//Bundle Player Info
	var struct = {};
	struct.instid = playerinst;
	struct.username = "";
	
	//Store
	socket_info[? new_player_socket] = struct;
	
	//Show
	print("Added Socket ["+string(new_player_socket)+"]");
	
	
	
	//
	//
	//
	//
	//Generate Player Info To Send to New Player
	var buff = server_buffer;
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.player_connect);
	buffer_write(buff, buffer_u8, new_player_socket);
	buffer_write(buff, buffer_u16, playerinst.x);
	buffer_write(buff, buffer_u16, playerinst.y);
	network_send_buffer_to_socket(new_player_socket);
	
	//
	//
	//Send all old Client Info to New Player
	var i = 0;
	repeat(ds_list_size(socket_list)) {
		
		//Get Socket
		var _sock = socket_list[| i];

		//Don't Send to Self
		if (_sock != new_player_socket) {
			
			//Write
			var socketInfo = socket_get_client_info(_sock);
			var _slave = socketInfo.instid;
			
			//Write and Send
			buffer_seek(buff,buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.player_joined);
			buffer_write(buff, buffer_u8, _sock);
			buffer_write(buff, buffer_u16, _slave.x);
			buffer_write(buff, buffer_u16, _slave.y);
			network_send_buffer_to_socket(new_player_socket);
			
		}
		
		//Increment
		i++;
	}	
	
	//
	//Get Other Clients to see a mirror of the new player
	var i = 0;
	repeat(ds_list_size(socket_list)) {
		
		//Get Socket
		var _sock = socket_list[| i];
		
		//Don't Send to Connected Player
		if (_sock != new_player_socket) {
			buffer_seek(buff,buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.player_joined);
			buffer_write(buff, buffer_u8, new_player_socket);
			buffer_write(buff, buffer_u16, playerinst.x);
			buffer_write(buff, buffer_u16, playerinst.y);
			network_send_buffer_to_socket(_sock);
		}
		
		//Increment
		i++;
	}
	
}