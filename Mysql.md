# Mysql

## installation

for linux ubuntu

1.  run this command

   ```sh
   sudo apt update
   sudo apt install mysql-server
   sudo mysql_secure_installation
   # ask for some basic setting 
   # also ask for provide default admin password
   # just remeber the password.
   sudo systemctl status mysql
   
   sudo mysql -u root
   # checking the version of it.
   mysql --version
   mysql -v
   ```

## data types

numbers => 0 to 9 and combination of this symbols. => 998, 101, 235456756, 45.00

alphabtes => A to Z, a to z and to create words => hello, data, we are working on mysql.

special symbols => +, . - /$ * have some different meanings.



msql data types

- char(size) => number, special charaters, letter.
- varchar(size)
- interger(size) 
- int(size)
- text
- date
- boolean => yes(1)/no(0)
- ....

## Constraints

use to apply some limitation or restrication.

- not null
- Default
- unique
- primary key
- foreign key
- auto increment 

## sql view from cli.

first look of mysql in terminal

```sh
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 7
Server version: 10.7.3-MariaDB Arch Linux

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```



## what operation we can perform on data.

​	**on file 		on tables**

1. view		=> select 
2. save       => insert
3. edit        => update
4. delete    => drop , delete, 
5. create    => create.

## structure of database tables.

**Employee_details** (parent tble)

| employee_id (primary key) | employee_name |
| ------------------------- | ------------- |
| 18901                     | abc           |
| 18902                     | xyz           |



**Employee_address.** (child table)

| employee_id (foreign key) | temp_address | perma_address |
| ------------------------- | ------------ | ------------- |
| 18901                     | delhi        | UtterPardesh  |
| 18902                     | delhi        | banglore      |



store data in form of table in database.

## how can manage the data tables.

we manage tables in database, database contain tables and have some meaningful name also able to make changes in tables structure.

## how can check the list of databases.

To check the databases use this command.

```sql
show databases;

# output (result)
+----------------------------+
| Database                   |
+----------------------------+
| HospitalManagementSystem   |
| TestDB                     |
| Wave21                     |
| employee_management_system |
| information_schema         |
| myblog                     |
| mysql                      |
| performance_schema         |
| profile_management         |
| sales                      |
| sportevent_app             |
| spring                     |
| sys                        |
| testdb                     |
| users_database             |
+----------------------------+
```

To store some data in the database we need to create it

```sql
# syntex
CREATE DATABASE database_name;

# example
Create database people_records;
# output result
Query OK, 1 row affected (0.000 sec)
```

how to select a database.

```sql
# syntex
use datbase_name;

# example
use people_records;
# output result
Database changed
MariaDB [people_records]>
```



how to delete database;

```sql
# syntex
drop database database_name;

# example
drop database people_records;
# output result
Query OK, 101 rows affected (0.301 sec)
```

how to create the database.

```sql
Backup database database_name to disk = 'location';
```

## tables

to check the list of all tables;

```sql
show tables;

# output result
+----------------------------+
| Tables_in_employees_record |
+----------------------------+
| employees                  |
+----------------------------+
```

to check the data table structure 

```sql
# syntex
desc table_name;

# command
desc employees;
#output result
+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| employee_id      | int(11)      | NO   |     | NULL    |       |
| employee_name    | varchar(100) | NO   |     | NULL    |       |
| employee_edu     | varchar(50)  | YES  |     | NULL    |       |
| employee_address | varchar(200) | YES  |     | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
4 rows in set (0.002 sec)
```

to create data tables what cmd;

```sql
# syntex
Create table table_name {
	lable data_type some_constrants,
	....
}; 

CREATE TABLE employees (
	employee_id int NOT NULL,
	employee_name varchar(100) NOT NULL,
	employee_edu varchar(50),
	employee_address varchar(200)
);
```

how to modify the structure of table.

```sql
# syntex
ALTER TABLE table_name ADD col_name data_type;

# example 
ALTER TABLE employees ADD employee_email varchar(200);
# output result
Query OK, 0 rows affected (0.015 sec)
Records: 0  Duplicates: 0  Warnings: 0

```

how to delete table;

```sql
drop table table_name;

# output result
Query OK, 101 rows affected (0.301 sec)
```

how to make column as primary key

```sql
# syntex
Create table table_name {
	lable data_type some_constrants primary key,
	....
}; 
Create table table_name {
	col_name data_type some_constrants,
	....
	PRIMARY KEY(col_name)
}; 

CREATE TABLE employees (
	employee_id int NOT NULL primary key,
	employee_name varchar(100) NOT NULL,
	employee_edu varchar(50),
	employee_address varchar(200)
);

# ALTER TABLE TO ADD PRIMARY KEY
ALTER TABLE table_name ADD PRIMARY KEY(col_name);
```

how to define the relation between tables by using foreign key

