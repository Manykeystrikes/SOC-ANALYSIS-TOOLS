JQ Cheatsheet

﻿jq is a lightweight and flexible command-line JSON processor. This tool can be used in conjunction with other text-processing commands. 

You may use the following table as a guide in parsing the logs in this task.

Note: You must be familiar with the existing fields in a single log.

Parse all JSON into beautified output	
cat powershell.json | jq 

Print all values from a specific field without printing the field	
cat powershell.json | jq '.Field1'

Print all values from a specific field
cat powershell.json | jq '{Field1}'

Print values from multiple fields	
cat powershell.json | jq '{Field1, Field2}'

Sort logs based on their Timestamp	
cat powershell.json | jq -s -c 'sort_by(.Timestamp) | .[]'

Sort logs based on their Timestamp and print multiple field values
cat powershell.json | jq -s -c 'sort_by(.Timestamp) | .[] | {Field}'

The eventid and count the number ((| sort | uniq -c)) events and sort them
cat powershell.json | jq {EVENTID} | sort | uniq -c
                        {EventID}
 ![alt text](Images/EventID.png)                     

Find the relavent 
 https://www.myeventlog.com/#:~:text=MyEventlog.com,%20is%20a%20free%20searchable%20database%20containing%20solutions%20and%20comments

 cat powershell.json | jq -s -c 'sort_by(.Timestamp)| .[] | {ScriptBlockText, EventID}' | grep "4104" > eventID4104.txt

 cat powershell.json | jq -s -c 'sort_by(.Timestamp)| .[] | {ScriptBlockText, EventID}' | grep "4104" |grep -v "Version"  > eventID4104.txt
