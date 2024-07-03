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
