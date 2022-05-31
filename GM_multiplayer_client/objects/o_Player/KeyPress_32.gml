/// @description 

var buff = client_get_buffer();
buffer_seek(buff, buffer_seek_start, 0);

//Write a message id
buffer_write(buff, buffer_u8, 1);

//Write to buffer
buffer_write(buff, buffer_string, "Hello World");
buffer_write(buff, buffer_string, "Hello World2");
buffer_write(buff, buffer_string, "Hello World3");

//
var bufferSize = buffer_tell(buff);
var socket = client_get_client();

//Send
network_send_packet(socket, buff, bufferSize);
