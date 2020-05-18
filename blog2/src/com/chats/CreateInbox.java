package com.chats;

import java.sql.Connection;
import java.sql.Statement;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;

public class CreateInbox {
	Connection con=null;
	Statement st =null;
	String qry;
	String myTableName = CurrentUserInfo.getEmail()+"inbox";
	public void createMyTable(){
		try{
		con= DBConnection.getConnection();
		st = con.createStatement();
		
		setQry(myTableName);
		st.executeUpdate(qry);
		
	
		st.close();
		con.close();
		}catch(Exception e){
			
		}
	}
	public void createTable(String name){
		setQry(name);
		try{
			
			con= DBConnection.getConnection();
			st = con.createStatement();
			st.executeUpdate(qry);
			st.close();
			con.close();
		
		}catch(Exception e){
			
		}
	}
	
	void setQry(String tname){
		qry= "Create table IF NOT EXISTS "+tname+" ("
				+ "email varchar(25),"
				+ "username varchar(25),"
				+ "recent varchar(200),"
				+ "time DateTime,"
				+ "status varchar(25)"
				+ ")";
	
	}
		
}
