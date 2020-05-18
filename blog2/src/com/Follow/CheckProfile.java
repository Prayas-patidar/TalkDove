package com.Follow;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.db.DBConnection;

public class CheckProfile {
public static String profilename;
public static int invalidusername=0;
public static String getProfilename() {
	return profilename;
}

public void setProfilename(String profilename) {
	CheckProfile.profilename = profilename;
}
public String execute(){
	if(profilename.contains("@gmail.com")){
	profilename= profilename.substring(0, profilename.indexOf('@'));
	profilename= profilename.replace("_", "__");
	profilename= profilename.replace(".", "_");
	}
	String sqlprofile="select username from Talkdove.login where email= '"+CheckProfile.getProfilename()+"'";
try{
	Connection con = DBConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery(sqlprofile);
	if(rs.next()){
		return "success";	
	}
}catch(Exception e ){
	
}
	invalidusername=1;
	return "fail";
}
}
