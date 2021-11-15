# Setup
Before you start, please make sure you have completed the previous course. This tutorial will not focus the setup process and focus on how to using the alert function on Grafana.

## 1.Setup three Container mysql,wordpress and grafana

`docker run -d --name mysql-server -e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress_user -e MYSQL_PASSWORD=secret mysql`{{execute}}

`docker run -d -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wordpress_user -e WORDPRESS_DB_PASSWORD=secret  --link mysql-server:mysql -p 8000:80 wordpress`{{execute}}

`docker run -d --name grafana --link mysql-server:network -p 7000:3000 grafana/grafana`{{execute}}

After excute three command above, enable the general_log.

`docker exec -it mysql-server bash`{{execute}}
`mysql -u root -p12345`{{execute}}
`set global general_log=on;`{{execute}}
`set global log_output='table';`{{execute}}

Then go to the tab "Grafana" to connect with mysql.

