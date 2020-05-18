package com.AddComment;

import java.sql.Connection;
import java.sql.SQLException;
import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import java.sql.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;

public class AddComment extends ActionSupport {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
String comment,postid;

	public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

public String getPostid() {
	return postid;
}

public void setPostid(String postid) {
	this.postid = postid;
}

	public String execute(){
		
	Connection con = DBConnection.getConnection();
	try {
		
		String sql= "insert into "+postid+"comment(CUsername,image,description,status) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,CurrentUserInfo.getEmail());
		ps.setString(2, null); 
		ps.setString(3, comment);
		ps.setInt(4, 1);
		ps.executeUpdate();
		 String user = postid.substring(0, postid.indexOf("post"));
			if(!user.equals(CurrentUserInfo.getEmail())){
		 String  sqlq= "insert into "+user+"notify (postid,userid,msg,type) values(?,?,?,?)";
		
		PreparedStatement ps1 = con.prepareStatement(sqlq);
		ps1.setString(1,postid);
		ps1.setString(2, CurrentUserInfo.getEmail()); 
		ps1.setString(3, comment);
		ps1.setString(4, "comment");
		ps1.executeUpdate();
			}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return "success";
}
}
