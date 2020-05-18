package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DBCreateTableFollower {

	public static int CreateFollowerTable(String postid){
	    Statement stmt=null;


	     String createFollowerTable=" ( FUsername VARCHAR(40) NOT NULL,time timestamp NOT NULL DEFAULT current_timestamp, status INT NOT NULL DEFAULT 1 ) ";
		Connection con=DBConnection.getConnection();
		try{
			
		stmt = (Statement) con.createStatement();
		System.out.println(postid);
		createFollowerTable = "CREATE TABLE Talkdove."+postid+"follower "+createFollowerTable; 
		stmt.executeUpdate(createFollowerTable);
		System.out.println("table created follower");
		return 1;
		}catch(Exception e){
			System.out.println(e+" error in creating follower table");
			return 0;
		}

	   }
	
}
