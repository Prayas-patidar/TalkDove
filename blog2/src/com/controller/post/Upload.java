package com.controller.post;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import org.apache.struts2.util.ServletContextAware;
import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.db.DBCreateCommentTable;
import com.db.DBCreateLikeTable;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;

public class Upload extends ActionSupport implements ServletContextAware{
public static int errorPostNotUploaded=0;
private static final long serialVersionUID = 1L;
private File ifile=null;
private ServletContext context=null;
private String Description=null;
// getter - setter starts
public File getIfile() {
	return ifile;
}
public void setIfile(File ifile) {
	this.ifile = ifile;
}
public String getDescription() {
	return Description;
}
public void setDescription(String description) {
	this.Description = description;
}
// getter - setter end
@Override
public void setServletContext(ServletContext context){
	this.setContext(context);
}
public String execute(){

	try{
			
		 		
			System.out.print(	CurrentUserInfo.getUsername());
			String postidno="select * from "+ 	CurrentUserInfo.getEmail()+"post ";
			String sql="insert into "+	CurrentUserInfo.getEmail()+"post (postid,image,description,status) values (?,?,?,?)";
			int postno=1;
			Connection con=DBConnection.getConnection();
			Statement st = (Statement) con.createStatement();
			ResultSet rs =st.executeQuery(postidno);
			while(rs.next()){
				postno++;
			}
			
			System.out.println("\n"+postno);
			String Postid=(	CurrentUserInfo.getEmail()+"post"+postno);
			String check = "select * from "+ 	CurrentUserInfo.getEmail()+"post where postid ='"+ CurrentUserInfo.getEmail()+"post"+(postno-1) +"' ";
			ResultSet rs1=st.executeQuery(check);
			if(rs1.next()){
			if(rs1.getString("description").equals(Description)){
				ifile=null;
			}
			}
			PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps1 = con.prepareStatement("insert into allpost (postid,image,description,status) values (?,?,?,?)");
			
			if(ifile==null){	
				System.out.print("null image h yrrr");		
			}else{	
					System.out.println("\n\n\n"+getIfile()+"\n\n\n");
					
					InputStream inputStream = new FileInputStream(getIfile());
					InputStream inputStream1 = new FileInputStream(getIfile());
					ps.setString(1, Postid);
					ps.setBinaryStream(2, inputStream);
					ps.setString(3, getDescription());
					ps.setInt(4, 1);
					ps.executeUpdate();
					ps1.setString(1, Postid);
					ps1.setBinaryStream(2, inputStream1);
					ps1.setString(3, getDescription());
					ps1.setInt(4, 1);
					ps1.executeUpdate();
					System.out.println("post "+Postid);
					DBCreateCommentTable.CreatePostCommentTable(Postid);
					DBCreateLikeTable.CreatePostLikeTable(Postid);
					System.out.println("tBLE POST COMMENT CREATED");
					setIfile(null);
					return "1";
			}
			
		}catch (Exception e) {
			System.out.println(e);
			
			}
	errorPostNotUploaded=1;
	return "2";
	}
public ServletContext getContext() {
	return context;
}
public void setContext(ServletContext context) {
	this.context = context;
}
}
