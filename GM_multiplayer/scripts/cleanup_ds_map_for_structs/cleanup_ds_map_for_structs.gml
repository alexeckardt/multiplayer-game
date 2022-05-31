//
//DESC:
//
//
//
function cleanup_ds_map_for_structs(map_id){
	if (ds_exists(map_id, ds_type_map)) {
		

		var s = ds_map_size(map_id);
		var key = ds_map_find_first(map_id);
		
		for (var i = 0; i < s; i++) {
			//Delete Struct
			delete map_id[? key];
			//Iterate, delete the contents of the next map index
			key = ds_map_find_next(map_id, key);
		}

		//destroy map
		ds_map_destroy(map_id);
		
		//All Good, Destroyed All
		return 0;
	}
	
	//NoMap
	return -1;
}