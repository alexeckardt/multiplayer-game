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
		case network.move:
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			
			oPlayer.x = _x;
			oPlayer.y = _y;
			break;
	}
	
	return 0;

}