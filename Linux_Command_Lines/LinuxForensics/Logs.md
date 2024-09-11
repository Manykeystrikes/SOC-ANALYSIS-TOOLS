sudo systemctl status rsyslog
# ensure the log rsyslog is active
#located in /etc/rsyslog.d/
![alt text](Images/LogLocation.png)



#Logrotate managers the logs compressors and updates  


![alt text](Images/logrotate.d.png)


Logs are more than mere records of historical events; they can serve as a guiding compass. They are invaluable resources that, when skillfully leveraged, can enhance system diagnostics, cyber security, and regulatory compliance efforts. Their role in keeping a record of historical activity for a system or application is crucial.

Log Analysis Process

Log analysis involves Parsing, Normalisation, Sorting, Classification, Enrichment, Correlation, Visualisation, and Reporting. It can be done through various tools and techniques, ranging from complex systems like Splunk and ELK to ad-hoc methods ranging from default command-line tools to open-source tools.

Image Representation of a Data Source	
Data Sources

Data Sources are the systems or applications configured to log system events or user activities. These are the origin of logs.

Image Representation of Log Parsing	
Parsing

Parsing is breaking down the log data into more manageable and understandable components. Since logs come in various formats depending on the source, it's essential to parse these logs to extract valuable information.

Image Representation of Log Normalisation	
Normalisation

Normalisation is standardising parsed data. It involves bringing the various log data into a standard format, making comparing and analysing data from different sources easier. It is imperative in environments with multiple systems and applications, where each might generate logs in another format.

Image Representation of Log Sorting	
Sorting

Sorting is a vital aspect of log analysis, as it allows for efficient data retrieval and identification of patterns. Logs can be sorted by time, source, event type, severity, and any other parameter present in the data. Proper sorting is critical in identifying trends and anomalies that signal operational issues or security incidents.

Image Representation of Log Classification	
Classification

Classification involves assigning categories to the logs based on their characteristics. By classifying log files, you can quickly filter and focus on those logs that matter most to your analysis. For instance, classification can be based on the severity level, event type, or source. Automated classification using machine learning can significantly enhance this process, helping to identify potential issues or threats that could be overlooked.

Image Representation of Log Enrichment	
Enrichment

Log enrichment adds context to logs to make them more meaningful and easier to analyse. It could involve adding information like geographical data, user details, threat intelligence, or even data from other sources that can provide a complete picture of the event.

Enrichment makes logs more valuable, enabling analysts to make better decisions and more accurately respond to incidents. Like classification, log enrichment can be automated using machine learning, reducing the time and effort required for log analysis.

Image Representation of Log Correlation	
Correlation

Correlation involves linking related records and identifying connections between log entries. This process helps detect patterns and trends, making understanding complex relationships between various log events easier. Correlation is critical in determining security threats or system performance issues that might remain unnoticed.

Image Representation of Log Visualisation	
Visualisation

Visualisation represents log data in graphical formats like charts, graphs, or heat maps. Visually presenting data makes recognising patterns, trends, and anomalies easier. Visualisation tools provide an intuitive way to interpret large volumes of log data, making complex information more accessible and understandable.

Image Representation of Log Reporting	
Reporting

Reporting summarises log data into structured formats to provide insights, support decision-making, or meet compliance requirements. Effective reporting includes creating clear and concise log data summaries catering to stakeholders' needs, such as management, security teams, or auditors. Regular reports can be vital in monitoring system health, security posture, and operational efficiency.

Log Analysis Tools

Security Information and Event Management (SIEM) tools such as Splunk or Elastic Search can be used for complex log analysis tasks.

However, in scenarios where immediate data analysis is needed, such as during incident response, Linux-based systems can employ default tools like cat, grep, sed, sort, uniq, and awk, along with sha256sum for hashing log files. Windows-based systems can utilise EZ-Tools and the default cmdlet Get-FileHash for similar purposes. These tools enable rapid parsing and analysis, which suits these situations.

Additionally, proper acquisition should be observed by taking the log file's hash during collection to ensure its admissibility in a court of law.

Therefore, it is imperative not only to log events but also to ensure their integrity, that they are analysed, and any lessons obtained from the logs be learned, as the safety and efficiency of an organisation can depend on them.

Log Analysis Techniques

Log analysis techniques are methods or practices used to interpret and derive insights from log data. These techniques can range from simple to complex and are vital for identifying patterns, anomalies, and critical insights. Here are some common techniques:

Pattern Recognition: This involves identifying recurring sequences or trends in log data. It can detect regular system behaviour or identify unusual activities that may indicate a security threat.

Anomaly Detection: Anomaly detection focuses on identifying data points that deviate from the expected pattern. It is crucial to spot potential issues or malicious activities early on.

Correlation Analysis: Correlating different log entries helps understand the relationship between various events. It can reveal causation and dependencies between system components and is vital in root cause analysis.

Timeline Analysis: Analysing logs over time helps understand trends, seasonalities, and periodic behaviours. It can be essential for performance monitoring and forecasting system loads.

