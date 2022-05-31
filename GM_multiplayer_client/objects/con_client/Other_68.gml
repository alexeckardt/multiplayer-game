/// @description 

var map = async_load;
type_event = ds_map_find_value(map, "type");

switch (type_event) {

	case network_type_data:
	
		var buffer = ds_map_find_value(map, "buffer");
		client_recive_packet(buffer);
		
		break;

}
