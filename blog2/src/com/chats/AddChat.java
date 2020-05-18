package com.chats;

import static com.chats.ChatTableProperties.field;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.util.ServletContextAware;

import com.currentuser.CurrentUserInfo;
import com.db.DBConnection;
import com.opensymphony.xwork2.ActionSupport;

public class AddChat extends ActionSupport implements ServletContextAware{
	
	private static final long serialVersionUID = 1L;
	private ServletContext context = null;
	public String email =null;
	public String user =null;
	public String message = null;
	public File fileAttached= null;
	private String filePath=null;
	
	
	
	public File getFileAttached() {
		return fileAttached;
	}

	public void setFileAttached(File fileAttached) {
		this.fileAttached = fileAttached;
	}
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	 public String execute(){
		 System.out.println(getEmail()+"\n"+getUser());
		 //System.out.println("dono aaye?");

		 add(CurrentUserInfo.getEmail(),getEmail(),getUser());
		 add(getEmail(),CurrentUserInfo.getEmail(),CurrentUserInfo.getUsername());
		 //added users to inbox
		 
		 createChatTable(CurrentUserInfo.getEmail(),getEmail());
		 
			System.out.println(message);
			if(fileAttached==null){
				System.out.println("null image");
					filePath=null;
			}else
				System.out.println("Path : "+fileAttached.getPath());
			
			SaveChat sc = new SaveChat();
			sc.saveChat(CurrentUserInfo.getEmail(), getEmail(), getMessage(), generateFilePath(), tName, getUser());
			
			 
		 return "success";
	 }
	 
		public String generateFilePath(){
			File fileToCreate=null;
			Connection con;
			Statement st;
			if(filePath!=null){
				try{
					String ITname = CurrentUserInfo.getEmail()+"to"+getEmail();
				con= DBConnection.getConnection();
				st=con.createStatement();
				ResultSet rs = st.executeQuery("select count(attached) from "+tName+" where attached IS NOT NULL");
				if(rs.next()){
					int cnt = rs.getInt(1);
					System.out.println("count :"+cnt);
				fileToCreate = new File(filePath,ITname.concat(""+cnt).concat(".jpg"));
				FileUtils.copyFile(fileAttached,fileToCreate);
				filePath=filePath+"\\"+ITname.concat(""+cnt).concat(".jpg");
				}
				
				}catch(Exception e){
					System.out.println(e);
				}
			}
		
			return filePath;
		}
	  static String tName; 
	 static String createTableQuery;
	 
	 public String createChatTable(String fromId,String toId){
		Connection con;
		Statement st;
		 try{
				System.out.println("in method chattable");
				generateName(fromId,toId);//setting name in variable
				System.out.println(tName);
				
				con = DBConnection.getConnection();
				st = con.createStatement();
				
				try{
					st.executeUpdate(createTableQuery());//create table query in method createTableQuery()
				}catch(Exception esql){
					System.out.println(esql);
				}
			}catch(Exception e){
				System.out.println(e);
			}
			
			return "success";
		}
		
		
		public static String gettName(){
			return tName;
		}
		
		private String createTableQuery(){
			createTableQuery = "CREATE TABLE IF NOT EXISTS "+tName+" "+field;
			return createTableQuery;
		}
		
		//Method to generate name of the table..
		private void generateName(String fromId, String toId){
			ArrayList<String> nameList = new ArrayList<>();
			nameList.add(fromId);
			nameList.add(toId);
			Collections.sort(nameList);
			tName = nameList.get(0)+nameList.get(1);
			System.out.println(tName);
		}

	 
	 
	void add(String sender, String reciever, String recUser){
		if(email!=null){
		try{
			
		Connection con = DBConnection.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select email from "+sender+"inbox where email='"+reciever+"'");
		if(!rs.next()){
		String sql="insert into "+sender+"inbox (email,username, status) values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,reciever);
		ps.setString(2,recUser);
		ps.setString(3,"active");
		
		ps.executeUpdate();
		}
		
		System.out.println("chat added!!");
		
		}catch(Exception e){
			System.out.println(e);
		}
		}
	}
	
	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		this.context = context;
		filePath ="C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog\\WebContent\\chatimages";
		Path path = Paths.get(filePath);
		if (!Files.exists(path)) {
            try {
                Files.createDirectories(path);
            } catch (IOException e) {
                //fail to create directory
                e.printStackTrace();
            }
        }
	}
	
}
