/// @description 

var map = async_load;
type_event = ds_map_find_value(map, "type");

switch (type_event) {

	case network_type_data:
		buffer = ds_map_find_value(map, "buffer");
		buffer_seek(buffer, buffer_seek_start, 0);
		
		client_recive_packet(buffer);
		
		break;

}
