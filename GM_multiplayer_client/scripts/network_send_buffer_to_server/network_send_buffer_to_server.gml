// @desc
//
//
//
function network_send_buffer_to_server() {

	//Info
	var buff = client_get_buffer();
	var bufferSize = buffer_tell(buff);
	var socket = client_get_client();

	//Send
	network_send_packet(socket, buff, bufferSize);

}