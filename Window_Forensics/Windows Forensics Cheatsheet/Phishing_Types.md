Different types of malicious emails can be classified as one of the following:

Spam - unsolicited junk emails sent out in bulk to a large number of recipients. The more malicious variant of Spam is known as MalSpam.
Phishing -  emails sent to a target(s) purporting to be from a trusted entity to lure individuals into providing sensitive information. 
Spear phishing - takes phishing a step further by targeting a specific individual(s) or organization seeking sensitive information.  
Whaling - is similar to spear phishing, but it's targeted specifically to C-Level high-position individuals (CEO, CFO, etc.), and the objective is the same. 
Smishing - takes phishing to mobile devices by targeting mobile users with specially crafted text messages. 
Vishing - is similar to smishing, but instead of using text messages for the social engineering attack, the attacks are based on voice calls. 
When it comes to phishing, the modus operandi is usually the same depending on the objective of the email.

For example, the objective can be to harvest credentials, and another is to gain access to the computer. 

Below are typical characteristics phishing emails have in common:

The sender email name/address will masquerade as a trusted entity (email spoofing)
The email subject line and/or body (text) is written with a sense of urgency or uses certain keywords such as Invoice, Suspended, etc. 
The email body (HTML) is designed to match a trusting entity (such as Amazon)
The email body (HTML) is poorly formatted or written (contrary from the previous point)
The email body uses generic content, such as Dear Sir/Madam. 
Hyperlinks (oftentimes uses URL shortening services to hide its true origin)
A malicious attachment posing as a legitimate document
We'll look at each of these techniques (characteristics) in greater detail in the next room within the Phishing module.

Hyperlinks and IP addresses should be 'defanged'. Defanging is a way of making the URL/domain or email address unclickable to avoid accidental clicks, which may result in a serious security breach. It replaces special characters, like "@" in the email or "." in the URL, with different characters. For example, a highly suspicious domain, http://www.suspiciousdomain.com, will be changed to hxxp[://]www[.]suspiciousdomain[.]com before forwarding it to the SOC team for detection.