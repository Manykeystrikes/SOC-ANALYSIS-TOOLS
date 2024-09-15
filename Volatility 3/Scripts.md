    Pulling Images and Profiles

specify the operating system prior to specifying the plugin to be used

    windows.info
    linux.info
    mac.info

 python3 vol.py -f <file> windows.info
  -python3 vol.py -f 'Investigation-1.vmem' windows.info

    Listing Process and Connections


include all current processes and terminated processes with their exit times.
 - python3 vol.py -f <file> windows.pslist

  technique of listing processes will locate processes by finding data structures that match _EPROCESS. While this technique can help with evasion countermeasures, it can also cause false positives.

  - python3 vol.py -f <file> windows.psscan

  useful for an analyst to get a full story of the processes and what may have been occurring at the time of extraction
  - python3 vol.py -f <file> windows.pstree

  netstat will attempt to identify all memory structures with a network connection.
  -python3 vol.py -f <file> windows.netstat

  can filter output to a specific DLL that might be an indicator for a specific type of malware you believe to be present on the system
  -python3 vol.py -f <file> windows.dlllist

  Hunting and Detection Capabilities

  The injected area could also be directed towards shellcode which requires further analysis.
  -python3 vol.py -f <file> windows.malfind

  search for strings, patterns, and compound rules against a rule set. You can either use a YARA file as an argument or list rules within the command line.
  - python3 vol.py -f <file> windows.yarascan


  python3 /opt/volatility3/vol.py -f 'Investigation-1.vmem' windows.info


    What user-agent was employed by the adversary
  vol.py -f <dump> -o /dir/to/store_dump/ windows.memmap.Memmap --pid <suspicious PID> --dump Once the dump is stored use, strings *.dmp | grep -i "user-agent"
 
 - python3 /opt/volatility3/vol.py -f  'Investigation-1.vmem' -o /home/thmanalyst windows.memmap.Memmap --pid 1640 --dump

  suspicious domains
 - strings /home/thmanalyst/*.dmp | grep -i “user-agent”


 - strings /home/thmanalyst/ *.dmp | grep "http" or strings /home/thmanalyst/*.dmp | grep "chase"

# extracting the information about the image 
vol.exe -f vol.exe -f <C:\Users\Administrator\Desktop\output\HibRec_2024-09-10-04-41-18-24024\ActiveMemory.bin> windows.info.Info

# extract the information about the running processes during hibernation
 vol.exe -f vol.exe -f <C:\Users\Administrator\Desktop\output\HibRec_2024-09-10-04-41-18-24024\ActiveMemory.bin> windows.pslist.PsList

# following command to extract the process tree information
  vol.exe -f vol.exe -f <C:\Users\Administrator\Desktop\output\HibRec_2024-09-10-04-41-18-24024\ActiveMemory.bin> windows.pstree.PsTree
#ollowing command to see a list of commands
   vol.exe -f vol.exe -f <C:\Users\Administrator\Desktop\output\HibRec_2024-09-10-04-41-18-24024\ActiveMemory.bin> windows.cmdline.CmdLine


   
Dump type
Information
Small memory dump
This option creates a small memory dump file (minidump) containing minimal information about the system state during the crash.
Kernel Memory Dump
This option creates a dump file that contains all the kernel memory contents at the time of the crash. Kernel memory dumps can be significantly larger than small memory dumps.
Complete Memory Dump
This option creates a dump file that contains all the contents of the physical memory (RAM) at the time of the crash. Complete memory dumps are the largest type of dump files.
Automatic memory dump
This option is similar to the kernel memory dump but is automatically triggered when Windows detects a system crash. The size of the dump file is dynamically adjusted based on the amount of RAM installed in the system, ensuring enough space is available to capture the necessary information.
Active Memory Dump
This option contains the memory dump of the active users and kernel modes.
