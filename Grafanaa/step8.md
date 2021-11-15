

In the last step, we have learnt how to create a alert in your panel.
In this step, we will learn how to create notification when alerting.
Alert notification is import when error or attacks happen, you can receive immediate notification within email or messaging applications. For example, you can know that when someone hacking in your wordpress website as there are multiple failure login and you can take action on it immediately.

# Create notification in Slack

In your Slack Group, create a new channel in the left navigation bar. You may name it as alerting.

![slack_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_1.PNG?raw=true)
![slack_2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_2.PNG?raw=true)

Then add an Apps into the channel setting.

![slack_3](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_3.PNG?raw=true)

Install Incoming WebHooks to send the grafana alert into the channel

![slack_4](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_4.PNG?raw=true)

Select your new channel "alert" and add incoming webhooks integration.

![slack_5](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_5.PNG?raw=true)

After that, copy the webhook URL and configure notification channel in Grafana.

![slack_6](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_6.PNG?raw=true)
![slack_7](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_7.PNG?raw=true)

Congurations. You can successfully received alert from grafana in your channel now.

![slack_8](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/slack_8.PNG?raw=true)

# Create notification in Email (Cannot configure in Katacoda environment)
`For your reference, the Katacoda (this learning Platform) did not provide smtp connection. You cannot create notification in this scenario. You may try it in your own linux machine.`

First step is to check whether any smtp connection is available in your linux. We will use Gmail as an example.

`telnet smtp.gmail.com 587`{{execute}}

If you try it in your linux machine and have smtp connection, the output should be similar to this:

`Trying 74.125.200.108...
Connected to smtp.gmail.com (74.125.200.108).
Escape character is '^]'.
220 smtp.gmail.com ESMTP o90sm11695907pfi.17 - gsmtp`

If you try it in this scenario, the output should be similar to this:

`Trying 142.251.5.109...
Trying 2a00:1450:400c:c1b::6c...
telnet: Unable to connect to remote host: Network is unreachable`

In your Grafana Container:
`docker exec -it grafana bash`

you should have a file name grafana.ini in path /etc/grafana/grafana.ini

you have to change the content of this file by:
`cat -> /etc/grafana/grafana.ini`

you can copy and paste these configuration and press Ctrl + D finish editing.
`[smtp]
enable = true
root= "youremail@gmail.com"
host=smtp.gmail.com:465
user= "youremail@gmail.com"
password= yourpassword
skip_verify = true
from_address = "youremail@gmail.com"
from_name = Grafana`

After that restart the grafana container to enable the settings.
`docker restart grafana`

Please go to alerting page in the Grafana Page and setup your notication channel:
You may then Test your connection in this page.

![alert](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step7/alert_3.PNG?raw=true)


You may explore more in the Grafana Official Webpage
https://grafana.com/docs/grafana/latest/alerting/old-alerting/notifications/

Congulations! you have basic knowlege on Grafana Notification Setting.
