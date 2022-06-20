package loginDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import control.DBConnection;
public class loginDao {
	String query = "select * from login where unions=? and branch=? and password=?";

	public boolean check(String unions,String branch,String password) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DBConnection.getConnection();
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, unions);
			st.setString(2, branch);
			st.setString(3, password);
			
			ResultSet rs = st.executeQuery(); 
			System.out.println();
			if(rs.next()) {
				
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

}
