package com.Follow;

import java.sql.SQLException;
import java.sql.Statement;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.mysql.jdbc.Connection;

public class response {
String userid,request;

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getRequest() {
	return request;
}

public void setRequest(String request) {
	this.request = request;
}
public String execute(){
if(request.equals("accepted")){	
	String sql="insert into "+CurrentUserInfo.getEmail()+"follower (FUsername,status) values('"+userid+"' , 1)";
	Connection con=(Connection) DBConnection.getConnection();
	try {
		Statement st=con.createStatement();
	st.executeUpdate(sql);
	sql = "Update follow set status = 'accepted' where sender ='"+userid+"' and accepter = '"+CurrentUserInfo.getEmail()+"'";
	st.executeUpdate(sql);	
	sql = "insert into "+CurrentUserInfo.getEmail()+"notify (userid,msg,type) values('"+userid+"','started following you', 'accepted')";
	st.executeUpdate(sql);
	sql =	"delete from "+CurrentUserInfo.getEmail()+"notify where userid ='"+userid+"'  and type = 'request'";
	DBConnection.getConnection().createStatement().executeUpdate(sql);
	return "success";
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	String sql= "delete from follow where sender ='"+userid+"' and accepter = '"+CurrentUserInfo.getEmail()+"'";
 try {
	DBConnection.getConnection().createStatement().executeUpdate(sql);
sql =	"delete from "+CurrentUserInfo.getEmail()+"notify where userid ='"+userid+"'  and type = 'request'";
DBConnection.getConnection().createStatement().executeUpdate(sql);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return "success";
}
}
