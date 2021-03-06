// @desc
//
//
//
function client_recive_packet(buffer) {

	//Go To Head of Buffer
	buffer_seek(buffer, buffer_seek_start, 0);

	//Get Msg
	var msgid = buffer_read(buffer, buffer_u8);
	
	//Switch on Id
	switch (msgid) {
		case network.player_connect:
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			
			var instid = instance_create_depth(_x, _y, depth, oPlayer);
			instid.socket = _socket;
			instid.username = username;
			
			//Save
			player_inst_mapping[? _socket] = instid;
		
			Camera.target = instid;
			
			break;
			
		case network.player_joined:
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
			
			var instid = instance_create_depth(_x, _y, depth, oSlave);
			instid.socket = _socket;
			instid.username = _username;
			
			//Save
			player_inst_mapping[? _socket] = instid;
			
			break;
			
		case network.move:
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			
			//Move
			var instMoving = player_inst_mapping[? _socket];
			instMoving.x = _x;
			instMoving.y = _y;
			
			break;
			
		case network.close_server:
		
			//Disconnect
			network_destroy(client);
			
			//Create a New Client
			instance_create_depth(x, y, depth, con_client);
			
			//Destroy
			instance_destroy();
			
			break;
			
		//Disconnect
		case network.player_disconnect:
		
			//Delete
			var _socket = buffer_read(buffer, buffer_u8);
			var instToRemove = player_inst_mapping[? _socket];
			instance_destroy(instToRemove);
			
			break;
			
		//Update the Chars
		case network.set_username:
		
			//Delete
			var _socket = buffer_read(buffer, buffer_u8);
			var _newusername = buffer_read(buffer, buffer_string);
			var instToRename = player_inst_mapping[? _socket];
			
			instToRename.username = _newusername;
			
			break;
			
	}
	
	return 0;

}