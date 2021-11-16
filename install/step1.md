# Setup and run the mysql and WordPress container using docker
Since woocommerce is one of the wordpress plugin, we need to run wordpress. However, wordpress need a database to store those data. Therefore, we need to create a mysql container first.

there are two method to create mysql and wordpress containers:
# Method 1
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

# Method 2
without using docker-run ,we can git clone a .yml file to run both two container.
docker-compose.yml is a tool for defining and running multi-container Docker applications. It can also include some configuration and mount volume before running container.

#  download `docker-compose.yml` file
- `git clone https://github.com/KuroP1/docker-compose.git`{{execute}}

#  launch docker containers
- `cd docker-compose`{{execute}}
- `docker-compose up -d`{{execute}}

After docker compose-up, you can view the .yml file in the editor. you can see there are two service which is mysql and wordpress. Also, there have environment setting for example the user_host and the password etc. 

## 3. access and setup wordpress
Click the dashboard named "port 8000". If success there will be show the initialization of wordpress.
