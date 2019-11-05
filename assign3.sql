 MariaDB [te1122db]> Select * from Departments;
+---------+------------+
| dept_id | dept_name  |
+---------+------------+
|       1 | Comp       |
|       2 | IT         |
|       3 | Mech       |
|       4 | Electrical |
|       5 | Civil      |
|       6 | EnTC       |
+---------+------------+
6 rows in set (0.00 sec)

MariaDB [te1122db]> LOAD DATA LOCAL INFILE '/home/te/31122/prof' INTO TABLE Professors;
Query OK, 8 rows affected, 10 warnings (0.02 sec)    
Records: 8  Deleted: 0  Skipped: 0  Warnings: 10



MariaDB [te1122db]> Select * from Professors;
+---------+------------+------------+---------+-----------------+----------+------------+-------------------+------------+----------+
| prof_id | prof_fname | prof_lname | dept_id | designation     | salary   | DOJ        | email             | phone      | city     |
+---------+------------+------------+---------+-----------------+----------+------------+-------------------+------------+----------+
|       0 | NULL       | NULL       |    NULL | NULL            |     NULL | NULL       | NULL              |       NULL | NULL     |
|       1 | Michael    | Scott      |       3 | HOD1            | 12000000 | 1995-06-30 | mike@gmail.com    | 9876543210 | Scranton |
|       2 | Jim        | Halpert    |       6 | HOD2            | 11000000 | 1999-05-10 | jim@gmail.com     | 9999999999 | Scranton |
|       3 | Pam        | Beesley    |       2 | Prof            |  6000000 | 1999-06-12 | pam@gmail.com     | 8888888888 | Scranton |
|       4 | Dwight     | Schrute    |       3 | Asst to the HOD |  6000000 | 1998-05-17 | beets@gmail.com   | 6666666666 | Scranton |
|       5 | Angela     | Martin     |       6 | Prof            |  6000000 | 2000-09-12 | cats@gmail.com    | 3333333333 | Scranton |
|       6 | Oscar      | Martinez   |       4 | Prof            |  6000000 | 2000-07-01 | oscae@gmail.com   | 7777777777 | Scranton |
|       7 | Phyllis    | Vance      |       5 | Prof            |  6000000 | 1996-06-10 | phyllis@gmail.com | 8989898989 | Scranton |
+---------+------------+------------+---------+-----------------+----------+------------+-------------------+------------+----------+
8 rows in set (0.00 sec)

MariaDB [te1122db]> LOAD DATA LOCAL INFILE '/home/te/31122/work' INTO TABLE Works;
Query OK, 8 rows affected, 3 warnings (0.02 sec)     
Records: 8  Deleted: 0  Skipped: 0  Warnings: 3

MariaDB [te1122db]> Select * from Works;
+---------+---------+----------+
| prof_id | dept_id | duration |
+---------+---------+----------+
|       0 |    NULL | NULL     |
|       1 |       3 | 2 hours  |
|       2 |       6 | 6 hours  |
|       3 |       2 | 6 hours  |
|       4 |       3 | 6 hours  |
|       5 |       6 | 6 hours  |
|       6 |       4 | 6 hours  |
|       7 |       5 | 6 hours  |
+---------+---------+----------+
8 rows in set (0.00 sec)

MariaDB [te1122db]> LOAD DATA LOCAL INFILE '/home/te/31122/shift' INTO TABLE Shift;
Query OK, 8 rows affected, 9 warnings (0.02 sec)     
Records: 8  Deleted: 0  Skipped: 0  Warnings: 9

MariaDB [te1122db]> Select * from Shift;
+---------+-------+-----------------+
| prof_id | shift | working_hrs     |
+---------+-------+-----------------+
|       0 | NULL  | NULL            |
|       1 | morn  | 10 to 12        |
|       2 | morn  | 10 to 12 and 1  |
|       3 | morn  | 10 to 12 and 1  |
|       4 | morn  | 10 to 12 and 1  |
|       5 | morn  | 10 to 12 and 1  |
|       6 | morn  | 10 to 12 and 1  |
|       7 | morn  | 10 to 12 and 1  |
+---------+-------+-----------------+
8 rows in set (0.00 sec)

ASSIGNMENT 3:

MariaDB [te1122db]> INSERT INTO Professors
    -> VALUE(8,'Creed','Bratton',1,'Prof',700000,'1985-06-11','itscreed@gmail.com',8686868686,'Scranton');
Query OK, 1 row affected (0.02 sec)

MariaDB [te1122db]> INSERT INTO Professors VALUE(9,'Kelly','Kapoor',1,'Prof',600000,'2016-01-01','gossip@gmail.com',8686787878,'Ahmedamad');
Query OK, 1 row affected (0.01 sec)

