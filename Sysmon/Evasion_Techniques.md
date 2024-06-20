Evasion Techniques Overview

There are a number of evasion techniques used by malware authors to evade both anti-virus and detections. Some examples of evasion techniques are Alternate Data Streams, Injections, Masquerading, Packing/Compression, Recompiling, Obfuscation, Anti-Reversing Techniques. In this task, we will be focusing on Alternate Data Streams and Injections. Alternate Data Streams are used by malware to hide its files from normal inspection by saving the file in a different stream apart from $DATA. Sysmon comes with an event ID to detect newly created and accessed streams allowing us to quickly detect and hunt malware that uses ADS. Injection techniques come in many different types: Thread Hijacking, PE Injection, DLL Injection, and more. In this room, we will be focusing on DLL Injection and backdooring DLLs. This is done by taking an already used DLL that is used by an application and overwriting or including your malicious code within the DLL.

For more information about this technique check out MITRE ATT&CK T1564 and T1055.

You can download the event logs used in this room from this task or you can open them in the Practice folder on the provided machine.

Hunting Alternate Data Streams

The first technique we will be looking at is hiding files using alternate data streams using Event ID 15. Event ID 15 will hash and log any NTFS Streams that are included within the Sysmon configuration file. This will allow us to hunt for malware that evades detections using ADS. To aid in hunting ADS we will be using the SwiftOnSecurity Sysmon configuration file. The code snippet below will hunt for files in the Temp and Startup folder as well as .hta and .bat extension.

<RuleGroup name="" groupRelation="or">
	<FileCreateStreamHash onmatch="include">
		<TargetFilename condition="contains">Downloads</TargetFilename>
		<TargetFilename condition="contains">Temp\7z</TargetFilename>
		<TargetFilename condition="ends with">.hta</TargetFilename>
		<TargetFilename condition="ends with">.bat</TargetFilename>
	</FileCreateStreamHash>
</RuleGroup>

Open C:\Users\THM-Analyst\Desktop\Scenarios\Practice\Hunting_ADS.evtx in Event Viewer to view hidden files using an alternate data stream.

screenshot of Windows event log viewer showing details of an alternate data stream log

Listing Data Streams
C:\\Users\\THM-Threat>dir /r
 Volume in drive C has no label.
 Volume Serial Number is C0C4-7EC1

 Directory of C:\\Users\\THM-Threat

10/23/2022  02:56 AM    <DIR>          .
10/23/2022  02:56 AM    <DIR>          ..
01/02/2021  12:43 AM    <DIR>          3D Objects
01/02/2021  12:43 AM    <DIR>          Contacts
01/05/2021  11:53 PM    <DIR>          Desktop
01/02/2021  12:43 AM    <DIR>          Documents
01/10/2021  12:11 AM    <DIR>          Downloads
01/02/2021  12:43 AM    <DIR>          Favorites
01/02/2021  12:43 AM    <DIR>          Links
01/02/2021  12:43 AM    <DIR>          Music
10/23/2022  02:56 AM                 0 not_malicious.txt
                                    13 not_malicious.txt:malicious.txt:$DATA 
As you can see the event will show us the location of the file name as well as the contents of the file this will be useful if an investigation is necessary.

Detecting Remote Threads 

Adversaries also commonly use remote threads to evade detections in combination with other techniques. Remote threads are created using the Windows API CreateRemoteThread and can be accessed using OpenThread and ResumeThread. This is used in multiple evasion techniques including DLL Injection, Thread Hijacking, and Process Hollowing. We will be using the Sysmon event ID 8 from the SwiftOnSecurity configuration file. The code snippet below from the rule will exclude common remote threads without including any specific attributes this allows for a more open and precise event rule. 

<RuleGroup name="" groupRelation="or">
	<CreateRemoteThread onmatch="exclude">
		<SourceImage condition="is">C:\Windows\system32\svchost.exe</SourceImage>
		<TargetImage condition="is">C:\Program Files (x86)\Google\Chrome\Application\chrome.exe</TargetImage>
	</CreateRemoteThread>
</RuleGroup>


Open C:\Users\THM-Analyst\Desktop\Scenarios\Practice\Detecting_RemoteThreads.evtx in Event Viewer to observe a Process Hollowing attack that abuses the notepad.exe process. 

screenshot of Windows event log viewer showing details of a powershell session executed from notepad

As you can see in the above image powershell.exe is creating a remote thread and accessing notepad.exe. This is obviously a PoC and could in theory execute any other kind of executable or DLL. The specific technique used in this example is called Reflective PE Injection. 

Detecting Evasion Techniques with PowerShell

We have already gone through a majority of the syntax required to use PowerShell with events. Like previous tasks, we will be using Get-WinEvent along with the XPath to filter and search for files that use an alternate data stream or create a remote thread. In both of the events, we will only need to filter by the EventID because the rule used within the configuration file is already doing a majority of the heavy lifting. 

Detecting Remote Thread Creation

Syntax: Get-WinEvent -Path <Path to Log> -FilterXPath '*/System/EventID=8'

Detecting Remote Threads

PS C:\Users\THM-Analyst> Get-WinEvent -Path C:\Users\THM-Analyst\Desktop\Scenarios\Practice\Detecting_RemoteThreads.evtx -FilterXPath '*/System/EventID=8'

   ProviderName: Microsoft-Windows-Sysmon

TimeCreated                     Id LevelDisplayName Message
-----------                     -- ---------------- -------
7/3/2019 8:39:30 PM              8 Information      CreateRemoteThread detected:...
7/3/2019 8:39:30 PM              8 Information      CreateRemoteThread detected:...
7/3/2019 8:39:30 PM              8 Information      CreateRemoteThread detected:...
7/3/2019 8:39:30 PM              8 Information      CreateRemoteThread detected:...
7/3/2019 8:39:30 PM              8 Information      CreateRemoteThread detected:...