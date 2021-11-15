# Setup and run the mysql and WordPress container using docker
Since woocommerce is one of the wordpress plugin, we need to run wordpress. However, wordpress need a database to store those data. Therefore, we need to create a mysql container first.
## Method 1
## 1. create mysql container
- `docker run --name mysql -d -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root mysql`{{execute}}

## 2. create wordpress container
- `docker run -d --link mysql:mysql -p 8000:80 wordpress`{{execute}}
    this command will pull 'wordpress' image and exposing port 80 form the container to port 8000 then run.

## 3. access and setup wordpress
Click the dashboard named "port 8000". If success there will be show the initialization of wordpress.