MariaDB [te1122db]> INSERT INTO Professors VALUE(10,'Ryan','Kapoor',2,'Prof',600000,'2016-01-01','temp@gmail.com',9986787878,'Aurangabad');
Query OK, 1 row affected (0.01 sec)

MariaDB [te1122db]> select * from Professors;
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+
| prof_id | prof_fname | prof_lname | dept_id | designation     | salary   | DOJ        | email              | phone      | city       |
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+
|       1 | Michael    | Scott      |       3 | HOD1            | 12000000 | 1995-06-30 | mike@gmail.com     | 9876543210 | Pune       |
|       2 | Jim        | Halpert    |       6 | HOD2            | 11000000 | 1999-05-10 | jim@gmail.com      | 9999999999 | Mumbai     |
|       3 | Pam        | Beesley    |       2 | Prof            |  6000000 | 1999-06-12 | pam@gmail.com      | 8888888888 | Scranton   |
|       4 | Dwight     | Schrute    |       3 | Asst to the HOD |  6000000 | 1998-05-17 | beets@gmail.com    | 6666666666 | Pune       |
|       5 | Angela     | Martin     |       6 | Prof            |  6000000 | 2000-09-12 | cats@gmail.com     | 3333333333 | Mumbai     |
|       6 | Oscar      | Martinez   |       4 | Prof            |  6000000 | 2000-07-01 | oscae@gmail.com    | 7777777777 | Scranton   |
|       7 | Phyllis    | Vance      |       5 | Prof            |  6000000 | 1996-06-10 | phyllis@gmail.com  | 8989898989 | Mumbai     |
|       8 | Creed      | Bratton    |       1 | Prof            |   700000 | 1985-06-11 | itscreed@gmail.com | 8686868686 | Scranton   |
|       9 | Kelly      | Kapoor     |       1 | Prof            |   600000 | 2016-01-01 | gossip@gmail.com   | 8686787878 | Ahmedamad  |
|      10 | Ryan       | Kapoor     |       2 | Prof            |   600000 | 2016-01-01 | temp@gmail.com     | 9986787878 | Aurangabad |
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+

MariaDB [te1122db]> SELECT * FROM Professors WHERE city='Mumbai' AND city='Pune'
    -> AND prof_fname REGEXP '^A' AND prof_fname REGEXP '^D';
Empty set (0.00 sec)

MariaDB [te1122db]> SELECT city FROM Professors;
+------------+
| city       |
+------------+
| Pune       |
| Mumbai     |
| Delhi      |
| Pune       |
| Mumbai     |
| Delhi      |
| Mumbai     |
| Delhi      |
| Ahmedamad  |
| Aurangabad |
+------------+
10 rows in set (0.00 sec)

MariaDB [te1122db]> update Professors set DOJ='2015-01-01' where DOJ='1998-05-17';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [te1122db]> update Professors
    -> set salary=salary*1.05 where DOJ='2015-01-01';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [te1122db]> select * from Professors;
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+
| prof_id | prof_fname | prof_lname | dept_id | designation     | salary   | DOJ        | email              | phone      | city       |
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+
|       1 | Michael    | Scott      |       3 | HOD1            | 12000000 | 1995-06-30 | mike@gmail.com     | 9876543210 | Pune       |
|       2 | Jim        | Halpert    |       6 | HOD2            | 11000000 | 1999-05-10 | jim@gmail.com      | 9999999999 | Mumbai     |
|       3 | Pam        | Beesley    |       2 | Prof            |  6000000 | 1999-06-12 | pam@gmail.com      | 8888888888 | Delhi      |
|       4 | Dwight     | Schrute    |       3 | Asst to the HOD |  6300000 | 2015-01-01 | beets@gmail.com    | 6666666666 | Pune       |
|       5 | Angela     | Martin     |       6 | Prof            |  6000000 | 2000-09-12 | cats@gmail.com     | 3333333333 | Mumbai     |
|       6 | Oscar      | Martinez   |       4 | Prof            |  6000000 | 2000-07-01 | oscae@gmail.com    | 7777777777 | Delhi      |
|       7 | Phyllis    | Vance      |       5 | Prof            |  6000000 | 1996-06-10 | phyllis@gmail.com  | 8989898989 | Mumbai     |
|       8 | Creed      | Bratton    |       1 | Prof            |   700000 | 1985-06-11 | itscreed@gmail.com | 8686868686 | Delhi      |
|       9 | Kelly      | Kapoor     |       1 | Prof            |   600000 | 2016-01-01 | gossip@gmail.com   | 8686787878 | Ahmedamad  |
|      10 | Ryan       | Kapoor     |       2 | Prof            |   600000 | 2016-01-01 | temp@gmail.com     | 9986787878 | Aurangabad |
+---------+------------+------------+---------+-----------------+----------+------------+--------------------+------------+------------+
10 rows in set (0.00 sec)

