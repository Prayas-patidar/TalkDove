package com.chats;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.db.DBConnection;

public class SaveChat {
	private Connection con=null;
	private PreparedStatement ps = null;
	private String dateTime=null;
	private InputStream in=null;
	
	public void saveChat(String fromId, String toId, String message, String filePath, String tName, String user){
		try{
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			Calendar cal = Calendar.getInstance();
			dateTime = dateFormat.format(cal.getTime());
			System.out.println(dateTime);
			con = DBConnection.getConnection();
			
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery("Select status from allchats where email ='"+toId+"'");
//			rs.next();
//			String sts = rs.getString(1);
//			if(sts.equals(fromId)){

				ps = con.prepareStatement("insert into "+tName+" (sender, reciever, message, attached, datetime)values(?,?,?,?,?)");
//				ps.setString(1,"kashish__sahu10muskansahu947");
				ps.setString(1, fromId);
				ps.setString(2, toId);
				ps.setString(3,message);
				if(filePath!=null)
					in = new FileInputStream(new File(filePath));
				else 
					in=null;
				ps.setBlob(4,in);
				ps.setString(5,dateTime);
				ps.executeUpdate();
				System.out.println("Chat Saved!");
				
				
//			}else{
//				ps = con.prepareStatement("insert into ? (userid, msg, type) values(?,?,?)");
//				ps.setString(1,toId+"notify");
//				ps.setString(2,user);
//				ps.setString(3,message);
//				ps.setString(4,"m");
//				ps.executeUpdate();
//				
//			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	}
}