Machine Learning and AI: Leveraging machine learning models can automate and enhance various log analysis techniques, such as classification and enrichment. AI can provide predictive insights and help in automating responses to specific events.

Visualisation: Representing log data through graphs and charts allows for intuitive understanding and quick insights. Visualisation can make complex data more accessible and assist in identifying key patterns and relationships.

Statistical Analysis: Using statistical methods to analyse log data can provide quantitative insights and help make data-driven decisions. Regression analysis and hypothesis testing can infer relationships and validate assumptions.

These techniques can be applied individually or in combination, depending on the specific requirements and complexity of the log analysis task. Understanding and using these techniques can significantly enhance the effectiveness of log analysis, leading to more informed decisions and robust security measures.

Working with Logs: Practical Application

Working with logs is a complex task requiring both comprehension and manipulation of data. This tutorial covers two scenarios. The first is handling unparsed raw log files accessed directly via an open-source Log Viewer tool. This method allows immediate analysis without preprocessing, which is ideal for quick inspections or preserving the original format.

The second scenario focuses on creating a parsed and consolidated log file using Unix tools like cat, grep, sed, sort, uniq, and awk. It involves merging, filtering, and formatting logs to create a standardised file. Accessible through the Log Viewer tool, this consolidated file offers a clear and efficient view of the data, aiding in identifying patterns and issues.

These approaches highlight the flexibility and significance of log analysis in system diagnostics and cyber security. Whether using raw or parsed logs, the ability to compile, view, and analyse data is vital for an organisation's safety and efficiency.

Unparsed Raw Log Files

When dealing with raw log files, you can access them directly through the Log Viewer tool by specifying the paths in the URL. Here's an example URL that includes multiple log files:

http://10.10.1.180:8111/log?log=%2Fvar%2Flog%2Fgitlab%2Fnginx%2Faccess.log&log=%2Fvar%2Flog%2Fwebsrv-02%2Frsyslog_cron.log&log=%2Fvar%2Flog%2Fwebsrv-02%2Frsyslog_sshd.log&log=%2Fvar%2Flog%2Fgitlab%2Fgitlab-rails%2Fapi_json.log
Paste this URL into your browser to view the unparsed raw log files using the Log Viewer tool.

NOTE: You can access the URL using the AttackBox or VM browser. However, please be aware that Firefox on the VM may take a few minutes to boot up.

Parsed and Consolidated Log File

To create a parsed and consolidated log file, you can use a combination of Unix tools like cat, grep, sed, sort, uniq, and awk. Here's a step-by-step guide:

Use awk and sed to normalize the log entries to the desired format. For this example, we will sort by date and time:

# Process nginx access log
awk -F'[][]' '{print "[" $2 "]", "--- /var/log/gitlab/nginx/access.log ---", "\"" $0 "\""}' /var/log/gitlab/nginx/access.log  | sed "s/ +0000//g" > /tmp/parsed_consolidated.log

# Process rsyslog_cron.log
awk '{ original_line = $0; gsub(/ /, "/", $1); printf "[%s/%s/2023:%s] --- /var/log/websrv-02/rsyslog_cron.log --- \"%s\"\n", $2, $1, $3, original_line }' /var/log/websrv-02/rsyslog_cron.log >> /tmp/parsed_consolidated.log

# Process rsyslog_sshd.log
awk '{ original_line = $0; gsub(/ /, "/", $1); printf "[%s/%s/2023:%s] --- /var/log/websrv-02/rsyslog_sshd.log --- \"%s\"\n", $2, $1, $3, original_line }' /var/log/websrv-02/rsyslog_sshd.log >> /tmp/parsed_consolidated.log

# Process gitlab-rails/api_json.log
awk -F'"' '{timestamp = $4; converted = strftime("[%d/%b/%Y:%H:%M:%S]", mktime(substr(timestamp, 1, 4) " " substr(timestamp, 6, 2) " " substr(timestamp, 9, 2) " " substr(timestamp, 12, 2) " " substr(timestamp, 15, 2) " " substr(timestamp, 18, 2) " 0 0")); print converted, "--- /var/log/gitlab/gitlab-rails/api_json.log ---", "\""$0"\""}' /var/log/gitlab/gitlab-rails/api_json.log >> /tmp/parsed_consolidated.log
Optional: Use grep to filter specific entries:

grep "34.253.159.159" /tmp/parsed_consolidated.log > /tmp/filtered_consolidated.log
Use sort to sort all the log entries by date and time:

sort /tmp/parsed_consolidated.log > /tmp/sort_parsed_consolidated.log
Use uniq to remove duplicate entries:

uniq /tmp/sort_parsed_consolidated.log > /tmp/uniq_sort_parsed_consolidated.log
You can now access the parsed and consolidated log file through the Log Viewer tool using the following URL:

http://10.10.1.180:8111/log?path=%2Ftmp%2Funiq_sort_parsed_consolidated.log
Expected Output after logrotate configuration of sshd