Reference reading
Links:https://help.dreamhost.com/hc/en-us/articles/214918038-Email-client-configuration-overview

There are 3 specific protocols involved to facilitate the outgoing and incoming email messages, and they are briefly listed below.

SMTP (Simple Mail Transfer Protocol) - It is utilized to handle the sending of emails. 
POP3 (Post Office Protocol) - Is responsible transferring email between a client and a mail server. 
IMAP (Internet Message Access Protocol) - Is responsible transferring email between a client and a mail server. 
You should have noticed that both POP3 and IMAP have the same definition. But there are differences between the two.

The difference between the two is listed below: (credit AOL -- You got mail!)

POP3

Emails are downloaded and stored on a single device.
Sent messages are stored on the single device from which the email was sent.
Emails can only be accessed from the single device the emails were downloaded to.
If you want to keep messages on the server, make sure the setting "Keep email on server" is enabled, or all messages are deleted from the server once downloaded to the single device's app or software.
IMAP

Emails are stored on the server and can be downloaded to multiple devices.
Sent messages are stored on the server.
Messages can be synced and accessed across multiple devices.


![alt text](NetworkFlows_Emails/email-network-flow-4.png)

Email structure ref material

 https://web.archive.org/web/20221219232959/https://mediatemple.net/community/products/all/204643950/understanding-an-email-header