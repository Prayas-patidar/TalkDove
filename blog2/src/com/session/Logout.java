package com.session;

import com.currentuser.CurrentUserInfo;

public class Logout  {
public static int alert ;
	
	public String execute(){
		CurrentUserInfo.setEmail(null);
		CurrentUserInfo.setPassword(null);
		CurrentUserInfo.setUsername(null);
		return "1";
	}
}
