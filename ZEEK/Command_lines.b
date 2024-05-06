#our logs will be located in the default log path. The default log path is:
 /opt/zeek/logs/

#Zeek instance with the following command:
zeek -v 
#Primary management of the Zeek service is done with three commands; "status", "start", and "stop". 
zeekctl status
zeekctl start 
zeekctl stop 

# You can view the generated logs
 ls -l  

Parameter	        Description
-r	         Reading option, read/process a pcap file.
-C	         Ignoring checksum errors.
-v	         Version information.
zeekctl	     ZeekControl module.
sudo -s           moves user to root

Tool/Auxilary                    Name	Purpose
Zeek-cut	            Cut specific columns from zeek logs.

cat conn.log | zeek-cut uid proto id.orig_h id.orig_p id.resp_h id.resp_p

#To cut the host_name from the log enable able easy find\
cat dhcp.log | zeek-cut host_name
cat dns.log  | zeek-cut query

#sort from the highest (-r) according to string numerical values (-n) then 
#pipe the result with head command to show the first value
cat conn.log | zeek-cut duration | sort -n -r | head -n 1


zeek -C -r sample.pcap -s sample.sig


Zeek signatures use the ".sig" extension.
-C: Ignore checksum errors.
 -r: Read pcap file.
-s: Use signature file. 
#Refer to image:Images\create nanno passwird sig.png
nano http-password.sig
#An alert will be generated and two log files will be created, “signatures.log”, and “notice.log”
zeek -C -r http.pcap -s http-password.sig 

#From the “signatures/log”, we will use “zeek-cut” 
#to select the field “src_addr”, then sort it in reverse. 
#This will give use the first source IP address.
cat signatures.log | zeek-cut src_addr | sort -r
#Sent packets (orig_pkts), received packets (resp_pkts) source port (id.orig_p).
cat conn.log | zeek-cut id.orig_p orig_pkts resp_pkts | grep 38706


#Create the global rule shown in the task and investigate the ftp.pcap file.

nano ftp-bruteforce.sig
ignature ftp-username {
        ip-proto == tcp
        ftp /.*USER.*/
        event "FTP Username Input Found!"
}

signature ftp-brute{
        ip-proto ==tcp
        payload /.*530.*Login.*incorrect.*/
        event "FTP Brute-Force Attempt!"
}

zeek -C -r ftp.pcap -s ftp-bruteforce.sig

#Investigate the notice.log. What is the number of unique events?
cat notice.log |zeek-cut uid | sort | uniq | wc -l

#e number of ftp-brute signature matches
cat signatures.log | head -n 20


#Script Notes\ZEEK\Images\sid_id wc -l.png
cat signatures.log | zeek-cut sig_id | grep "ftp-brute" | wc -l

-C   Ignoring checksum errors
-r to read the file 
zeek -C -r bigFlows.pcap
cat dhcp.log | zeek-cut host_name | sort | uniq
cat dhcp.log | zeek-cut host_name | sort | uniq | wc -l


cat dhcp.log | zeek-cut domain | sort | uniq

#Zeek has base scripts located in "/opt/zeek/share/zeek/base". You can load all local scripts identified in your "local.zeek" file. 
#Note that base scripts cover multiple framework functionalities.
# You can load all base scripts by easily running the local command.
zeek -C -r ftp.pcap /opt/zeek/share/zeek/policy/protocols/ftp/detect-bruteforcing.zeek 

cat notice.log | zeek-cut ts note msg 
