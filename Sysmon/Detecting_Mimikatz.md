Detecting Mimikatz Overview

Mimikatz is well known and commonly used to dump credentials from memory along with other Windows post-exploitation activity. Mimikatz is mainly known for dumping LSASS. We can hunt for the file created, execution of the file from an elevated process, creation of a remote thread, and processes that Mimikatz creates. Anti-Virus will typically pick up Mimikatz as the signature is very well known but it is still possible for threat actors to obfuscate or use droppers to get the file onto the device. For this hunt, we will be using a custom configuration file to minimize network noise and focus on the hunt. 

For more information about this technique and the software used check out MITRE ATTACK T1055 and S0002.

You can download the event logs used in this room from this task or you can open them in the Practice folder on the provided machine.

Detecting File Creation

The first method of hunting for Mimikatz is just looking for files created with the name Mimikatz. This is a simple technique but can allow you to find anything that might have bypassed AV. Most of the time when dealing with an advanced threat you will need more advanced hunting techniques like searching for LSASS behavior but this technique can still be useful. 

This is a very simple way of detecting Mimikatz activity that has bypassed anti-virus or other detection measures. But most of the time it is preferred to use other techniques like hunting for LSASS specific behavior. Below is a snippet of a config to aid in the hunt for Mimikatz. 

<RuleGroup name="" groupRelation="or">
	<FileCreate onmatch="include">
		<TargetFileName condition="contains">mimikatz</TargetFileName>
	</FileCreate>
</RuleGroup>


As this method will not be commonly used to hunt for anomalies we will not be looking at any event logs for this specific technique.

Hunting Abnormal LSASS Behavior

We can use the ProcessAccess event ID to hunt for abnormal LSASS behavior. This event along with LSASS would show potential LSASS abuse which usually connects back to Mimikatz some other kind of credential dumping tool. Look below for more detail on hunting with these techniques.

If LSASS is accessed by a process other than svchost.exe it should be considered suspicious behavior and should be investigated further, to aid in looking for suspicious events you can use a filter to only look for processes besides svchost.exe. Sysmon will provide us further details to help lead the investigation such as the file path the process originated from. To aid in detections we will be using a custom configuration file. Below is a snippet of the config that will aid in the hunt.

<RuleGroup name="" groupRelation="or">
	<ProcessAccess onmatch="include">
	       <TargetImage condition="image">lsass.exe</TargetImage>
	</ProcessAccess>
</RuleGroup>

Open C:\Users\THM-Analyst\Desktop\Scenarios\Practice\Hunting_LSASS.evtx in Event Viewer to view an attack using an obfuscated version of Mimikatz to dump credentials from memory.

screenshot of Windows event log viewer showing details of a mimikatz log

We see the event that has the Mimikatz process accessed but we also see a lot of svchost.exe events? We can alter our config to exclude events with the SourceImage event coming from svhost.exe. Look below for a modified configuration rule to cut down on the noise that is present in the event logs.

<RuleGroup name="" groupRelation="or">
	<ProcessAccess onmatch="exclude">
		<SourceImage condition="image">svchost.exe</SourceImage>
	</ProcessAccess>
	<ProcessAccess onmatch="include">
		<TargetImage condition="image">lsass.exe</TargetImage>
	</ProcessAccess>
</RuleGroup>
 

By modifying the configuration file to include this exception we have cut down our events significantly and can focus on only the anomalies.  This technique can be used throughout Sysmon and events to cut down on "noise" in logs.

Detecting LSASS Behavior with PowerShell

To detect abnormal LSASS behavior with PowerShell we will again be using the PowerShell module Get-WinEvent along with XPath queries. We can use the same XPath queries used in the rule to filter out the other processes from TargetImage. If we use this alongside a well-built configuration file with a precise rule it will do a lot of the heavy lifting for us and we only need to filter a small amount.

Get-WinEvent -Path <Path to Log> -FilterXPath '*/System/EventID=10 and */EventData/Data[@Name="TargetImage"] and */EventData/Data="C:\Windows\system32\lsass.exe"'

Hunting Mimikatz

PS C:\Users\THM-Analyst> Get-WinEvent -Path C:\Users\THM-Analyst\Desktop\Scenarios\Practice\Hunting_Mimikatz.evtx -FilterXPath '*/System/EventID=10 and */EventData/Data[@Name="TargetImage"] and */EventData/Data="C:\Windows\system32\lsass.exe"'

   ProviderName: Microsoft-Windows-Sysmon

TimeCreated                     Id LevelDisplayName Message
-----------                     -- ---------------- -------
1/5/2021 3:22:52 AM             10 Information      Process accessed:...