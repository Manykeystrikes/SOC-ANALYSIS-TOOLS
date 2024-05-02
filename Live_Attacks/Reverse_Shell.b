#
#the -v -l runs snort in sniff mode, will scan network packets and -l will store to the 
#directory for future examination 

sudo snort -v -l .


sudo snort -r snort.log.1714619407 -X

sudo snort -r snort.log.1714619407 -X | grep ":4444"
sudo snort -r snort.log.1714619407 -X - 10

#To create local rules file and open text folder (local rules)
sudo gedit /etc/snort/rules/local.rules
#the rule will block traffic to port 4444 which is vulnenalbe to malicious activity 
drop tcp any 4444 <> any any (msg:"Block Taffic"; sid:100001; rev:1;)
#command to run rule for Internet Pervention Syustem(IPS)
sudo snort -c /ect/snort/snort.conf -q -Q --daq afpacket -i eth0:eth1 -A full
sudo snort -c /etc/snort/rules/local.rules -q -Q --daq afpacket -i eth0:eth1 -A full
