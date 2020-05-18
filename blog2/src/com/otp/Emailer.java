package com.otp;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
public class Emailer extends ActionSupport implements ServletContextAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	
	//public class SendEmail {
	private ServletContext context = null;


	public String execute(String to)throws Exception{
//	public static void main(String args[]){	
	Checkotp.otporg = ""+(int)((Math.random()*(9000))+1000);
				System.out.println(Checkotp.otporg);
				
				    String host = "smtp.gmail.com"; // or IP address

		          // Get system properties
		          Properties properties = System.getProperties();

		          // Setup mail server
		          properties.put("mail.smtp.host", host);
		          properties.put("mail.smtp.port", 587);
		          properties.put("mail.smtp.auth", "true");
		          properties.put("mail.smtp.starttls.enable", "true");
		          properties.put("mail.user", OTPProperties.from);
		          properties.put("mail.password", OTPProperties.password);

		          // Get the default Session object.
		          Authenticator auth = new Authenticator()
		          {
		              public PasswordAuthentication getPasswordAuthentication()
		              {
		                  return new PasswordAuthentication(OTPProperties.from, OTPProperties.password);
		              }
		          };
		          Session session = Session.getInstance(properties, auth);

		          try
		          {
		             // Create a default MimeMessage object.
		             MimeMessage message = new MimeMessage(session);

		             // Set From: header field of the header.
		             message.setFrom(new InternetAddress(OTPProperties.from));

		             // Set To: header field of the header.
		             message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

		             // Set Subject: header field
		             message.setSubject("Talkdove");

		             // Now set the actual message
		             message.setText("OTP to Change the password for your talkdove account is --------\n"+Checkotp.otporg);

		             // Send message
		             Transport.send(message);
		             System.out.println("Sent message successfully....");
		          }
		          catch (Exception mex)
		          {
		             mex.printStackTrace();
		          }
		return "success";
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
