package com.add;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.DBConnection;
import com.mysql.jdbc.Statement;

public class StoryDisplay {
static String user,id;
public static int current=0,max=0;
public static ArrayList<String> stories = new ArrayList<String>();
public static ArrayList<String> position = new ArrayList<String>();

public static String getUser() {
	return user;
}


public  void setUser(String user) {
	StoryDisplay.user = user;
}


public static String getId() {
	return id;
}


public void setId(String id) {
	StoryDisplay.id = id;
}


public String execute(){
	try{
		stories.clear();
		position.clear();
		current=0;
		max=0;
	String	sql="select * from story where user= '"+StoryDisplay.getUser()+"' and status = 1";
	Connection Con = DBConnection.getConnection();
		Statement stcount = (Statement) Con.createStatement();
		ResultSet rscount = stcount.executeQuery(sql);
		
		while(rscount.next()){

			stories.add(""+rscount.getInt("userstoryno"));
			max++;
			position.add(""+max);
		}
		System.out.println("max  ===="+max);
		System.out.println("Stories  ===="+stories);
		System.out.println("position =========== "+position);
	current =	stories.indexOf(id);
	
	}catch(Exception ee){
		ee.printStackTrace();
	}
	return "success";
}
}
