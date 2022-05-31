/// @description 

//Get Data from map
var map = async_load;

type_event = ds_map_find_value(map, "type");

switch (type_event) {

	case network_type_connect:
		server_event_player_connect(map);
		break;
		
	case network_type_disconnect:
		server_event_player_connect(map);
		break;
		
	case network_type_data:
		
		var buffer = ds_map_find_value(map, "buffer");
		var socket = ds_map_find_value(map, "id");
			
		//Go To the start of the buffer
		buffer_seek(buffer, buffer_seek_start, 0);
			
		server_receive_packet(buffer, socket);
		
		break;
}
