/// @description 

//
//Get Data from map
var map = async_load;

//
type_event = ds_map_find_value(map, "type");

//
//
switch (type_event) {

	case network_type_connect:
		server_event_player_connect(map);
		break;
		
	case network_type_disconnect:
		server_event_player_disconnect(map);
		break;
		
	case network_type_data:
		
		var buffer = ds_map_find_value(map, "buffer");
		var socket = ds_map_find_value(map, "id");
			
		server_receive_packet(buffer, socket);
		
		break;
}
