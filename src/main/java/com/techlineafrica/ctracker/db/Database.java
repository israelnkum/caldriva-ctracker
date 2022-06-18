package com.techlineafrica.ctracker.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private String url;
    private String username;
    private String password;

    public Database(){
        this.setUrl("jdbc:mysql://localhost/ctracker");
        this.setUsername("root");
        this.setPassword("");
    }

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("MySQL JDBC driver missing in classpath");
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(this.getUrl(), this.getUsername(), this.getPassword());
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
