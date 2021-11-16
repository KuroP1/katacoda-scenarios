# Create dashboard on Grafana
Now we know that there are many types of database attacks. How should they be detected? we will teach how to use dashboard to achieve it

## 1. Create some sample data
go back to the terminal then login as wordpress_user

exit{{execute}}

mysql -u wordpress_user -psecret{{execute}}

now input this SQL statement four time: 

select * /* from my */ from mysql.user;{{execute}}


## 2.Create panel to monitoring SQL injection
Assuming you have completed all settings correctly.If there are any problem, please go back to pervious course to check again.
https://www.katacoda.com/elvisyeung/courses/grafana/grafana1


Now, go back to the Grafana homepage add click the '+' icon.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-1.PNG "a title")

click 'add an empty panel'
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-2.PNG "a title")

![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-3.PNG "a title")
Here you can create your own dashboard to display what you want to display. On the right hand side you can set up the chart settings, and on the bottom left is where you can edit SQL statement.

click 'edit SQL' to modify the SQL statement.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-4.PNG "a title")

you can copy this SQL statement

`SELECT $__timeGroup(event_time,'1m') as time, COUNT(*) as wordpress_user
FROM mysql.general_logSELECT 
WHERE $__timeFilter(event_time) AND
      command_type LIKE "%query%" AND
      user_host LIKE "%wordpress_user%" AND
      argument LIKE "%  %"
GROUP BY $__timeGroup(event_time,'1m')`

![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-5.PNG "a title")

This dashboard will count the number of results that match the criteria every minute. It is able to detect SQL injection because the condition is set to restrict the use of wordpress users, and the operation type is query which is the most common method of SQL injection. The most important thing is to restrict the SQL statement from having more than one consecutive space. As mentioned in the previous step, one of the methods of SQL injection is to use comment symbols, which causes SQL statements to have more than one consecutive space. So this setting can find out if someone is doing SQL injection. The normal dashboard should not show any data, but if there is data shown in the graph, it means that someone may be doing SQL injection and should be investigated and handled as soon as possible.

## 3.Create dashboard to monitoring DDos

now click 'apply' on the upper right corner and go back to the dashboard.

click 'add panel' button to create new panel.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-6.PNG "a title")

This time we need to change the type of this panel.
click the 'Time series' on the upper right corner and find 'Bar Chart' during the dropdown menu.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-7.PNG "a title")

click 'edit SQL' to modify the SQL statement and copy this SQL statement

`SELECT convert(argument using utf8), count(*)
FROM mysql.general_log
WHERE $__timeFilter(event_time) and
user_host like '%wordpress_user%' and
command_type LIKE "%query%"
GROUP BY 1
ORDER BY 2 desc
Limit 10;`

![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/Grafana2/images/step%203-8.PNG "a title")

This dashboard will count the number of times the same SQL statement is executed. Also, because of the conditional limits, it helps to determine if these statements are used as DDos. Administrators should check which user is running th SQL statement when the number of times it is executed is greater than a certain value and limit the account.
