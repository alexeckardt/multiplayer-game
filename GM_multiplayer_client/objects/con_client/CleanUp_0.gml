/// @description 

//Delete Instances
var firstkey = ds_map_find_first(player_inst_mapping);
for (var i = firstkey; i != undefined; i = ds_map_find_next(player_inst_mapping, i)) {
	//Delete Instance
	var inst = player_inst_mapping[? i];
	instance_destroy(inst);	
}
//Destroy Map
ds_map_destroy(player_inst_mapping);

buffer_delete(client_buffer);
