# enable alert inside the graph

## Create alert
* you need to save the panel once before create alert

go back to the panel that you created in step 2. click 'alert' and then click 'create alert'.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-1.PNG "a title")

here we will see a setting panel to setup the alert.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-2.PNG "a title")

name : use to define this alert
Evaluate every: set the time to define how long will check the result will be alert or not.
For : what time will send out the alert after detected.
Condiitions : use to define what conditions appears will be alert.

Scroll down and you will see 'notifications'. you need to click the '+' icon near 'Send to' and select the notification channel you created before.
Then write a alert message that will be send to the channel when alert.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-3.PNG "a title")

now click the 'test rule' button. If the state is 'OK' or 'pending' and conditionEvals is true, you will be receive a alert message on your discord channel.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-4.PNG "a title")
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-5.PNG "a title")

Also, the graph will show when send out the alert meaage.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana3/images/step%204-6.PNG "a title")
the yellow line is the time that the conditon detected. Red line is the time that sent out the alert message.



