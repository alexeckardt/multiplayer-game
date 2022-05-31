// @desc
//
//
//
function print(msg){
	
	var dt = date_current_datetime();
	var msgg = "[" + date_time_string(dt) + "]: " + string(msg);

	show_debug_message(msgg);

}
