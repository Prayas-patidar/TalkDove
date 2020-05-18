package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DBCreateCommentTable {
	
	public static int CreatePostCommentTable(String postid){
	    Statement stmt=null;
		
 
	     String createCommentTable=" ("
	            + "CUsername VARCHAR(40) NOT NULL,"
	            + "image BLOB NULL,"
	            + "description VARCHAR(200) NULL,"+
	            "time timestamp NOT NULL DEFAULT current_timestamp,"
	            + "status INT NOT NULL default 1)";
		Connection con=DBConnection.getConnection();
		try{
			
		stmt = (Statement) con.createStatement();
		System.out.println(postid);
		createCommentTable = "CREATE TABLE Talkdove."+postid+"comment "+createCommentTable; 
		stmt.executeUpdate(createCommentTable);
		System.out.println("table created comment"+postid+"comment");
		return 1;
		}catch(Exception e){
			System.out.println(e+"     create table post comment nhi hui");
			return 0;
		}

	   }
}
