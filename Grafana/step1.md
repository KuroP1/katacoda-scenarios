# How to setup Grafana

## 1.Setup the MYSQL Container

Before we using wordpress, we need to create a database system to store the data. So we need to setup a MYSQL container first.

`docker run -d --name mysql-server -e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress_user -e MYSQL_PASSWORD=secret mysql`{{execute}}
*if the image was not exist, docker will pull the image automatically.

on this command,there are using some option
- --name: define the name of this container
- -e : define environment setting
- mysql : the image used in this container
- -d : container will run in the background and the terminal can be use

## 2.Setup the MYSQL Container

`docker run -d -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wordpress_user -e WORDPRESS_DB_PASSWORD=secret  --link mysql-server:mysql -p 8000:80 wordpress`{{execute}}
*if the image was not exist, docker will pull the image automatically.

on this command,there are using some option
--link : use to link up two container. the part before ":" is the container name that you want to link with.
-p : exposing internal port 80 form the container to port 8000

## 3.Setup the Grafana Container

`docker run -d --name grafana --link mysql-server:network -p 7000:3000 grafana/grafana`{{execute}}

After excute three command above, check both of them are running or not.
`docker ps`{{execute}}

## login to Grafana

if both three container are running, click the tab named "Wordpress" and "Grafana". You should view something if success.
