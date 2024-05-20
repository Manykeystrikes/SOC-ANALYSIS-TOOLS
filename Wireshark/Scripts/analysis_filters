
# total number of the "TCP Connect" scans
tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size > 1024 

#How many "UDP close port"{f ICMP message. For example, type 8 is used for an ICMP request
 #and type 0 is used for an ICMP reply ;use type 3 for destination unreachable messages}
icmp.type==3 and icmp.code==3

# UDP port in the 55-70 port range is open
udp.dstport in{55..70}

Notes	                                                    Wireshark Filters
Global search.                                                  tcp 
                                                                udp

Only SYN flag.                                                  flags == 2
SYN flag is set. The rest of the bits are not important.tcp.    tcp.flags.syn == 1
                                                                
Only ACK flag.                                                  tcp.flags == 16
ACK flag is set. The rest of the bits are not important.        tcp.flags.ack == 1

Only SYN, ACK flags.                                            tcp.flags == 18
SYN and ACK are set. The rest of the bits are not important.    (tcp.flags.syn == 1) and (tcp.flags.ack == 1)

Only RST flag.                                                  tcp.flags == 4
RST flag is set. The rest of the bits are not important.        tcp.flags.reset == 1

Only RST, ACK flags.                                           tcp.flags == 20 
RST and ACK are set. The rest of the bits are not important.    (tcp.flags.reset == 1) and (tcp.flags.ack == 1)

Only FIN flag                                                   tcp.flags == 1
FIN flag is set. The rest of the bits are not important.        tcp.flags.fin == 1


#number of ARP requests crafted by the attacker
((arp) && (arp.opcode == 1)) && (arp.src.hw_mac == target-mac-address)

((arp) && (arp.opcode == 1)) && (arp.src.hw_mac == 00:0c:29:e2:18:b4)
MAC address found using : arp.opcode == 1
00:0c:29:e2:18:b4

#number of HTTP packets received by the attacker
http and eth.addr == 00:0c:29:e2:18:b4

#number of sniffed username&password entries
http.host == "testphp.vulnweb.com" && http.request.method == "POST"

http and eth.dst == 00:0c:29:e2:18:b4 and (http.file_data matches “uname || pass”)

#find and filter analyse data HTML key values
urlencoded-form matches "client354"

dhcp.option.hostname contains "keyword"

# many NetBIOS registration requests does the "LIVALJM" workstation have
nbns.flags.opcode == 5 and nbns.name matches"LIVALJM"
#adversary uploaded a document to the FTP server. What is the filename
ftp.request.command == "RETR"

