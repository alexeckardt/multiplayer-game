// @desc
//
//
//
function network_send_buffer_to_socket(socket) {

	network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
	return 0;
}