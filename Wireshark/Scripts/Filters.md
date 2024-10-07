
-http.request.method=="GET"

-&&tcp.port==80

-dns.qry.type == 1&&

-dns.flags.response==1

-dns.resp.name == <domain.name.xyz>


#List all HTTP packets where packets' "server" field contains the "Apache" keyword.
http.server contains "Apache"
#List all HTTP packets where packets' "host" fields match keywords ".php" or ".html".
http.host matches "\.(php|html)"

#List all TCP packets where packets' "port" fields have values 80, 443 or 8080.	
tcp.port in {80 443 8080}

#Convert all HTTP packets' "server" 
#fields to uppercase and list packets that contain the "APACHE" keyword.
upper(http.server) contains "APACHE"

#Convert all HTTP packets' "server" fields info to lowercase and list packets 
#that contain the "apache" keyword.
lower(http.server) contains "apache"

#Convert all "frame number" fields to string values, and list frames end with odd values.
string(frame.number) matches "[13579]$"

Example to find port
#number of packets that did not originate from "port 80"
http.server contains "IIS" && !(tcp.srcport == 80)

#Microsoft IIS servers. What is the number of packets that have "version 7.5"
http.server contains "IIS" && http.server matches "7.5"

#What is the number of packets with "even TTL numbers
string(ip.ttl) matches "[02468]$"

#"Checksum Control". What is the number of "Bad TCP Checksum" packets?
#Refer to image folder
tcp.checksum.status == 0