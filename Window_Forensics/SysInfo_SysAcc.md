Now that we have learned how to read registry data, let's find out where to look in the registry to perform our forensic analysis.

When we start performing forensic analysis, the first step is to find out about the system information. This task will cover gathering information related to a machine's System and Account information.

OS Version:

If we only have triage data to perform forensics, we can determine the OS version from which this data was pulled through the registry. To find the OS version, we can use the following registry key:

SOFTWARE\Microsoft\Windows NT\CurrentVersion

This is how Registry Explorer shows this registry key. Take a look and answer Question # 1.

    

Current control set:

The hives containing the machine’s configuration data used for controlling system startup are called Control Sets. Commonly, we will see two Control Sets, ControlSet001 and ControlSet002, in the SYSTEM hive on a machine. In most cases, ControlSet001 will point to the Control Set that the machine booted with, and ControlSet002 will be the last known good configuration. Their locations will be:

SYSTEM\ControlSet001

SYSTEM\ControlSet002

Windows creates a volatile Control Set when the machine is live, called the CurrentControlSet (HKLM\SYSTEM\CurrentControlSet). For getting the most accurate system information, this is the hive that we will refer to. We can find out which Control Set is being used as the CurrentControlSet by looking at the following registry value:

SYSTEM\Select\Current

Similarly, the last known good configuration can be found using the following registry value:

SYSTEM\Select\LastKnownGood

This is how it looks like in Registry Explorer. Take a look and answer Question # 2.



It is vital to establish this information before moving forward with the analysis. As we will see, many forensic artifacts we collect will be collected from the Control Sets.

Computer Name:

It is crucial to establish the Computer Name while performing forensic analysis to ensure that we are working on the machine we are supposed to work on. We can find the Computer Name from the following location:

SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName 

Registry Explorer shows it like this. Take a look and answer Question # 3:



Time Zone Information:

For accuracy, it is important to establish what time zone the computer is located in. This will help us understand the chronology of the events as they happened. For finding the Time Zone Information, we can look at the following location:

SYSTEM\CurrentControlSet\Control\TimeZoneInformation

Here's how it looks in Registry Explorer. Take a look and answer Question # 4.



Time Zone Information is important because some data in the computer will have their timestamps in UTC/GMT and others in the local time zone. Knowledge of the local time zone helps in establishing a timeline when merging data from all the sources.

Network Interfaces and Past Networks:

The following registry key will give a list of network interfaces on the machine we are investigating:

SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces

﻿Take a look at this registry key as shown in Registry Explorer and answer Question # 5.




Each Interface is represented with a unique identifier (GUID) subkey, which contains values relating to the interface’s TCP/IP configuration. This key will provide us with information like IP addresses, DHCP IP address and Subnet Mask, DNS Servers, and more. This information is significant because it helps you make sure that you are performing forensics on the machine that you are supposed to perform it on.

The past networks a given machine was connected to can be found in the following locations:

SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\Unmanaged

SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\Managed



These registry keys contain past networks as well as the last time they were connected. The last write time of the registry key points to the last time these networks were connected.

Autostart Programs (Autoruns):

The following registry keys include information about programs or commands that run when a user logs on. 

NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Run

NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\RunOnce

SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce

SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run

SOFTWARE\Microsoft\Windows\CurrentVersion\Run



The following registry key contains information about services:

SYSTEM\CurrentControlSet\Services

Notice the Value of the Start key in the screenshot below.



In this registry key, if the start key is set to 0x02, this means that this service will start at boot.

SAM hive and user information:

The SAM hive contains user account information, login information, and group information. This information is mainly located in the following location:

SAM\Domains\Account\Users

Take a look at the below screenshot and answer Question # 6.



The information contained here includes the relative identifier (RID) of the user, number of times the user logged in, last login time, last failed login, last password change, password expiry, password policy and password hint, and any groups that the user is a part of. 