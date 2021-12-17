package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConfigConnection {
	private static ConfigConnection instance;

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/vote?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
		} catch (Exception e) {
			System.out.println("Erreur " + e.getMessage());
		}
		return connection;
	}
	
	public static ConfigConnection getInstance() {
		if(instance == null) {
			instance = new ConfigConnection();
		}
		return instance;
	}

}
