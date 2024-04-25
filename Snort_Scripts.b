
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
  

