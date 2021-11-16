# Enable general_log

Before we using Grafana, we need to enable general_log first before we create dashboard.

## What is general_log?
The general log is a table inside the mysql database. It records the operations of the mysql server. When a client connects, disconnects, or receives a SQL statement from a client, it writes the log to general log. That help to speed up troubleshooting problems when logging in development and testing environments.

## How to enable general_log
Since general_log is disable by default, we need to enable it manually.

First we need to login to mysql container

`docker exec -it mysql-server bash`{{execute}}
then login as root user

`mysql -u root -p12345`{{execute}}

After login successful, use sql statement to check the general_log is enable or not.
`show variables like '%general%';`{{execute}}
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%202-1.PNG "a title")
- As you can see, the general_log value is 'OFF'. We need to excute some SQL statement to enable it.

`set global general_log=on;`{{execute}}

now check it again
`show variables like '%general%';`{{execute}}
The general_log should be 'ON' now.

Also, we need to change the output type become 'Table' so that all of the logs will be records on database.(default is 'file')

`set global log_output='table';`{{execute}}

Now check is changed or not.
`show variables like 'log_output';`{{execute}}

# What is stored in the general_log
After enable the general_log, we can use a SQL statement to view the content inside the table.

`select * from mysql.general_log; limit 10`{{execute}}
*When the database has been running for a long time general_log may have stored a lot of records, so the limit should be added to avoid too long processing time.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%202-2.PNG "a title")

We can see that there are 6 column. Each cloumn corresponds to:

event_time：record the time that create this record

user_host： The source of the query log record,will show both username and hostname.

thread_id：The process_id of the query log record when it is executed.

server_id：which database excute this query

command_type：show the type of this record,normally most of them is 'query'.

argument：show the SQL statement(encrypted)。

to show the SQL statement we need to convert to UTF8.

`select convert(argument using utf8) from mysql.general_log;`{{execute}}

All operation on wordpress will be record in this table and we can view inside the mysql container. However, this is very inconvenient. Therefore we should use grafana to help us visualize all data.


