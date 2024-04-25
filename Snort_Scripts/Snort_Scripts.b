
#To generate traffic to allow snort to read
sudo ./traffic-generator.sh
#To verify snort is installed
snort -V
#Test configuration 
sudo snort -c /etc/snort/snort.conf -T 
#-v is the verbose and the -i with etho will search for 
sudo snort -v-i eth0
# -v searh for packets that in ICMP and HTTP traiffic.
    - ICMP (Internet Control Message Protocol) error-reporting Network 
    devices used to generate error massages (prevented message delivery)
 sudo snort -v
 sudo snort -d
 sudo snort -d
 sudo snort -X

 sudo snort -c /etc/snort/snort.conf -D

  
#pre-defined ICMP rule
alert icmp any any <> any any  (msg: "ICMP Packet Found"; sid: 100001; rev:1;)


sudo snort -c /etc/snort/snort.conf -A console
#Basic header and Hex payload 
sudo snort -c /etc/snort/snort.conf -A cmg
#IPS mode and dropping packets

Snort IPS mode activated with -Q --daq afpacket parameters. You can also activate this mode by editing snort.conf file. However, you don't need to edit snort.conf file in the scope of this room. Review the bonus task or snort manual for further information on daq and advanced configuration settings: -Q --daq afpacket
Activate the Data Acquisition (DAQ) modules and use the afpacket module to use snort as an IPS: -i eth0:eth1
Identifying interfaces note that Snort IPS require at least two interfaces to work##
sudo snort -c /etc/snort/snort.conf -A none

sudo snort -c /etc/snort/snort.conf -A full -l .