

https://www.w3.org/TR/1999/REC-xpath-19991116/

*[System[(Level <= 3) and TimeCreated[timediff(@SystemTime) <= 86400000]]]

Get-WinEvent -LogName Application -FilterXPath '*'

Get-WinEvent -LogName Security -FilterXPath '*/EventData/Data[@Name="TargetUserName"]="System"'

Get-WinEvent -LogName Security -FilterXPath '*/EventData/Data[@Name="TargetUserName"]="System"'

 Get-WinEvent -LogName Application -FilterXPath '*/System/EventID=101 and */System/Provider[@Name="WLMS"]'

 #Using the knowledge gained on Get-WinEvent and XPath, what is the query to find WLMS #events with a System Time of 2020-12-15T01:09:08.940277500Z?

  Get-WinEvent -LogName Application -FilterXPath '*/System/Provider[@Name="WLMS"] and*/System/TimeCreated[@SystemTime="2020-12-15T01:09:08.940277500Z"]'

  Get-WinEvent -LogName Application -FilterXPath '*/System/Provider[@Name="WLMS"] and*/System/TimeCreated[@SystemTime="2020-12-15T01:09:08.940277500Z"]' | fl -property *

 #the addtional script will provide further list info of event= fl -property * 

  Get-WinEvent -LogName Application -FilterXPath '*/System/EventData/Data[@Name="TargetUserName"]="Sam"*/System/EventID=4720'

   Get-WinEvent -LogName Security -FilterXPath '*/EventData/Data[@Name="TargetUserName"]="Sam" and */System/EventID=4720'

#Link below assists with Powershell attacks

    https://kurtroggen.wordpress.com/2017/05/17/powershell-security-powershell-downgrade-attacks/

   Get-WinEvent -Path merged.evtx -FilterXPath '*/System/EventID=400'

 #What is the difference between event ID 104 and 1102?
    Event ID 104: This event ID logs the authentication attempts on a system. Malware may attempt to brute force or guess passwords to gain access to a system, so monitoring for Event ID 104 can help detect suspicious authentication activity. Event ID 1102: This event ID logs the audit log was cleared.2 May 2023

   Get-WinEvent -Path merged.evtx -FilterXPath '*/System/EventID=104'

#The threat intel team shared its research on Emotet. They advised searching for event ID 4104 and the text "ScriptBlockText" within the EventData element. Find the encoded PowerShell payload.

Get-WinEvent -Path merged.evtx -FilterXPath '*/System/EventID=4104' | fl -property *

ScriptBlockText
Get-WinEvent -Path merged.evtx -FilterXPath '*/System/EventID=4104 and */EventData/Data[@Name="ScriptBlockText"]'| fl -property *

Get-WinEvent -Path merged.evtx -FilterXPath '*/System/EventID=4104 and */EventData/Data[@Name="ScriptBlockText"]' -MaxEvent 1 | fl -property *


https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4799

Get-WinEvent -Path .\merged.evtx -FilterXPath '*/System/EventID=4799' -MaxEvents 1| fl -property *