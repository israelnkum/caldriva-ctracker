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
				Class.forName("com.mysql.cj.jdbc.Driver");
//				conn = DriverManager.getConnection("jdbc:mysql://localhost/caldriva_ctracker","techLineAfrica","T3klyn@frika_2022");
				conn = DriverManager.getConnection("jdbc:mysql://localhost/ctracker","root","");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return conn;
	}
}
