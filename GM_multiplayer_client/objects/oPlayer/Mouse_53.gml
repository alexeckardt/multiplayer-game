/// @description 

//Get Buffer
var buff = client_get_buffer();

//Write message id
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, network.move);

//Write to buffer
buffer_write(buff, buffer_u16, mouse_x);
buffer_write(buff, buffer_u16, mouse_y);

//
network_send_buffer_to_server();

//print("Requesting Move");
