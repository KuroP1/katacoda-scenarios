

# Generate report for dashboard using reporter (Cannot configure in Katacoda environment)
There is no official report generating plugin from the Grafana.
You may use Grafana Enterprise , it is a advanced version for enterprise which have much more function than the Grafana. Grafana Enterprise provide reporting function and it is very convenience.

However, there is a non official reporting generating plugin, which called reporter. It also provde free pdf report generating.
Here is the github page of this plugin : https://github.com/IzakMarais/reporter
`Note: reporter is not work on Katacoda environment and it only works on localhost, please host all of the containers (mysql, wordpress, grafana, reporter) in your linux machine in localhost.`

First, create a reporter container by:

`docker run --name reporter -d -p 8080:8080 --net="wordpress-network" izakmarais/grafana-reporter`

Check the reporter container is runnning.

`docker ps`

Please save your dashboard and find the id of your dashboard. It is a 9 length String in the url.

For example:
`https://localhost:3000/d/`dYWcUh5nz`/welcome-shop?orgId=1`

`dYWcUh5nz` is the id of the dashboard.

Then go to Setting page of your dashboard by clicking the `gear` button and then select link.

![addLink](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step8/dashboard_link.PNG?raw=true)

You should add the this link and set it as Report:
https://localhost:8080/api/v5/report/"your dashboard id"
![addLink_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step8/dashboard_link_1.PNG?raw=true)

After saving, you can see there is a new button appear in the right top of your dashboard

![addLink_2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step8/dashboard_link_2.PNG?raw=true)

Alternatively, you also can create your report inside your reporter container.

`docker exec -it reporter bash`

`grafana-reporter -cmd_enable=1 -cmd_apiKey [api-key] -ip localhost:3000 -cmd_dashboard 'dashboard id' -cmd_ts from=now-1y -cmd_o out.pdf`
