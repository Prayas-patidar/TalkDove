
<%@page import="com.error.Handler"%>
<%@page import="com.sun.mail.handlers.handler_base"%>
<%@page import="com.login.CheckUser"%>
<%@page import="com.otp.forgetPassword"%>
<%@page import="com.register.AddUser"%>
<html lang="en">
<head>
	<title>Login V1</title>
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
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
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
	AddUser.strDate="";
	new forgetPassword().setEmail("");
	new forgetPassword().setOtp("");
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
    <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Password Doesn't match.</strong> 
   </div>
   <% } %>
      
    <%  if(Handler.errorNotInUse==1){ Handler.errorNotInUse=0; %>
   <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Session Expired!!!</strong> 
  <br>Please Login Again
   </div>
   <% } %>
   <%  if(CheckUser.erroruserdoesnotexist==1){ CheckUser.erroruserdoesnotexist=0; %>
    <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Invalid email Id</strong> 
   </div>
   <% } %>
   <%  if(forgetPassword.errorOTPDoesNotMatch==1){ forgetPassword.errorOTPDoesNotMatch=0; %>
    <div class="alert warning">
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