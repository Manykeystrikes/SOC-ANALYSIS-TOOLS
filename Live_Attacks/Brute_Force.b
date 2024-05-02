
#command line to run snort sniffer and send to current dieertory
#-v	Verbose. Display the TCP/IP output in the console.
sudo snort -v -l .

#-X	Display the full packet details in HEX.
Sudo snort -d -r snort.log.1714564468 -x





sudo snort -r snort.log.1714564468 -X | grep :22
sudo snort -r snort.log.1714564468 -X | grep "ssh"
:<<'END_COMMENT'
Port 22 is the default port for SSH (Secure Shell). It serves as a secure communication channel for connecting to remote servers and devices. When you want to access a server via SSH, you typically specify port 22 in your SSH client configuration. Here’s a brief overview:

SSH (Secure Shell): SSH is a cryptographic network protocol that allows secure communication between a client and a server. It provides authentication, encryption, and data integrity, making it a reliable choice for remote access.
Port 22: By default, SSH listens on port 22. When you initiate an SSH connection, your client communicates with the server over this port. The server’s SSH daemon (usually OpenSSH) listens for incoming connections on port 22.
Firewalls and Port 22: Sometimes, firewalls may block access to certain ports on servers behind the firewall but leave port 22 open. This is because SSH is widely used for remote administration and secure file transfers. Packets directed to port 22 are not blocked by the firewall and can be forwarded to any other port on the server.
END_COMMENT

#-n	Specify the number of packets that will process/read. Snort will stop after reading the specified number of packets.
sudo snort -r snort.log.1714564468 -X -n 30

# drop - Blocks and log the packet
#any 22 specify the port; <> allows for destination of IP ; any any - allows for changes to attackers IP  
drop tcp any 22 <> any any (msg:"SSH Connection"; sid:100001; rev:1;)
