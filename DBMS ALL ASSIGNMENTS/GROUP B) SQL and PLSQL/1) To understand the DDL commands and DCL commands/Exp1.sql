mysql: [Warning] C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe: ignoring option '--no-beep' due to invalid value ''.
Enter password: *****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create student
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student' at line 1
mysql> create database student;
ERROR 1007 (HY000): Can't create database 'student'; database exists
mysql> create database students;
Query OK, 1 row affected (0.02 sec)

mysql> drop students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'students' at line 1
mysql> drop database students;
Query OK, 0 rows affected (0.04 sec)

mysql> create database students;
Query OK, 1 row affected (0.01 sec)

mysql> use students;
Database changed
mysql> create table student(roll_no varchar(20) not null, name varchar(30) not null, grade int);
Query OK, 0 rows affected (0.06 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | varchar(20) | NO   |     | NULL    |       |
| name    | varchar(30) | NO   |     | NULL    |       |
| grade   | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> delete student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> drop table student;
Query OK, 0 rows affected (0.04 sec)

mysql> create table student(roll_no varchar(20) not null auto_increment, name varchar(30) not null, grade int, phone int unique,primary key(roll_no));
ERROR 1063 (42000): Incorrect column specifier for column 'roll_no'
mysql> create table student(roll_no varchar(20) not null, name varchar(30) not null, grade int, phone int unique,primary key(roll_no));
Query OK, 0 rows affected (0.04 sec)

mysql> alter table student add city varchar(20) after grade;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | varchar(20) | NO   | PRI | NULL    |       |
| name    | varchar(30) | NO   |     | NULL    |       |
| grade   | int         | YES  |     | NULL    |       |
| city    | varchar(20) | YES  |     | NULL    |       |
| phone   | int         | YES  | UNI | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table student add fees decimal(18,2) default 6000.00 after phone;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| roll_no | varchar(20)   | NO   | PRI | NULL    |       |
| name    | varchar(30)   | NO   |     | NULL    |       |
| grade   | int           | YES  |     | NULL    |       |
| city    | varchar(20)   | YES  |     | NULL    |       |
| phone   | int           | YES  | UNI | NULL    |       |
| fees    | decimal(18,2) | YES  |     | 6000.00 |       |
+---------+---------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> alter table student modify salary decimal(18,2) default 7000.00;
ERROR 1054 (42S22): Unknown column 'salary' in 'student'
mysql> alter table student modify fees decimal(18,2) default 7000.00;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table student add dept_id varchar(10) after fees;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| roll_no | varchar(20)   | NO   | PRI | NULL    |       |
| name    | varchar(30)   | NO   |     | NULL    |       |
| grade   | int           | YES  |     | NULL    |       |
| city    | varchar(20)   | YES  |     | NULL    |       |
| phone   | int           | YES  | UNI | NULL    |       |
| fees    | decimal(18,2) | YES  |     | 7000.00 |       |
| dept_id | varchar(10)   | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> create table dept(dept_id varchar(10) references student(dept_id),dept_name varchar(20) not null, budget int, primary key(dept_id));
Query OK, 0 rows affected (0.06 sec)

mysql> desc student;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| roll_no | varchar(20)   | NO   | PRI | NULL    |       |
| name    | varchar(30)   | NO   |     | NULL    |       |
| grade   | int           | YES  |     | NULL    |       |
| city    | varchar(20)   | YES  |     | NULL    |       |
| phone   | int           | YES  | UNI | NULL    |       |
| fees    | decimal(18,2) | YES  |     | 7000.00 |       |
| dept_id | varchar(10)   | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> desc dept;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | varchar(10) | NO   | PRI | NULL    |       |
| dept_name | varchar(20) | NO   |     | NULL    |       |
| budget    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> alter table student add foreign key(dept_id) references student(dept_id);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'student_ibfk_1' in the referenced table 'student'
mysql> alter table student add foreign key(dept_id) references dept(dept_id);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| roll_no | varchar(20)   | NO   | PRI | NULL    |       |
| name    | varchar(30)   | NO   |     | NULL    |       |
| grade   | int           | YES  |     | NULL    |       |
| city    | varchar(20)   | YES  |     | NULL    |       |
| phone   | int           | YES  | UNI | NULL    |       |
| fees    | decimal(18,2) | YES  |     | 7000.00 |       |
| dept_id | varchar(10)   | YES  | MUL | NULL    |       |
+---------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table student modify fees not null check(fees>=3000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not null check(fees>=3000)' at line 1
mysql> alter table student modify fees decimal(18,2) not null check(fees>=3000);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> grant select on student to user1;
ERROR 1410 (42000): You are not allowed to create a user with GRANT
mysql> create user user1;
Query OK, 0 rows affected (0.02 sec)

mysql> grant select on student to user1;
Query OK, 0 rows affected (0.01 sec)

mysql> revoke select on student from user1;
Query OK, 0 rows affected (0.01 sec)

mysql>
