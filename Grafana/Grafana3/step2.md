# Create dashboard on Grafana

## Create panel to monitoring SQL injection
Please create a time-series panel using this SQL statment

`SELECT $__timeGroup(event_time,'1m') as time, COUNT(*) as wordpress_user
FROM mysql.general_log
WHERE $__timeFilter(event_time) AND
      command_type LIKE "%query%" AND
      user_host LIKE "%wordpress_user%" AND
      argument LIKE "%  %"
GROUP BY $__timeGroup(event_time,'1m')`

## create some test data

Currently the will show nothing since there are no any record meet those condition. So we need to makeup some sample data to show how the alert function working.

go back to the terminal, then login as wordpress_user to mysql container.

`exit`{{execute}}

`mysql -u wordpress_user -psecret`{{execute}}

now input a SQL statement:
`select * /* from my */ from mysql.user;`{{execute}}

then refresh the dashboard, you should see a green point on the graph.That means it find a record meet those condition.
