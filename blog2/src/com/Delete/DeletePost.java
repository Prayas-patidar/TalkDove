package com.Delete;

import java.sql.Connection;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.mysql.jdbc.Statement;

public class DeletePost {
String postid;

public String getPostid() {
	return postid;
}

public void setPostid(String postid) {
	this.postid = postid;
}
public String execute(){
	
	Connection con = DBConnection.getConnection();
	try {
		
		String sql= "update  allpost set status = 0  where postid = '"+postid+"' ";
		Statement st = (Statement) con.createStatement();
		st.executeUpdate(sql);
		String sql1= "update "+CurrentUserInfo.getEmail()+"post set status = 0  where postid = '"+postid+"' ";
		st.executeUpdate(sql1);
		
//		String sql2= "drop table"+postid+"comment";
//		Statement st2 = (Statement) con.createStatement();
//		st.executeUpdate(sql2);
//		String sql3= "drop table"+postid+"like";
//		Statement st3 = (Statement) con.createStatement();
//		st.executeUpdate(sql3);
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return "success";
}
}
