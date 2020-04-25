package com.Delete;

import java.sql.Connection;

import com.db.DBConnection;
import com.mysql.jdbc.Statement;


public class DeleteComment {
	public String CUser, postid,description;
	public String getCUser() {
		return CUser;
	}
	public void setCUser(String cUser) {
		CUser = cUser;
	}
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String execute(){
		
		Connection con = DBConnection.getConnection();
		try {
			
			String sql= "update "+postid+"comment  set status = 0  where CUsername = '"+CUser+"' && description = '"+description+"' ";
			Statement st = (Statement) con.createStatement();
			st.executeUpdate(sql);
			postid = postid.substring(0 , postid.indexOf("post"));
			sql= "delete from "+postid+"notify where userid = '"+CUser+"' and type = 'comment' and msg = '"+description+"' ";
			Statement st1 = (Statement) con.createStatement();
			st1.executeUpdate(sql);
			System.out.println(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
}