MariaDB [te1122db]> delete from Professors
    -> where city='Pune';
Query OK, 2 rows affected (0.01 sec)

MariaDB [te1122db]> select * from Professors;
+---------+------------+------------+---------+-------------+----------+------------+--------------------+------------+------------+
| prof_id | prof_fname | prof_lname | dept_id | designation | salary   | DOJ        | email              | phone      | city       |
+---------+------------+------------+---------+-------------+----------+------------+--------------------+------------+------------+
|       2 | Jim        | Halpert    |       6 | HOD2        | 11000000 | 1999-05-10 | jim@gmail.com      | 9999999999 | Mumbai     |
|       3 | Pam        | Beesley    |       2 | Prof        |  6000000 | 1999-06-12 | pam@gmail.com      | 8888888888 | Delhi      |
|       5 | Angela     | Martin     |       6 | Prof        |  6000000 | 2000-09-12 | cats@gmail.com     | 3333333333 | Mumbai     |
|       6 | Oscar      | Martinez   |       4 | Prof        |  6000000 | 2000-07-01 | oscae@gmail.com    | 7777777777 | Delhi      |
|       7 | Phyllis    | Vance      |       5 | Prof        |  6000000 | 1996-06-10 | phyllis@gmail.com  | 8989898989 | Mumbai     |
|       8 | Creed      | Bratton    |       1 | Prof        |   700000 | 1985-06-11 | itscreed@gmail.com | 8686868686 | Delhi      |
|       9 | Kelly      | Kapoor     |       1 | Prof        |   600000 | 2016-01-01 | gossip@gmail.com   | 8686787878 | Ahmedamad  |
|      10 | Ryan       | Kapoor     |       2 | Prof        |   600000 | 2016-01-01 | temp@gmail.com     | 9986787878 | Aurangabad |
+---------+------------+------------+---------+-------------+----------+------------+--------------------+------------+------------+
8 rows in set (0.00 sec)

MariaDB [te1122db]> select prof_fname,prof_lname FROM Professors WHERE city='Pune' OR city='Mumbai';
+------------+------------+
| prof_fname | prof_lname |
+------------+------------+
| Jim        | Halpert    |
| Angela     | Martin     |
| Phyllis    | Vance      |
+------------+------------+
3 rows in set (0.01 sec)

MariaDB [te1122db]> select prof_fname,prof_lname FROM Professors WHERE DOJ='2016-01-01' OR DOJ='2015-01-01';
+------------+------------+
| prof_fname | prof_lname |
+------------+------------+
| Kelly      | Kapoor     |
| Ryan       | Kapoor     |
+------------+------------+
2 rows in set (0.00 sec)

MariaDB [te1122db]> select * from Professors where salary=(select max(salary)from Professors);
+---------+------------+------------+---------+-------------+----------+------------+---------------+------------+--------+
| prof_id | prof_fname | prof_lname | dept_id | designation | salary   | DOJ        | email         | phone      | city   |
+---------+------------+------------+---------+-------------+----------+------------+---------------+------------+--------+
|       2 | Jim        | Halpert    |       6 | HOD2        | 11000000 | 1999-05-10 | jim@gmail.com | 9999999999 | Mumbai |
+---------+------------+------------+---------+-------------+----------+------------+---------------+------------+--------+

MariaDB [te1122db]> select prof_fname,prof_lname FROM Professors WHERE salary>10000 AND salary<20000;
Empty set (0.00 sec)

MariaDB [te1122db]> select prof_fname,prof_lname,salary,DOJ FROM Professors ORDER BY salary desc;
+------------+------------+----------+------------+
| prof_fname | prof_lname | salary   | DOJ        |
+------------+------------+----------+------------+
| Jim        | Halpert    | 11000000 | 1999-05-10 |
| Pam        | Beesley    |  6000000 | 1999-06-12 |
| Angela     | Martin     |  6000000 | 2000-09-12 |
| Oscar      | Martinez   |  6000000 | 2000-07-01 |
| Phyllis    | Vance      |  6000000 | 1996-06-10 |
| Creed      | Bratton    |   700000 | 1985-06-11 |
| Kelly      | Kapoor     |   600000 | 2016-01-01 |
| Ryan       | Kapoor     |   600000 | 2016-01-01 |
+------------+------------+----------+------------+
8 rows in set (0.00 sec)

MariaDB [te1122db]> select prof_fname,prof_lname,dept_id,DOJ FROM Professors WHERE salary='30000' OR salary='40000' OR salary='50000';
Empty set (0.00 sec)








