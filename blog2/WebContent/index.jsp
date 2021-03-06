
<%@page import="com.currentuser.CurrentUserInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.error.Handler"%>
<%@page import="com.sun.mail.handlers.handler_base"%>
<%@page import="com.login.CheckUser"%>
<%@page import="com.otp.forgetPassword"%>
<%@page import="com.register.AddUser"%>
<html lang="en">
<head>
	<title>Talkdove - Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
    <style>
.alert {
  padding: 10px;
  background-color: #ff4d4d;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
  font-size:13px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>

<body>
<% try{
		Connection con = DBConnection.getConnection();
		Statement st = con.createStatement();
		String 	sql ="create table IF NOT EXISTS Talkdove.login (username VARCHAR(40) NOT NULL,email VARCHAR(50) NOT NULL,password VARCHAR(15) NOT NULL)";
		st.executeUpdate(sql);
		sql= "create table IF NOT EXISTS Talkdove.register (username VARCHAR(40) NOT NULL,email VARCHAR(50) NOT NULL,password VARCHAR(15) NOT NULL,firstname VARCHAR(20) , lastname VARCHAR(20) , gender varchar(7) , dateofbirth date, phone bigint(15), address varchar(100) , profilepic longblob, time timestamp default current_timestamp, accounttype int(10) not null default 1)";
		st.executeUpdate(sql);
	    sql ="create table IF NOT EXISTS Talkdove.allchats (email VARCHAR(50) NOT NULL,status VARCHAR(25) NOT NULL default 'offline' , username varchar(25) not null)";
	    st.executeUpdate(sql);
	    sql ="create table IF NOT EXISTS Talkdove.allpost (postid VARCHAR(40) NOT NULL,image LONGBLOB NULL,description VARCHAR(200) NULL,time timestamp NOT NULL DEFAULT current_timestamp,status INT NOT NULL default 1)";
	    st.executeUpdate(sql);
	    sql ="create table IF NOT EXISTS Talkdove.follow (sender VARCHAR(40) NOT NULL,accepter VARCHAR(40) NOT NULL,status VARCHAR(10) NOT NULL default  'pending' ,time timestamp NOT NULL DEFAULT current_timestamp)";
		st.executeUpdate(sql);
		sql ="create table IF NOT EXISTS Talkdove.story (userstoryno int(11) NOT NULL,user VARCHAR(40) NOT NULL,img longblob not null ,time timestamp NOT NULL DEFAULT current_timestamp, status int(11) not null default 1)";
		st.executeUpdate(sql);
		System.out.println("done");
}catch(Exception ee){

	System.out.println("something went wrong  " + ee);
}
	
	
	%>

	<%
	AddUser.sendotp=0;
	new AddUser().setUsername("");
	new AddUser().setEmail("");
	new AddUser().setConfirmpassword("");
	new AddUser().setPassword("");
	new AddUser().setGender("");
	new AddUser().setAddress("");
	new AddUser().setFirstname("");
	new AddUser().setLastname("");
	new AddUser().setCcode("");
	new AddUser().setDob(null);
	new AddUser().setProfilepic(null);
	new AddUser().setPhone(0);
	AddUser.strDate="";
	new forgetPassword().setEmail("");
	new forgetPassword().setOtp("");
	CurrentUserInfo.setEmail(null);
	CurrentUserInfo.setUsername(null);
	CurrentUserInfo.setPassword(null);
	%>
	
	<div class="limiter">
	
		<div class="container-login100">
		
			<div class="wrap-login100">
			
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>
				

				<form action="login" method="post" class="login100-form validate-form">
					<span class="login100-form-title">
						<img src="images/talkdove.png" alt="IMG" style="width:200px; background-color:white;">
					
					</span>
   
 <%  if(CheckUser.errorPasswordIsDifferent==1){ CheckUser.errorPasswordIsDifferent=0; %>
    <div class="alert danger">
  <span class="closebtn">&times;</span>  
  <strong>Password Doesn't match.</strong> 
   </div>
   <% } %>
      
    <%  if(Handler.errorNotInUse==1){ Handler.errorNotInUse=0; %>
   <div class="alert danger">
  <span class="closebtn">&times;</span>  
  <strong>Session Expired!!!</strong> 
  <br>Please Login Again
   </div>
   <% } %>
   <%  if(CheckUser.erroruserdoesnotexist==1){ CheckUser.erroruserdoesnotexist=0; %>
    <div class="alert danger">
  <span class="closebtn">&times;</span>  
  <strong>Invalid email Id</strong> 
   </div>
   <% } %>
   <%  if(forgetPassword.errorOTPDoesNotMatch==1){ forgetPassword.errorOTPDoesNotMatch=0; %>
    <div class="alert danger">
  <span class="closebtn">&times;</span>  
  <strong> You entered incorrect OTP</strong>
   </div>
   <% } %>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="forgetPassword.jsp">
							 Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="change-login-signup">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
				
			</div>
		</div>
		
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>