package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DBCreateStoryTable {
	static Statement stmt=null;
	static  String createTable=" ("
	        + "storyid VARCHAR(40) NOT NULL,"
	        + "user VARCHAR(40)NOT NULL,"
	        + "seen INT NOT NULL DEFAULT 1)";
	public static int CreateTableStory(String email){
		Connection con=DBConnection.getConnection();
		
		try{
		stmt = (Statement) con.createStatement();
		createTable = "CREATE TABLE project."+email+"story "+createTable; 
		stmt.executeUpdate(createTable);
		System.out.println("table created");
		return 1;
		}catch(Exception e){
			System.out.print(e);
			return 0;
		}
		
	}
}
