# setup the notification channel

## 1.add new notification channel *discord

go back to dashboaard and select the bell icon 'alerting' and click 'notificaiton channel'
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-1.PNG "a title")


click 'add channel'.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-2.PNG "a title")

On this scenario, we will going to use Discord as our notification channel.
select the type to 'Discord'.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-3.PNG "a title")

Now we need to find a discord channel that you want to show the alert.
Please select a text channel then click the gear icon.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-4.PNG "a title")

click 'Integration' on the left hand side and click 'View webhooks' on the right hand side.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-5.PNG "a title")

click 'new webhook' and the click 'Copy webhook URL' to get the URL.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/grafana3/images/step3-6.PNG "a title")

now go back to Grafana, paste on the Webhook URL and click 'test'. Your discord channel will be receive a test message. If success, click save and go to next step.