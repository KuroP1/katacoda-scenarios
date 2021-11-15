

In the last step, we have learnt how to create dashboard in Grafana using different log data stored in the Mysql database.
In this step, we will learn how to create a alert in your panel.

# Alert setup inside the panel

Inside the panel you created in the last step. You can add a alert for this panel. 
`Note : Only graph type Time Series / Graph (OLD) have the alert function`

![panel_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step5/panel_1.PNG?raw=true)

In the yellow area, you can select "Alert", and add alert in this tab.
The following is the example of creating a alert.

* you can change the evaluation time interval of the alert
* you also need to set the conditions of when the alert should start
* you can change the setting when there is `No data and have execution error`, which means there should have something wrong in your database server.
* you can change the Notification destination, message and add tags into the notification

![panel_2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step6/fail_alert%20setting.PNG?raw=true)


# Alert management

If you have been create a lots of alert in different panel/ dashboard. It would be difficult to management all of your alert one by one. Grafana provide a Alerting screen which can help you manage all of your alert rules and notification channels.

![alert_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step6/alert_1.PNG?raw=true)

Congulations! you have basic knowlege on Grafana Alerting.