package com.login;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;

public class CheckUser extends ActionSupport {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public String email =null;
public String password = null;
	
public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public static int erroruserdoesnotexist=0;
	public static int errorPasswordIsDifferent=0;
public String execute(){
	
	try{
		Connection con = (Connection) DBConnection.getConnection();
		if(con.equals(null))
			System.out.print("\nnull h\n");
		setEmail(getEmail().substring(0, getEmail().indexOf('@')));
		setEmail(getEmail().replace("_", "__"));
		setEmail(getEmail().replace(".", "_"));
		Statement st = (Statement) con.createStatement();
		ResultSet rs =st.executeQuery("select * from login where email='"+getEmail()+"'");
		if(rs.next()){
	if(rs.getString("password").equals(password)){
		CurrentUserInfo.setEmail(rs.getString("email"));
		CurrentUserInfo.setUsername(rs.getString("username"));
		CurrentUserInfo.setPassword(rs.getString("password"));	
		System.out.println(CurrentUserInfo.getEmail());
		
		
		
		return "1";
			}
			else
			{
				errorPasswordIsDifferent=1;
				System.out.println(rs.getString("password")+password);
				return "2";
		}
		}else{
			erroruserdoesnotexist=1;
		}
		
		
		
	}catch(SQLException sqle){
		System.out.println(sqle);
	}
	return "2";

	}

}
