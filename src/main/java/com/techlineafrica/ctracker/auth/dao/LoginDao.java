package com.techlineafrica.ctracker.auth.dao;

import com.techlineafrica.ctracker.db.Database;

import java.sql.*;

public class LoginDao {
    Connection connection = null;

    public boolean check(String unions,String branch,String password) {
        try {
            Database database = new Database();
            connection = database.getConnection();

            String query = "select * from login where unions=? and branch=? and password=?";
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, unions);
            st.setString(2, branch);
            st.setString(3, password);

            ResultSet rs = st.executeQuery();
            if(rs.next()) {

                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null)
                try {
                    connection.close();
                } catch (SQLException ignore) {}
        }
        return false;
    }
}
