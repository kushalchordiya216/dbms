                                                           ASSIGNMENT A7
----------------------------------------------------------------------------------------------------------------------------------------------------
create table customers22(cust_id number,name varchar2(25),total_purchase float);

Table created.

SQL> describe customers22;
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUST_ID					    NUMBER
 NAME						    VARCHAR2(25)
 TOTAL_PURCHASE 				    NUMBER

SQL> create table category22(cust_id number,name varchar2(25),class varchar(15));

Table created.

SQL> describe category22;
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUST_ID					    NUMBER
 NAME						    VARCHAR2(25)
 CLASS						    VARCHAR2(15)


SQL> select * from Customers22;

   CUST_ID NAME 		     TOTAL_PURCHASE
---------- ------------------------- --------------
       701 hrishikesh			      15000
       702 ketaki			       6798
       703 prajakti			       3712
       704 aditya			       1000
       705 ishaan			       8900
       706 devashish			      18000

6 rows selected.


----------------------------------------------------------------------------------------------------------------------------------------------------

Write a Stored Procedure namely proc_Grade for the categorization of  customer. If purchase by customer in year is <=20000 and >=10000 then customer will be placed in platinum category. If  purchase by customer is between 9999 and 5000 category is gold, if purchase between 4999 and 2000 category is silver. 

----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Categorize(id IN NUMBER)
  2  
IS
  4  
cat_id NUMBER;
cat_name VARCHAR2(25);
tp number;
cat_class VARCHAR2(25);
  9  
BEGIN
SELECT * INTO cat_id,cat_name,tp FROM customers22 WHERE cust_id=id;
IF tp<=20000 AND tp>=10000 THEN
cat_class:='platinum';
ELSIF tp<=9999 AND tp>=5000 THEN
cat_class:='gold';
ELSIF tp<=4999 AND tp>=2000 THEN
cat_class:='silver';
ELSE
cat_class:='-';
END IF;
 21  
INSERT INTO category22 values(cat_id,cat_name,cat_class);
 23  
EXCEPTION
when no_data_found then
dbms_output.put_line('No such Customer!');
when others then
dbms_output.put_line('Error occured!');
 29  
 30  END;
 31  
 32  /

Procedure created.

SQL> exec Categorize(702);

PL/SQL procedure successfully completed.

SQL> select * from Category22;

   CUST_ID NAME 		     CLASS
---------- ------------------------- ---------------
       702 ketaki		     gold

SQL> 

