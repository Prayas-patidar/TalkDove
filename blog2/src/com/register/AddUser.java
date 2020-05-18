package com.register;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.currentuser.CurrentUserInfo;
//mport com.CurrentUser.CurrentUserInfo;
import com.db.DBConnection;
import com.db.DBCreateInboxTable;
import com.db.DBCreateNotify;
import com.db.DBCreatePostTable;
import com.db.DBCreateStoryTable;
import com.db.DBCreateTableFollower;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;
import com.otp.Checkotp;
import com.otp.Emailer;
import com.session.Logout;

public class AddUser extends ActionSupport implements ServletContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String otp, username = "", email = "", confirmpassword = "", password = "", gender = "",
			address = "", firstname = "", lastname = "", ccode = "";

	public static String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		AddUser.otp = otp;
	}

	private static File profilepic = null;
	public static int errorPasswordIsDifferent = 0, errorOTPDoesNotMatch = 0, errorAlreadyHaveAnAccount = 0;
	private ServletContext context;

	@Override
	public void setServletContext(ServletContext context) {
		this.setContext(context);
	}

	public File getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(File profilepic) {
		AddUser.profilepic = profilepic;
	}

	public static String strDate = "";
	static Date dob = null;
	static long phone = 0;

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		AddUser.ccode = ccode;
	}

	public void setConfirmpassword(String confirmpassword) {
		AddUser.confirmpassword = confirmpassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		AddUser.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		AddUser.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		AddUser.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		AddUser.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		AddUser.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		AddUser.address = address;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		AddUser.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		AddUser.lastname = lastname;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		AddUser.phone = phone;
	}

	public InputStream inputStream;
	public static java.sql.Date date;
	public static int sendotp = 0;
	// getter -setter ends

	// execute method implementation
	public String execute() {
		try {
			int i = getEmail().indexOf('@');
			String checkuser = getEmail().substring(0, i);
			checkuser.replace("_", "__");
			checkuser.replace(".", "_");
			date = new java.sql.Date(dob.getTime());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			strDate = formatter.format(date);
			strDate = strDate.replace('/', '-');
			System.out.println("date  show ====    " + strDate);
			// Get the absolute path of file f

			Connection con = DBConnection.getConnection(); // creating
															// connection with
															// data base
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE email= '" + checkuser + "'");
			if (!rs.next()) {

				if (getPassword().equals(getConfirmpassword())) {
					if (sendotp == 0) {

						new Emailer().execute(email);

						sendotp = 1;
						return "1";

					}
					if (otp.equals(Checkotp.otporg)) {
						System.out.println("otp sahi h +");
						i = getEmail().indexOf('@');
						setEmail(getEmail().substring(0, i));
						setEmail(getEmail().replace("_", "__"));
						setEmail(getEmail().replace(".", "_"));

						inputStream = new FileInputStream(getProfilepic());

						// creating
						// connection with
						PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(
								"insert into register(username,email,password,firstname,lastname,gender,dateofbirth,phone,address,profilepic) values(?,?,?,?,?,?,?,?,?,?)"); // Creating
																																												// PreparedStatement
																																												// object
						ps1.setString(1, getUsername());
						ps1.setString(2, getEmail());
						ps1.setString(3, getPassword());
						ps1.setString(4, getFirstname());
						ps1.setString(5, getLastname());
						ps1.setString(6, getGender());
						ps1.setDate(7, date);
						ps1.setLong(8, getPhone());
						ps1.setString(9, getAddress());
						ps1.setBinaryStream(10, inputStream);
						ps1.executeUpdate();
						PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into login values(?,?,?)"); // Creating PreparedStatement object
						ps.setString(1, getUsername());
						ps.setString(2, getEmail());
						ps.setString(3, getPassword());
						ps.executeUpdate(); // sending data of ps ( obj ) into database table named login
						CurrentUserInfo.setEmail(getEmail());
						CurrentUserInfo.setUsername(getUsername());
						CurrentUserInfo.setPassword(getPassword());
						System.out.println(CurrentUserInfo.getEmail());
						DBCreateTableFollower.CreateFollowerTable(CurrentUserInfo.getEmail());
						DBCreatePostTable.CreateTablePost(CurrentUserInfo.getEmail()); // Creating
																						// post
																						// table
																						// of
																						// Users
						DBCreateNotify.CreateNotifyTable(CurrentUserInfo.getEmail());
						DBCreateStoryTable.CreateTableStory(CurrentUserInfo.getEmail());
						DBCreateInboxTable.CreateTableInbox(CurrentUserInfo.getEmail());
						DBCreateInboxTable.addToAllChats(CurrentUserInfo.getEmail(), CurrentUserInfo.getUsername());
						CurrentUserInfo.setEmail(getEmail());
						CurrentUserInfo.setPassword(getPassword());
						CurrentUserInfo.setUsername(getUsername());
						// post
						return "3"; // sends to the welcome page

					} else {
						AddUser.errorOTPDoesNotMatch = 1;
						System.out.println("else chal raha");
						sendotp = 0;
						username = "";
						email = "";
						confirmpassword = "";
						password = "";
						gender = "";
						address = "";
						firstname = "";
						lastname = "";
						ccode = "";
						dob = null;
						setPhone(0);
						strDate = "";
						Logout.alert = 1;
						return "1";
					}

				} else {
					errorPasswordIsDifferent = 1;
					System.out.println("password galat h");
					return "1";
				}
			} else {
				errorAlreadyHaveAnAccount = 1;
				System.out.println("user already exist");
				return "2";
			}

		} catch (Exception e) {
			System.out.println("error aa rahi h");
			System.out.println(e);

		}

		return "1";// sends to error pages

	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}
}
