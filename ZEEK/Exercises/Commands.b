cat dns.log |zeek-cut qtype_name | sort | uniq -c
cat conn.log | zeek-cut duration | sort -r | head -n 1 

filter the main “***.cisco-update.com” DNS pattern as 
“cisco-update.com” with the following command;
 “cat dns.log | zeek-cut query |rev | cut -d ‘.’ -f 1–2 | rev | head

The hint can be quite confusing. Basically, what we want is to extract the last two fields of the unique lines/domain queries like for example, “example.com”.

cat dns.log | zeek-cut query |rev | cut -d '.' -f 1-2 | rev | head
The reverse “rev” is used to reverse the line characters and then use the “cut” 
command to display the first and second field value.

We will add the “sort” and “uniq” command to avoid the duplication of values, and then “wc -l” to print 
the newlines count.

cat dns.log | zeek-cut query |rev | cut -d '.' -f 1-2 | rev | sort |uniq | wc -l

#massive amount of DNS queries sent to the same domain. This is abnormal. 
Let's find out which hosts are involved in this activity. Investigate the conn.log file.
What is the IP address of the source host?
cat conn.log | zeek-cut id.orig_h | sort | uniq -c
