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
