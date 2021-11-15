# The purpose of the dashboard and some example of database attack

## Why we need dashboard to monitoring?
There are many different types of dashboard and we need to use the appropriate type to monitor them according to our needs. There is no doubt that it is more convenient to use charts than tables, but why do we need to monitor them? In fact, the purpose of monitoring is to enable the administrator to detect any abnormalities or attacks on the server as soon as possible, so that the damage can be minimized. The following will list two common situations, so that you understand the importance of monitoring.

## 1. SQL injection
SQL injection is the act of stealing/corrupting data by changing the semantics of SQL statements. There are many ways to do this, for example by altering the SQL phrase after the URL, or by adding sql statements to some input fields. This behavior allows users to do things beyond their privileges, such as getting information they are not allowed to get, or even modifying data, etc.

here is some example:
`http://www.mydomain.com/products/products.asp?productid=123`

Under normal circumstances, this URL will return the product data where productid=123. However, if the URL is modified as follows:

`http://www.mydomain.com/products/products.asp?productid=123 or 1=1`

Because 1=1 must be true, which means the where condition will be ignored and all product data will be returned

Another case is the use of comment symbols, for example:
`http://www.mydomain.com/products/products.asp? 1=1 --and productid=123`

In a SQL statement, everything after -- will be a comment, so it will be ignored as well.

there are many different type of SQL injection. For more information, you may access https://en.wikipedia.org/wiki/SQL_injection to get more detail.

## 2. DDos

The full name of DDos attack is distributed denial-of-service attack. The goal is to paralyze or exhaust the target's resources, making it unusable for all users. The most common technique is to make a large number of meaningless requests in a short period of time, usually by executing the same SQL statement multiple times to achieve it.

In the next step, we will show how to use the dashboard to detect both of these situations.

