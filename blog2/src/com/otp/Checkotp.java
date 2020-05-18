package com.otp;


import javax.servlet.ServletContext;
import org.apache.struts2.util.ServletContextAware;
import com.opensymphony.xwork2.ActionSupport;
import com.session.Logout;

public class Checkotp extends ActionSupport implements ServletContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletContext context = null;
	private String otp= null;
	public static String otporg=null;
	public String getOtp() {
		return otp;
	}


	public void setOtp(String otp) {
		this.otp = otp;
	}


	public String execute(){
		System.out.println("otporg is : "+otporg);
		System.out.println("user otp : "+otp);
		if(otp.equals(Checkotp.otporg)){
			return "success";
		}
		else{
			Logout.alert=1;
			return "fail";
		}
	}
	
	
	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		this.setContext(context);
		
	}


	public ServletContext getContext() {
		return context;
	}


	public void setContext(ServletContext context) {
		this.context = context;
	}

}
