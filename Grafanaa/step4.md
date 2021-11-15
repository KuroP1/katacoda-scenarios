

In the last step, we have configurated Grafana, Mysql, and Wordpress's log setting.
In this Step, we will learn different log table stored in the Mysql database.

# Table1 : general_log
"general_log" is a table in "Mysql" database, it stores all of the general record of what mysqld is doing. It writes information of client connect or disconect, query request from clients.

There are six column in the general log table
* `event_time` - It is the time of when the connection / query request has made.
* `user_host` - It is the username and the host of the client requested.
* `thread_id` - It is a client id of your current process session
* `server_id` - It is the server id that 
* `comand_type` - It is the type of command made by the user, There are 5 type of command type: Connect, Query, Quit, Init DB, Field List.
* `argument` - The original command is covert into hex number and stored in the table. 
You may use `convert(argument using utf8)` to convert it back to readable query.

you may login to the mysql container to check the above table:

`docker exec -it mysql bash`{{execute}}

Also, login to the mysql database with a admin account
`mysql -u {your mysql username} -p`

`{your password}`

The query will only output first 10 record in the table by limit 10 option, you may delete it and get all of the query in the general log table.
`SELECT * FROM mysql.general_log limit 10;`{{execute}}


# Table2: wp_simple_history
"wp_simple_history" is a table in "wordpress" database, it stores some simple log occur in wordpress website such as what plugin has been installed.
It is useful for you to manage your wordpress website and trace the change of the website.

`Note: this table is created after install the "Simple History" plugin in the wordpress, if you cannot find this table, please return to the last step and following the configuration on Wordpress.`

There are seven column in the wp_simple_history table.
* `id` - It is the index of the log recorded.
* `date` - It is the time of when the log has made. 
* `logger` - It is type of logger of the record. There are two type of logger: SimplePluginLogger and SimpleLogger. SimpleLogger is some information from the plugin.
* `level` - It is the type of log.
* `message` - It is the message of the log.
* `occasionsID` - It is like the user id of log made.
* `initiator` - It state that whether the change is made by wp_user or by wordpress server.

You may use this command to check content of the above table;
`SELECT * FROM wordpress.wp_simple_history;`{{execute}}


# Table3: wp_simple_histpory_contexts
"wp_simple_histpory_contexts" is a table in "wordpress" database, it stores all of the general log occur in wordpress website such as what plugin has been installed, tranaction maded, user profile modified, or the log in/ log out time.

`Note: this table is created after install the "Simple History" plugin in the wordpress, if you cannot find this table, please return to the last step and following the configuration on Wordpress.`

There are four column in the wp_simple_history table.
* `context_id` - It is the index of the row of log.
* `history_id` - It is the index of each log, different row in the table have the same hisotry_id is belonging to the same log record.
* `key` - It is the key of each log record. There are different type of key for different type of log record. For example, Each log in log record may have _user_id, _user_login, _user_email three type of key. 
* `value` - It is the value according to the key in last column.

As mentions, different row of this table may belongs to the same log record.

You may use this command to check content of the above table;
`SELECT * FROM wordpress.wp_simple_history_contexts;`{{execute}}

Congulations! you have enough knowlege on different log table stored in the Mysql database.