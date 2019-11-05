SQL> insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status');
Enter value for cust_id: 1
Enter value for name: harry
Enter value for dateofpayment: 17-JUL-2019
Enter value for nameofscheme: abc
Enter value for status: N
old   1: insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status')
new   1: insert into Cust22 Values(1,'harry','17-JUL-2019','abc','N')

1 row created.

SQL> /
Enter value for cust_id: 2
Enter value for name: hermione
Enter value for dateofpayment: 20-JUL-2019
Enter value for nameofscheme: abc
Enter value for status: N
old   1: insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status')
new   1: insert into Cust22 Values(2,'hermione','20-JUL-2019','abc','N')

1 row created.

SQL> /
Enter value for cust_id: 3
Enter value for name: ron
Enter value for dateofpayment: 03-AUG-2019
Enter value for nameofscheme: xyz
Enter value for status: N
old   1: insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status')
new   1: insert into Cust22 Values(3,'ron','03-AUG-2019','xyz','N')

1 row created.

SQL> /
Enter value for cust_id: 4
Enter value for name: neville
Enter value for dateofpayment: 06-JUL-2019
Enter value for nameofscheme: abc
Enter value for status: N
old   1: insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status')
new   1: insert into Cust22 Values(4,'neville','06-JUL-2019','abc','N')

1 row created.

SQL> /
Enter value for cust_id: 5
Enter value for name: ginny
Enter value for dateofpayment: 21-JUL-2019
Enter value for nameofscheme: xyz
Enter value for status: N
old   1: insert into Cust22 Values(&cust_id,'&name','&dateofpayment','&nameofscheme','&status')
new   1: insert into Cust22 Values(5,'ginny','21-JUL-2019','xyz','N')

1 row created.

SQL> select * from Cust22;

   CUST_ID NAME 		DATEOFPA NAMEOFSCHEME	 S
---------- -------------------- -------- --------------- -
	 1 harry		17-07-19 abc		 N
	 2 hermione		20-07-19 abc		 N
	 3 ron			03-08-19 xyz		 N
	 4 neville		06-07-19 abc		 N
	 5 ginny		21-07-19 xyz		 N

SQL> DECLARE
   id NUMBER;
   nameofsch varchar2(20);
   ref_d date;
   payment_d date;
   days NUMBER;
   fine NUMBER;
BEGIN
   id:=&cust_id;
   nameofsch:='&name_of_scheme';
   ref_d:='01-JUL-2019';
	select dateofpayment INTO payment_d FROM Cust22 WHERE id=cust_id AND nameofsch=nameofscheme;
	select payment_d-ref_d INTO days FROM DUAL;
	IF days>=15 AND days<30 THEN 
		fine:=days*5;

	ELSE
		IF days>=30 THEN
			fine:=days*50;
		ELSE
			fine:=0;
		end if;
	end if;
	IF fine <>0 THEN
	insert into Fine22 values(id,payment_d,fine);
	end if;
	update Cust22 set status='P' where cust_id=id;
	
EXCEPTION
	when no_data_found then
	dbms_output.put_line('Customer id and scheme do not match!');
	when others then
	dbms_output.put_line('Error occured!');
	--dbms_output.put_line(DAYS);
END;
  2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28   29   30   31   32   33   34   35   36  
 37  /
Enter value for cust_id: 1
old   9:    id:=&cust_id;
new   9:    id:=1;
Enter value for name_of_scheme: abc
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='abc';

PL/SQL procedure successfully completed.

SQL> select * from Fine22;

   CUST_ID ACTUALDA	AMOUNT
---------- -------- ----------
	 1 17-07-19	    80

SQL> select * from Cust22;

   CUST_ID NAME 		DATEOFPA NAMEOFSCHEME	 S
---------- -------------------- -------- --------------- -
	 1 harry		17-07-19 abc		 P
	 2 hermione		20-07-19 abc		 N
	 3 ron			03-08-19 xyz		 N
	 4 neville		06-07-19 abc		 N
	 5 ginny		21-07-19 xyz		 N

Enter value for cust_id: 3
old   9:    id:=&cust_id;
new   9:    id:=3;
Enter value for name_of_scheme: ajdfs
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='ajdfs';
Customer id and scheme do not match!

PL/SQL procedure successfully completed.

Enter value for cust_id: 2
old   9:    id:=&cust_id;
new   9:    id:=2;
Enter value for name_of_scheme: abc
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='abc';

PL/SQL procedure successfully completed.

SQL> /
Enter value for cust_id: 3
old   9:    id:=&cust_id;
new   9:    id:=3;
Enter value for name_of_scheme: xyz
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='xyz';

PL/SQL procedure successfully completed.

SQL> /
Enter value for cust_id: 4
old   9:    id:=&cust_id;
new   9:    id:=4;
Enter value for name_of_scheme: abc
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='abc';

PL/SQL procedure successfully completed.

SQL> 5
  5*	payment_d date;
SQL> /
Enter value for cust_id: 5
old   9:    id:=&cust_id;
new   9:    id:=5;
Enter value for name_of_scheme: xyz
old  10:    nameofsch:='&name_of_scheme';
new  10:    nameofsch:='xyz';

PL/SQL procedure successfully completed.





