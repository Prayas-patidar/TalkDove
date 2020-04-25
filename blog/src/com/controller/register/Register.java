package com.controller.register;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Date;
import com.db.DBConnection;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport {
	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;
	public String countrycode=null,username=null, email=null, confirmpassword=null, password=null, gender=null, address=null, firstname=null, lastname=null;

	public String getCountrycode() {
		return countrycode;
	}

	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}

	Date dateofbirth=null;
	long phone=0;

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	// getter -setter ends

	// execute method implementation
	public String execute() {
		try {
			
			setEmail(getEmail().substring(0, getEmail().indexOf('@')));
			setEmail(getEmail().replace("_", "__"));
			setEmail(getEmail().replace(".", "_"));
			System.out.print("email set");
			Connection con = DBConnection.getConnection(); // creating
															// connection with
															// data base
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FORM LOGIN WEHERE `email`= " + getEmail() + "");
			if (rs.next() == false) {
				if (getPassword() == getConfirmpassword()) {
					
					return "1"; // sends to the welcome page
				} else {
					System.out.println("password galat h");
				}
			} else {
				System.out.println("user already exist");
			}

		} catch (Exception e) {
			System.out.println("error aa rahi h");
			System.out.println(e);
			return "2";
		}

		return "2";// sends to error pages

	}
}
