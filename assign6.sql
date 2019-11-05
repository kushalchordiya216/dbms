SQL> create table Emp22(emp_id number,emp_name varchar2(25),salary float);

Table created.

SQL> describe Emp22;
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID 					    NUMBER
 EMP_NAME					    VARCHAR2(25)
 SALARY 					    FLOAT(126)

SQL> insert into Emp22 values(&emp_id,'&emp_name',&salary);
Enter value for emp_id: 101
Enter value for emp_name: max
Enter value for salary: 765688.67
old   1: insert into Emp22 values(&emp_id,'&emp_name',&salary)
new   1: insert into Emp22 values(101,'max',765688.67)

1 row created.

SQL> /
Enter value for emp_id: 102
Enter value for emp_name: john
Enter value for salary: 806345.34 
old   1: insert into Emp22 values(&emp_id,'&emp_name',&salary)
new   1: insert into Emp22 values(102,'john',806345.34)

1 row created.

SQL> /  
Enter value for emp_id: 103
Enter value for emp_name: diane
Enter value for salary: 1065477.43 
old   1: insert into Emp22 values(&emp_id,'&emp_name',&salary)
new   1: insert into Emp22 values(103,'diane',1065477.43)

1 row created.

SQL> select * from emp22
  2  ;

    EMP_ID EMP_NAME			 SALARY
---------- ------------------------- ----------
       101 max			      765688.67
       102 john 		      806345.34
       103 diane		     1065477.43

-------------------------------------------- EXPLICIT CURSOR ------------------------------------------------

SQL> set serveroutput on;
SQL> DECLARE
CURSOR exp_cursor IS SELECT emp_name FROM emp22;
exp_cursor_var emp22.emp_name%type;
var_rows number;

BEGIN
OPEN exp_cursor;

LOOP
FETCH exp_cursor INTO exp_cursor_var;
var_rows:=exp_cursor%ROWCOUNT;
IF exp_cursor%NOTFOUND
THEN
EXIT;
END IF;
Dbms_output.put_line('Employee Fetched:'||exp_cursor_var);
END LOOP;
Dbms_output.put_line('Total rows fetched is '||var_rows);
CLOSE exp_cursor;
END;  2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20  
 21  /
Employee Fetched:max
Employee Fetched:john
Employee Fetched:diane
Total rows fetched is 3

PL/SQL procedure successfully completed

-------------------------------------------- IMPLICIT CURSOR ------------------------------------------------


BEGIN
UPDATE emp22 SET salary=1000000 WHERE emp_name='diane';
dbms_output.put_line('total rows updated are: '|| SQL%ROWCOUNT);
END;
  2    3    4    5  
  6  /
total rows updated are: 1

PL/SQL procedure successfully completed.

-------------------------------------------- CURSOR FOR LOOP ------------------------------------------------

SQL> DECLARE
CURSOR 	exp_cursor IS SELECT emp_name,salary FROM emp22; 
BEGIN
FOR exp_cursor_var IN exp_cursor
LOOP
Dbms_output.put_line(exp_cursor_var.emp_name ||' earns: Rs.'||exp_cursor_var.salary);
END LOOP;
END;  2    3    4    5    6    7    8  
  9  /
max earns: Rs.765688.67
john earns: Rs.806345.34
diane earns: Rs.1000000

PL/SQL procedure successfully completed.

-------------------------------------------- PARAMETERIZED CURSOR ------------------------------------------------

DECLARE
  cursor c(no number) is select * from emp22
  where emp_id = no;
  tmp emp22%rowtype;
BEGIN 
  FOR tmp IN c(101) LOOP
  dbms_output.put_line('EMP_No:    '||tmp.emp_id);
  dbms_output.put_line('EMP_Name:  '||tmp.emp_name);
  dbms_output.put_line('EMP_Salary:'||tmp.salary);      
  END Loop;
END;    2    3    4    5    6    7    8    9   10   11  
 12  /
EMP_No:    101
EMP_Name:  max
EMP_Salary:765688.67

PL/SQL procedure successfully completed.

