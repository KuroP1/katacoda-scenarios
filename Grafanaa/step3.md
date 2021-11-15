# Create dashboard on Grafana

# 1. Configuration on wordpress

Please select wordpress tab in the terminal to open the wordpress website.

After login to the wordpress with your account, you will be navigate to the main page of you wordpress.

In the action bar, please select Plugin and then install plugin.

![wordpress_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/wordpress_plugin.PNG?raw=true)

In this page, you are able to find all plugin provided by the wordpress.
You may search log in the search bar to find out all logging plugins.
In this case, we will teach you how to configurate the `Simple History` Plugin

![wordpress_2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/wordpress_plugin_select.PNG?raw=true)

After install the plugin, you can check all of your activity log in the Simple History tab.
The further steps will teach you how to create a more integrated dashboard in grafana to visualize all of your log stored in mysql database.

![wordpress_3](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/wordpress_simpleHistory.PNG?raw=true)



# 2. Configuration on mysql

In order to enable the general_log in mysql database, you have to follow the following command.

Go to terminal:

Start your mysql container by :

`docker exec -it mysql bash`{{execute}}

After that, you have to add the following configuration in the my.cnf file in folder etc/mysql by few commands:

`cat -> etc/my.cnf`{{execute}}

`[mysqld]
general_log = 1
log_output = table`{{execute}}

after that please click `ctrl + D` in your keyboard to stop editing the my.cnf file.

You can check whether your setting have been write into the file by:

`cat etc/my.cnf`{{execute}}

If you cannot see the expected output like this, it means that you have not edit the file correctly. <br />
`[mysqld]
general_log = 1
log_output = table`

After that restart the container and check whether the log has succesfull enabled
`exit`{{execute}}

`docker restart mysql`{{execute}}

`docker exec -it mysql bash`{{execute}}

Also, login to the mysql database with a admin account or the root account.
`mysql -u root -p`{{execute}}

`{root password}`
Hint: the password is set in Step 0 of this scenario.

Check that whether general_log is enabled.
`SHOW global variables like 'general_log%';`{{execute}}
`SHOW global variables like 'log_output%';`{{execute}}

You should also create an account for Grafana.

`CREATE USER 'Grafana'@'%' IDENTIFIED BY '12345'; `{{execute}}

The accout should have have select permission on three table, which is mysql.general_log, wordpress.wp_simple_history, wordpress.wp_simple_history_contexts. The function of three table will be explained in the next step.
`GRANT SELECT ON mysql.general_log TO 'Grafana'@'%';`{{execute}}
`GRANT SELECT ON wordpress.wp_simple_history TO 'Grafana'@'%';`{{execute}}
`GRANT SELECT ON wordpress.wp_simple_history_contexts TO 'Grafana'@'%';`{{execute}}

Check that whether the user have select permission.
`SHOW GRANTS FOR 'Grafana'@'%';`{{execute}}

# 3. Configuration on grafana

In order to get data from database, we have to setup datasource in grafana webpage.

Please first select datasource in the main page.

![datasource_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/main_addDatasource.png?raw=true)

After that search mysql and select it as new datasource.

![datasource_2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/datasource_sql.PNG?raw=true)

Please enter the following configuration into the setup.

* `Host` - mysql container name (e.g. mysql-server)
* `Database` - database name (e.g. mysql / wordpress)
* `User` - your admin user account 
Note: please enter a user account which have permission on select data from the sepcified database
* `Password` - your admin user password
* `Others` - you may also enter other configuration 

You should click Save & test and check whether Database Conection OK

![datasource_3](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step2/datasource_detail.PNG?raw=true)


You should make new datasource from mysql if the database is different
In the following Steps, we also need to use datasource from wordpress database.
You may skip this configuration first but you have to remember to create the datasource for wordpress database.


Congulations! you have successfully setup your log configuration on grafana, mysql and wordpress.