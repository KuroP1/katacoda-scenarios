

In the last step, we have learn different log table stored in the Mysql database.
In this Step, we will learn examples of missue/attacks/threats that will be logged.

# Scenario 1. Someone hacking your wordpress by guessing your account password. (External)

This is an example log on the Wordpress database.
The way to determine whether the log is a login failed log is to check the message column, if message column contain "Failed to login", we can know that it is a login failed log. If failure continute for long time / many times. You may know that someone is hacking your account.

You may try to query by:
`SELECT * from wordpress.wp_simple_history where level = 'warning';`{{execute}}

![missue1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step4/login_fail_MySQLexample.PNG?raw=true)

You may learn how to summarize the login fail in panel in the next step.

# Scenario 2. Someone DDos on your website. (External)

This is an example log on the Wordpress database.
You may search the value column of the table `wp_simple_history_contexts` and find out all records made in specific ip address.

For example, you can search all ip requested in the log table
`SELECT value from wordpress.wp_simple_history_contexts where wordpress.wp_simple_history_contexts.key = "_server_remote_addr";`{{execute}}

And you may s elect all record in specific ip "172.17.0.0" by the following query:
`SELECT * from wordpress.wp_simple_history_contexts where value = '172.17.0.0';`{{execute}}

Also, you may count the number of record made:
`SELECT count(*) from wordpress.wp_simple_history_contexts where value = '172.17.0.0';`{{execute}}

![missue2](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step4/missue2.PNG?raw=true)

you may also find out the execute time of the specific records:
`SELECT * from wordpress.wp_simple_history where id = 'please input the id here';`

you may also find out the execute time of the all records:
`SELECT * from wordpress.wp_simple_history where id IN (select history_id from wordpress.wp_simple_history_contexts where value = '172.17.0.0');`{{execute}}

![missue2_1](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step4/missue2_1.PNG?raw=true)

You may learn how to summarize the ip record in panel in the next step.

# Scenario 3. Someone in your company changed your wordpress settings/transaction records. (Internal)

This is an example log on the Wordpress database.
You may search the value column of the table `wp_simple_history_contexts` and find out all records.

For example, you may select all `user_created` record by the following query:
`SELECT history_id from wordpress.wp_simple_history_contexts where value='user_created';`{{execute}}

Then, you can search those record having that id:
`SELECT * from wordpress.wp_simple_history_contexts where history_id='please input the id here';`
And the execute time of that record:
`SELECT * from wordpress.wp_simple_history where id='please input the id here';`

Alternatively, you may combine the query as:

`SELECT * from wordpress.wp_simple_history_contexts where (SELECT history_id from wordpress.wp_simple_history_contexts where value = 'user_created') = history_id;`{{execute}}

`SELECT * from wordpress.wp_simple_history where (SELECT history_id from wordpress.wp_simple_history_contexts where value = 'user_created') = id;`{{execute}}

![missue3](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step4/missue3.PNG?raw=true)

You may learn how to summarize the setting changed in panel in the next step.

# scenario 4. Someone (unauthorized) login to the mysql and stole the personal informations of customer. (Internal/External)

This is an example log on the Mysql database.
There is a record for each query with command_type = query. Also, there is a log time,useraccount and the host address which created this query request. 
* You can know that maybe someone outside has stole your database records if there are large amount of query made in a non-authorized host address. 
* You may also know that if somebody in your company using the company's computer to stole the personal information stored in the database and sold it out.

You may try to query by:
`SELECT event_time,user_host,convert(argument using utf8) from mysql.general_log limit 10;`{{execute}}

![missue4](https://github.com/joey1136/katacoda-scenarios/blob/main/Area-C/images/step4/missue4.PNG?raw=true)

You may learn how to summarize number of query in panel in the next step.

Congulations! you have basic knowlege on missue/attacks/threats scenarios.