```sql
# syntex
Create table table_name {
	lable data_type some_constrants ,
	....
	CONSTRAINT employees_emp_address FOREIGN KEY (PRIMARY_KEY_COLUMN_NAME) REFERENCES other_table_name(PRIMARY_KEY) 
}; 

Create table table_name {
	lable data_type some_constrants ,
	....
	FOREIGN KEY (PRIMARY_KEY_COLUMN_NAME) REFERENCES other_table_name(PRIMARY_KEY) 
}; 


CREATE TABLE employee_address (
	employee_id int NOT NULL primary key,
	temp_address varchar(100) NOT NULL,
	perma_address varchar(50) NOT NULL,
	FOREIGN KEY(employee_id) 
    	REFERENCES employees(employee_id)
);

# insert data in both table
INSERT INTO employees VALUES (1, 'abc', 'b.tech', 'chd@gmail.com');
INSERT INTO employee_address VALUES (1, 'delhi', 'kolkata');

# if want to remove the entry of employee_address it will gives us a error
# how to resolve that.
```



how to make column as auto increment

```sql
# syntex
Create table table_name {
	lable data_type some_constrants primary key AUTO_INCREMENT,
	....
}; 

# example
CREATE TABLE employees (
	employee_id int NOT NULL primary key AUTO_INCREMENT,
	employee_name varchar(100) NOT NULL,
	employee_edu varchar(50),
	employee_address varchar(200)
);
# output result
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| employee_id      | int(11)      | NO   | PRI | NULL    | auto_increment |
| employee_name    | varchar(100) | NO   |     | NULL    |                |
| employee_edu     | varchar(50)  | YES  |     | NULL    |                |
| employee_address | varchar(200) | YES  |     | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+
```



## manupalating the data in tables

to store data in tables.

```sql
# syntex
INSERT INTO table_name (column1, column2, ....) values (value1, value2, value3, ...);

# example 
INSERT INTO employees (employee_id, employee_name, employee_edu, employee_address) 
VALUES (18901, 'abc', 'b.tech', 'chd');
# output result
Query OK, 1 row affected (0.008 sec)
```

to view the data from tables.

```sql
# syntex 
SELECT * FROM table_name; # list out all the entries.
SELECT col1, col2, col3 FROM table_name; # list with some columns
SELECT * OR col1, col2 FROM table_name WHERE col1 = "some unique value"; # filter the result based on condition

#example
SELECT * FROM employees;
# output result
+-------------+---------------+--------------+------------------+
| employee_id | employee_name | employee_edu | employee_address |
+-------------+---------------+--------------+------------------+
|       18901 | abc           | b.tech       | chd              |
|       18902 | def           | b.tech       | chd1             |
|       18903 | def           | b.tech       | chd2             |
+-------------+---------------+--------------+------------------+

SELECT employee_id, employee_name FROM employees;
# output result
+-------------+---------------+
| employee_id | employee_name |
+-------------+---------------+
|       18901 | abc           |
|       18902 | def           |
|       18903 | def           |
+-------------+---------------+

SELECT * FROM employees WHERE employee_id = 18902;
# output result
+-------------+---------------+--------------+------------------+
| employee_id | employee_name | employee_edu | employee_address |
+-------------+---------------+--------------+------------------+
|       18902 | def           | b.tech       | chd1             |
+-------------+---------------+--------------+------------------+
```

how to update the data in tables.

```sql
# syntex
UPDATE table_name SET col1 = value1, col2 = value2, ... WHERE condition;

# example
UPDATE employees SET employee_email = 'abc@gmail.com' WHERE employee_id = 18901;
# output result
Query OK, 1 row affected (0.008 sec)
Rows matched: 1  Changed: 1  Warnings: 0

+-------------+---------------+--------------+------------------+----------------+
| employee_id | employee_name | employee_edu | employee_address | employee_email |
+-------------+---------------+--------------+------------------+----------------+
|       18901 | abc           | b.tech       | chd              | abc@gmail.com  |
|       18902 | def           | b.tech       | chd1             |                |
|       18903 | def           | b.tech       | chd2             |                |
+-------------+---------------+--------------+------------------+----------------+
```

how to delete the record for table.

```sql
# syntex
DELETE FROM table_name WHERE condition;

# example
DELETE FROM employees WHERE employee_id = 18903
# output result
Query OK, 1 row affected (0.008 sec)
+-------------+---------------+--------------+------------------+----------------+
| employee_id | employee_name | employee_edu | employee_address | employee_email |
+-------------+---------------+--------------+------------------+----------------+
|       18901 | abc           | b.tech       | chd              | abc@gmail.com  |
|       18902 | def           | b.tech       | chd1             | def@gmail.com  |
+-------------+---------------+--------------+------------------+----------------+
```

how to remove all records and reset the table cache.

```sql
# syntex
TRUNCATE TABLE table_name;

# example 
TRUNCATE TABLE employees;
```

## tasks

1. what is normalization in relation database management system (RDBMS)?

2. check for all the mysql data types.

3. practice all basic command in cli.

4. check the difference between delete and truncate?

5. check for the other auto_increment options.

6. what is contraints in foreign key?

7. learn how to use joins in tables?

   





