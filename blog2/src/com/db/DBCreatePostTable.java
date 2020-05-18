package com.db;

import java.sql.Connection;
import java.sql.Statement;


public class DBCreatePostTable {

	static Statement stmt=null;
	static  String createTable=" ("
	        + "postid VARCHAR(40) NOT NULL,"
	        + "image LONGBLOB NULL,"
	        + "description VARCHAR(200) NULL,"
	        + "time timestamp NOT NULL DEFAULT current_timestamp,"
	        + "status INT NOT NULL default 1)";
	public static int CreateTablePost(String email){
		Connection con=DBConnection.getConnection();
		
		try{
		stmt = (Statement) con.createStatement();
		createTable = "CREATE TABLE Talkdove."+email+"post "+createTable; 
		stmt.executeUpdate(createTable);
		System.out.println("table created");
		return 1;
		}catch(Exception e){
			System.out.print(e);
			return 0;
		}
		
	}
}
