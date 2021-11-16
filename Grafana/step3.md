# Setup Grafana
Now we know that all wordpress operations can be viewed in general_log. So we need grafana to help us display the data in graph or chart instead of table. About how to create dashboard will show on next scnario, This scnario will show how to connect with mysql only. Let's go.

## 1.Log in to Grafana
Let's go back to the tab "Grafrana" . First we need to create a account. input 'admin' at both username and password.
`show variables like '%general%';`{{execute}}
- ![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-1.PNG "a title")

For security reasons, you will be asked to change your default password.
After your change the password, click submit.

## 2.add new data source
Now you will see the Grafana homepage like the picture. First we need to add a new data source to connect the mysql database. click the gear icon 'configuration' then click 'data sources'.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-2.PNG "a title")

click 'add data sources'
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-3.PNG "a title")

Search 'mysql' and select it.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-4.PNG "a title")

## 3.input mysql connection
Now you are reqiured to input some information to connect with the mysql-server. Please input the same information like the picture. 
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-5.PNG "a title")
Host : the name of your 'mysql' container name.
database : must be mysql.
username : here the will use the root user since this account have all privilege.
*note that if you want to use another accounts on grafana, you neeed to grant all privilege to that account first. We have another senario to show you how to do, if you dont know how to do, please access "".
password: Since we using root account this time,password will be the root_password that you define when create the mysql-server container.

After input all information, scroll down to the bottom of the page and click the 'save&test' button. If everything input correctly there will show 'database connection OK'. If not, please change the information you input above.
![Alt text](https://raw.githubusercontent.com/KuroP1/katacoda-scenarios/main/Grafana/images/step%203-6.PNG "a title")


Now you are able to create dashboard using the mysql database information! On next secnario, we will show you how to create different dashboard to monitoring the database.

