package mysql;

import java.sql.*;  
class MysqlCon{  
	public static void main(String args[])
	{  
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/t31343","root","test");
			Statement stmt=con.createStatement();  
			String sql = "CREATE TABLE stud (name VARCHAR(10))";
			stmt.executeUpdate(sql);
			//ResultSet rs=stmt.executeQuery("select * from BOOK");
			/*while(rs.next())  
				System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));*/  
			con.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
	}  
}  