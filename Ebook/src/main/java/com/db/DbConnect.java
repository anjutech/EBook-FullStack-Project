package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	private static Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  
			String url = "jdbc:mysql://localhost:3306/ebook";
			String username = "root";
			String password = "";
			conn = DriverManager.getConnection(url, username, password);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return conn;
	}
	
}
