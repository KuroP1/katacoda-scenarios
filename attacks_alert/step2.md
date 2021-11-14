Step 2

### 1. download `docker-compose.yml` file
- `git clone https://github.com/leekanam/grafana_alert`{{execute}}

### 2. launch docker containers
- `cd grafana_alert`{{execute}}
- `docker-compose up -d`{{execute}}

In the docker compose file, it already set up one user account name `21033593d` and password `12345`.
At the same time, general log is also setting to "ON".
You can check the docker compose file in URL: <pre>https://github.com/leekanam/grafana_alert</pre>
 

### 3. access and setup grafana 
- URL: <pre>https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/</pre>
