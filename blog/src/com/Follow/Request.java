package com.Follow;

import java.sql.Connection;
import java.sql.ResultSet;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Request {
	
	public String sender , accepter ;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getAccepter() {
		return accepter;
	}

	public void setAccepter(String accepter) {
		this.accepter = accepter;
	}
public String execute(){
		
		Connection con = DBConnection.getConnection();
		try {
			String sql1 = "select status from follow where sender= '"+sender+"'  and accepter = '"+accepter+"'";
			
             Statement st3 = (Statement)con.createStatement();
             ResultSet rs3 =(ResultSet) st3.executeQuery(sql1);
             String status="follow";
             if(rs3.next()){
             status = rs3.getString("status");
            }
             
             if(status.equals("follow")){
			String sql= "insert into follow (sender , accepter ) values (? , ?)  ";
			PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
			st.setString(1,sender);
			st.setString(2, accepter);
			st.executeUpdate();
			
			 String  sqlq= "insert into "+accepter+"notify (postid,userid,msg,type) values(?,?,?,?)";
      		PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(sqlq);
      		ps1.setString(1,null);
      		ps1.setString(2, CurrentUserInfo.getEmail()); 
      		ps1.setString(3, null);
      		ps1.setString(4, "request");
      		ps1.executeUpdate();
             }
             else if(status.equals("pending")){
            	 String sql = "delete from follow where  sender= '"+sender+"'  and accepter = '"+accepter+"'";
            	 Statement st = (Statement)con.createStatement();
            	 st.executeUpdate(sql);
            	 
            	 String  sqlq= "delete from  "+accepter+"notify where type= 'request' and userid ='"+CurrentUserInfo.getEmail()+"'";
          		Statement st1 = (Statement) con.createStatement();
          		st1.executeUpdate(sqlq);
            	
             }
             else if(status.equals("accepted")){
            	 String sql = "delete from follow where  sender= '"+sender+"'  and accepter = '"+accepter+"'";
            	 Statement st = (Statement)con.createStatement();
            	 st.executeUpdate(sql);
            	 sql = "delete from "+accepter+"follower where  FUsername= '"+sender+"'";
            	 st = (Statement)con.createStatement();
            	 st.executeUpdate(sql);
             }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
}

