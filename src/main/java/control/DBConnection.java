package control;
import java.sql.*;

public class DBConnection {

private static Connection conn;
	
	private DBConnection(){}
	
	public static Connection getConnection()
	{
		try
		{
			if(conn==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost/caldriva","root","root");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;
	}
}
