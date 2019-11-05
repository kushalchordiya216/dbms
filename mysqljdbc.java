package jdbc1;

import java.sql.*;
import java.util.Scanner;


public class A1 {

	Connection conn=null;  //CONNECTION BANANE KE LIYE USE KARTE
	ResultSet rs=null;
	Statement stm=null;  //TO EXECUTE QUERY
	public A1()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dbms1","prem","Prem@116");    //DATABASENAME:SQL8DB/SQL7DB
			stm=conn.createStatement();
			System.out.println("Connected");
		}
		catch(Exception e)
		{
			
		}
	}
	public void insertRec()     //RECORD
	{
		try
		{
			Scanner sc=new Scanner(System.in);
			System.out.println("Enter name");
			String name=sc.nextLine();
			System.out.println("Enter age");
			int age=sc.nextInt();
								
			String q="insert into A1 values ('"+name+"',"+age+");";
			stm.executeUpdate(q);
		}
		catch(Exception e)
		{
			
		}
	}
	public void deleteRec()
	{
		try
		{
			Scanner sc=new Scanner(System.in);
			System.out.println("Enter name");
			String name=sc.nextLine();
			String q="delete from A1 where name = "+"'"+name+"'";
			stm.executeUpdate(q);
		}
		catch(Exception e)
		{
			
		}
	}
	public void editRec()
	{
		Scanner sc=new Scanner(System.in);
		try
		{
			System.out.println("Enter name");
			String name=sc.nextLine();
			System.out.println("Enter new age");
			int age=sc.nextInt();
			String q="update A1 set age = "+age+" where name = "+"'"+name+"'";
			stm.executeUpdate(q);
		}
		catch(Exception e)
		{
			
		}
	}
	public void fun()
	{
		Scanner sc=new Scanner(System.in);
		do
		{
			System.out.println("1.Insert\n2.Delete\n3.Edit\n4.Exit");
			int ch=sc.nextInt();
			switch(ch)
			{
				case 1: insertRec();
						break;
				case 2: deleteRec();
						break;
				case 3: editRec();
						break;
				case 4: return;
			}
		}while(true);
	}
	public static void main(String[] args) {
		A1 obj=new A1();
		obj.fun();
	}

}


OPEN MYSQL
CREATE TABLE A1( ID, NAME, ADDRESS)