
Windows     FTK imager, WinPmem 
            https://www.exterro.com/digital-forensics-software/ftk-imager
            https://github.com/Velocidex/WinPmem

Linux       LIME
            https://github.com/504ensicsLabs/LiME

macOS       osxpmem
            https://code.google.com/archive/p/pmem/wikis/OSXPmem.wiki





entering the command vol will execute Volatiliy3 in the terminal. The -h switch can display the help menu
- vol -h


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
- vol -f memdump.mem windows.info


 observing any potential network activity,interesting or unusual connection. At this stage, remote access connections or access to suspicious sites 
 vol -f memdump.mem windows.netstat

 plugin we can use is windows.pstree, which will display a tree of the process running on the OS.
- vol -f memdump.mem windows.pstree

nvestigate the process critical_updat  that we identified in our previous task, which has a child process called updater. Let's investigate the child process more in-depth. Let's start by looking at where on the disk it was saved; for that, we can use the plugin windows.filescan which will allow us to examine the files accessed that are stored in the memory dump. This output is quite big, so to access the data in a better way, we will use the > character in bash to redirect the output to a file, in this case, filescan_out
- vol -f memdump.mem windows.filescan > filescan_out


If we want to have more detailed information like when the file was accessed or modified, we can use the plugin windows.mftscan.MFTScan, whose output is also quite big, so we will redirect the output to the file mftscan_out as shown below.

- vol -f memdump.mem windows.mftscan.MFTScan > mftscan_out

We can then use the grep command again to parse the file for the appearance of updater.exe.

- cat mftscan_out | grep <target PID>

Let's get information on the process. There are several ways to examine memory, but we will continue using volatility. This time, we will dump the memory region corresponding to updater.exe , and examine it.

 To accomplish the above, we'll use the plugin windows.memmap. This time, we'll specify the output dir with the -o switch. In this case, we will use the same directory denoted by the character " . "and the option --dump followed by the option --pid and the PID of the process, which in the case of updater.exe is.

- vol -f memdump.mem -o . windows.memmap --dump --pid 1612

When the command above is finished, we will have a file with an extension .dmp in our working directory.

Examining the file is difficult since it contains non-printable characters, so we'll use the strings command to analyze the output better. Since we have the file strings available to us now, we could look for key patterns like HTTP or key or any pattern that can lead us quickly to an artefact. Another way to scroll the terminal is by using the strings command piped to less to navigate through the output as the command output below.

- strings pid.1612.dmp |less

 process updater.exe accessed the document important_document.pdf and accessed a "key" at some point in the URL http://key.critical-update.com/encKEY.txt .

If we use the command grep to look for the HTTP request that may be stored in memory, we can do it using -B and -A to look for 10 lines above and below our match to see if we can spot something else.


Scrolling up, we can observe the HTTP request, as displayed.

http://key.critical-update.com/encKEY.txt

