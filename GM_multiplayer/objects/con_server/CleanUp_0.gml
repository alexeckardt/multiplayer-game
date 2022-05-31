/// @description 

server_close();

cleanup_ds_map_for_structs(socket_info);
ds_list_destroy(socket_list);
buffer_delete(server_buffer);
