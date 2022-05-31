/// @description 

//Info
client = network_create_socket(network_socket_tcp);
ipaddress_connect = "10.0.0.82";
port_connect = 25565;

connected = -1; //0 means connected

//Buffer
client_buffer = buffer_create(1024, buffer_fixed, 1);
