package com.otp;

public class forgetPassword {
static String email="", otp="";

public static String getEmail() {
	return email;
}

public void setEmail(String email) {
	forgetPassword.email = email;
}

public static String getOtp() {
	return otp;
}
public static int errorOTPDoesNotMatch=0;
public void setOtp(String otp) {
	forgetPassword.otp = otp;
}
public String execute() {
	if(otp.equals("")){
		try {
			new Emailer().execute(email);
			return "send";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}else{
		if(otp.equals(Checkotp.otporg)){
			
		return "success";
		}else{
			errorOTPDoesNotMatch=1;
			return "fail";
		}
	}
	
	return "fail";
}
}
