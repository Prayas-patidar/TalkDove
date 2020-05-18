package com.chats;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import java.sql.Connection;

public class CurrentChatInfo {
	static String rEmail;
	static String rUsername;
	static String tableName;
	
	public static String getTableName(){
		return tableName;
	}
	
	public static String getrEmail() {
		return rEmail;
	}
	public void setrEmail(String rEmail) {
		this.rEmail = rEmail;
	}
	public static String getrUsername() {
		return rUsername;
	}
	public void setrUsername(String rUsername) {
		this.rUsername = rUsername;
	}
	
	public String execute(){
		generateName(CurrentUserInfo.getEmail(),getrEmail());
		Connection con = DBConnection.getConnection();
		try
		{
			Statement st =con.createStatement();
			st.executeUpdate("Update allchats set status = '"+getrEmail()+"' where email='"+CurrentUserInfo.getEmail()+"'");
		}catch(Exception e){
			return("fail");	
		}
		return "success";
	}
	
	public String closeStatus(){
		Connection con =DBConnection.getConnection();
		try{
		Statement st =con.createStatement();
		st.executeUpdate("Update allchats set status = 'offline' where email='"+CurrentUserInfo.getEmail()+"'");
		}catch(Exception e){
			return "Fail";
		}
		return"success";
	}
	
	private void generateName(String fromId, String toId){
		ArrayList<String> nameList = new ArrayList<>();
		nameList.add(fromId);
		nameList.add(toId);
		Collections.sort(nameList);
		tableName = nameList.get(0)+nameList.get(1);
		System.out.println(tableName);
	}

}
