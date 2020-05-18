package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DBCreateNotify {
	public static int CreateNotifyTable(String postid){
	    Statement stmt=null;
		
 
	     String createNotifyTable=" ("
	            + "postid VARCHAR(40) default null,"
	            + "userid VARCHAR(40) NOT NULL,"
	            + "msg VARCHAR(100) NULL,"+
	              "type varchar(20) not null,"
	            + "seen INT(10) NOT NULL default 1,"
	            + "time timestamp NOT NULL DEFAULT current_timestamp)";
		Connection con=DBConnection.getConnection();
		try{
			
		stmt = (Statement) con.createStatement();
		System.out.println(postid);
		createNotifyTable = "CREATE TABLE Talkdove."+postid+"notify "+createNotifyTable; 
		stmt.executeUpdate(createNotifyTable);
		System.out.println("table created notify  "+postid+"notify");
		return 1;
		}catch(Exception e){
			System.out.println(e+"     create table post notify nhi hui");
			return 0;
		}

	   }
}
