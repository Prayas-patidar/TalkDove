package com.add;



import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.ResultSet;
import org.apache.struts2.util.ServletContextAware;
import com.db.DBConnection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;

public class Story extends ActionSupport implements ServletContextAware {
/**
	 * 
	 */
	private static final long serialVersionUID = 1615608840032727311L;
private File story;
private String user;
private ServletContext context=null;
public ServletContext getContext() {
	return context;
}
public void setContext(ServletContext context) {
	this.context = context;
}
public File getStory() {
	return story;
}
public void setStory(File story) {
	this.story = story;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
@Override
public void setServletContext(ServletContext arg0) {
	// TODO Auto-generated method stub
	
}
public String execute(){
	System.out.println("my image issssss ========   "+story);
	String sql ="insert into story (userstoryno,user,img) values (?,?,?)";
	try {
		Statement st= (Statement)DBConnection.getConnection().createStatement();
		int story_no = 0;
		ResultSet rs = st.executeQuery("select max(userstoryno) from story");
		
		if(rs.next()){
			story_no = rs.getInt("max(userstoryno)");
		}
		InputStream inputStream = new FileInputStream(story);
		PreparedStatement ps= (PreparedStatement) DBConnection.getConnection().prepareStatement(sql);
		ps.setInt(1, (story_no+1));
		ps.setString(2, user);
		ps.setBinaryStream(3, inputStream);
		ps.executeUpdate();
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	
	return "success";
}

}
