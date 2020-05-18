
package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;


public class DBCreateInboxTable {

	static Statement stmt=null;
	static  String createTable="("
			+ "email varchar(25),"
			+ "username varchar(25),"
			+ "recent varchar(200),"
			+ "time DateTime,"
			+ "status varchar(25)"
			+ ")";
	
	public static int CreateTableInbox(String email){
		Connection con=DBConnection.getConnection();
		System.out.println(email);
		try{
		stmt = (Statement) con.createStatement();
		createTable = "CREATE TABLE IF NOT EXISTS Talkdove."+email+"inbox "+createTable; 
		stmt.executeUpdate(createTable);
		System.out.println("table created");
		return 1;
		}catch(Exception e){
			System.out.print(e);
			return 0;
		}
		
	}

	
	public static void addToAllChats(String email, String username){
		Connection con = DBConnection.getConnection();
		PreparedStatement ps;
		try{
		
			String insertQry ="INSERT INTO Talkdove.allchats (email,username) values(?,?)";
			ps= con.prepareStatement(insertQry);
			ps.setString(1,email);
			ps.setString(2,username);
			ps.executeUpdate();
			
		}catch(Exception e){
			
		}
	}
}
