package com.account;

import java.sql.Connection;
import java.sql.ResultSet;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.mysql.jdbc.Statement;

public class Type {
private static int type;

public static int getType() {
	return type;
}

public static void setType(int type) {
	Type.type = type;
}
public String execute(){
	try{
		if(type==0){
			type=1;
		}else{
			type=0;
		}
		String sql="update  register set accounttype = "+type+" where email ='"+CurrentUserInfo.getEmail()+"'";
		Connection con = DBConnection.getConnection();
		Statement st1= (Statement)con.createStatement();
		st1.executeUpdate(sql);
	}catch(Exception e){
		
	}
	return "success";
}
}
