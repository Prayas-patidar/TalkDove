package com.otp;

import javax.servlet.ServletContext;
import org.apache.struts2.util.ServletContextAware;
import com.opensymphony.xwork2.ActionSupport;


public class Checkotpregister extends ActionSupport implements ServletContextAware {
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


	public void execute1(){
		System.out.println("otporg is : "+Checkotp.otporg);
		System.out.println("user otp : "+otp);
		
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
