


tshark -r dns.exf.pcapng | grep -i "bpakcaging.xyz" | cut -d '.' -f 8
