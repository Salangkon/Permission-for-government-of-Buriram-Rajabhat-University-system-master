package com.hillert.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectDB {
	public Connection openConnect(){
		Connection connect = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//connect = DriverManager.getConnection("jdbc:mysql://localhost/ask" + "?user=root&password=");
			connect = DriverManager.getConnection("jdbc:mysql:///ask?useUnicode=true&characterEncoding=utf-8", "root", "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return connect;
		
	}

	
	
	
	/*public static void main(String[] args) {
		ConnectDB con = new ConnectDB();
		Connection connect = null;
		connect = con.openConnect();
		if (connect != null) {
			System.out.println("Database Connected.");
		} else {
			System.out.println("Database Connect Failed.");
		}

	}*/
}
