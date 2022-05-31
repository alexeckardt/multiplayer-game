/// @description 

//Server Config
port = 25565;
maxClients = 8;

//
network_create_server(network_socket_tcp, port, maxClients);

bufferMb = 1;
server_buffer = buffer_create(1024 * bufferMb, buffer_fixed, 1);

//Players
socketList = ds_list_create();
