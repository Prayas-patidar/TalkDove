package com.otp;

import java.sql.ResultSet;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.login.CheckUser;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePassword extends ActionSupport implements ServletContextAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletContext context = null;
	private String pass=null;
	private String conpass=null;
	public String getPass() {
		return pass;
	}

	public void setPass(String password) {
		this.pass = password;
	}

	public String getConpass() {
		return conpass;
	}

	public void setConpass(String conpass) {
		this.conpass = conpass;
	}
 
	public String execute()throws Exception{
		if(pass.equals(conpass)){
			System.out.println(forgetPassword.getEmail());
			String mail =forgetPassword.getEmail().substring(0,forgetPassword.getEmail().indexOf("@"));
			forgetPassword.email="";
			forgetPassword.otp="";
			String sqlr = "update register set password ='"+pass+"' where email ='"+mail+"'";  
			Connection con = (Connection) DBConnection.getConnection();
			Statement st = (Statement) con.createStatement();
			st.executeUpdate(sqlr);
			String sqll = "update login set password ='"+pass+"' where email ='"+mail+"'";  
			
			st.executeUpdate(sqll);
			String user= "select * from login where email ='"+mail+"'";
			Statement st2 = (Statement) con.createStatement();
			ResultSet rs= 	st2.executeQuery(user);
			if(rs.next()){
				CurrentUserInfo.setEmail(rs.getString("email"));
				CurrentUserInfo.setPassword(rs.getString("password"));
				CurrentUserInfo.setUsername(rs.getString("username"));
			}
		return "success";
		}
		else{
			CheckUser.errorPasswordIsDifferent=1;
	return "fail";
		}
	}
	
	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		this.setContext(context);
		
	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}
}
