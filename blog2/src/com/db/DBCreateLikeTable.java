package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DBCreateLikeTable {
	
	public static int CreatePostLikeTable(String postid){
		    Statement stmt=null;
	
		

		     String createLikeTable=" ("
		            + "CUsername VARCHAR(40) NOT NULL,"
		    		+"time timestamp NOT NULL DEFAULT current_timestamp,"
		            + "status INT NOT NULL default 1)";
			Connection con=DBConnection.getConnection();
			try{
				
			stmt = (Statement) con.createStatement();
			System.out.println(postid);
			createLikeTable = "CREATE TABLE Talkdove."+postid+"Like "+createLikeTable; 
			stmt.executeUpdate(createLikeTable);
			System.out.println("table created like ho gai h "+postid+"like");
			return 1;
			}catch(Exception e){
				System.out.println(e+"     create table post like  nhi hui");
				return 0;
			}
	
		   }

}
