
Windows     FTK imager, WinPmem 
            https://www.exterro.com/digital-forensics-software/ftk-imager
            https://github.com/Velocidex/WinPmem

Linux       LIME
            https://github.com/504ensicsLabs/LiME

macOS       osxpmem
            https://code.google.com/archive/p/pmem/wikis/OSXPmem.wiki





entering the command vol will execute Volatiliy3 in the terminal. The -h switch can display the help menu
 vol -h


# Windows.cmdline
Lists process command line arguments
windows.drivermodule
Determines if any loaded drivers were hidden by a rootkit
Windows.filescan
Scans for file objects present in a particular Windows memory image
Windows.getsids
Print the SIDs owning each process
Windows.handles
Lists process open handles
Windows.info
Show OS & kernel details of the memory sample being analyzed
Windows.netscan	Scans for network objects present in a particular Windows memory image
Widnows.netstat	Traverses network tracking structures present in a particular Windows memory image.
Windows.mftscan
Scans for Alternate Data Stream
Windows.pslist
Lists the processes present in a particular Windows memory image
Windows.pstree
Windows.pstree
List processes in a tree based on their parent process ID

information about the target using the -f switch to indicate the file to analyze,
 in this case, memdump.mem followed by the plugin windows.info
 vol -f memdump.mem windows.info