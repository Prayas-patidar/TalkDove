package com.Likepost;


	
	import java.sql.Connection;
	import java.sql.SQLException;
	import java.sql.Statement;

	import com.currentuser.CurrentUserInfo;
	import com.db.DBConnection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;

	import com.opensymphony.xwork2.ActionSupport;

	public class AddLike extends ActionSupport {
	/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
	String postid;

	
	public String getPostid() {
		return postid;
	}

	public void setPostid(String postid) {
		this.postid = postid;
	}

		public String execute(){
			
		Connection con = DBConnection.getConnection();
		try {
			int like= 0;
			String checkLike = "select * from "+postid+"like where CUsername = '"+ CurrentUserInfo.getEmail()  +"'";
			Statement st= con .createStatement();
			ResultSet rs = st.executeQuery(checkLike);
			if(rs.next() ){
				if(rs.getInt("status")==1){
					like=0;
					System.out.println("hello");
					 String user = postid.substring(0, postid.indexOf("post"));
						String  sqlq= "delete from "+user+"notify where postid = '"+postid+"' and type = 'like' and userid = '"+CurrentUserInfo.getEmail()+"'";
						
						Statement ps1 = con.createStatement();
						
						ps1.executeUpdate(sqlq);

				}
				else{
					like=1;
					 String user = postid.substring(0, postid.indexOf("post"));
						if(!user.equals(CurrentUserInfo.getEmail())){
					 	String  sqlq= "insert into "+user+"notify (postid,userid,msg,type) values(?,?,?,?)";
						PreparedStatement ps1 = con.prepareStatement(sqlq);
						ps1.setString(1,postid);
						ps1.setString(2, CurrentUserInfo.getEmail()); 
						ps1.setString(3, null);
						ps1.setString(4, "like");
						ps1.executeUpdate();
						}

				}
				String sql="update "+postid+"like set status= "+like+" where CUsername = '"+ CurrentUserInfo.getEmail()  +"'";
				Statement st1 =con.createStatement();
				st1.executeUpdate(sql);
				
			}
			else			
			{ 
				like=1;
			
			String sql= "insert into "+postid+"like (CUsername,status) values(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,CurrentUserInfo.getEmail());
			ps.setInt(2, like); 
			ps.executeUpdate();
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
	

}
