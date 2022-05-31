// @desc
//
//
//
function client_recive_packet(buffer) {

	//Get Msg
	var msgid = buffer_read(buffer, buffer_u8);
	
	//Switch on Id
	switch (msgid) {
		case 1:
			var msg = buffer_read(buffer, buffer_string);
			show_message(msg);
			break;
	}
	
	return 0;

}