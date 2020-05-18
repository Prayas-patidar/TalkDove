<%@page import="javax.mail.SendFailedException"%>
<%@page import="com.register.AddUser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Talkdove -Register</title>
	
	<!-- Dropify -->
    <link rel="stylesheet" href="vendor/dropify/dist/css/dropify.min.css">

    <!-- Icons font CSS-->
    <link href="rvendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="rvendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="rvendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="rvendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="rcss/main.css" rel="stylesheet" media="all">

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
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Sign-Up</h2>
                </div>
                <% if(AddUser.errorAlreadyHaveAnAccount==1){ AddUser.errorAlreadyHaveAnAccount=0;%>
                  <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Warning!</strong> Account Already Exist.
   </div>
                <% } %>
 <%  if(AddUser.errorPasswordIsDifferent==1){ AddUser.errorPasswordIsDifferent=0; %>
    <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Warning!</strong> Password Doesn't match.
   </div>
   <% } %>
   <%  if(AddUser.errorOTPDoesNotMatch==1){ AddUser.errorOTPDoesNotMatch=0; %>
    <div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Warning!</strong> You entered incorrect OTP.
   </div>
   <% } %>
                <div class="card-body">
                    <form action="register" method="post" enctype="multipart/form-data">
                       <div class="form-row m-b-55">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="firstname" <% if(!new AddUser().getFirstname().equals("")){ %> value="<%= new AddUser().getFirstname() %>" readonly <% }else{ %> required <% } %>>
                                            <label class="label--desc">first name</label>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="lastname"   <% if(!new AddUser().getLastname().equals("")){ %> value="<%= new AddUser().getLastname() %>" readonly <% }else{ %> required <% } %>>
                                            <label class="label--desc">last name</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <div class="form-row">
                            <div class="name">User Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="username"  <% if(!new AddUser().getUsername().equals("")){ %> value="<%= new AddUser().getUsername() %>" readonly <% }else{ %> required <% } %>>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="email" <% if(!new AddUser().getEmail().equals("")){ %> value="<%= new AddUser().getEmail()+"@gmail.com" %>" readonly <% }else{ %> required <% } %>>
                                </div>
                            </div>
                        </div>
                    
                      
                        <div class="form-row p-t-20">
                            <label class="name">Gender</label>
                            <div class="p-t-15">
                       
                              <% if(new AddUser().getGender().equals("")) {%>
                              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                               <label class="radio-container">Male
                                    <input type="radio" checked="checked" value="male" name="gender" required>
                                    <span class="checkmark"></span>
                                </label>
                                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <label class="radio-container">Female
                                    <input type="radio" name="gender" value="female" required>
                                    <span class="checkmark"></span>
                                </label>
                                <% }else if(new AddUser().getGender().equals("male")){ %>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
                                <label class="radio-container">Male
                                    <input type="radio" checked="checked" value="male" name="gender" required>
                                    <span class="checkmark"></span>
                                </label>
                                <% }else{ %>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
                                <label class="radio-container">Female
                                    <input type="radio" checked="checked" name="gender" value="female" required>
                                    <span class="checkmark"></span>
                                </label>
                                <% } %>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Date of Birth</div>
                            <div class="value">
                                <div class="input-group">
                             <input class="input--style-5" name="dob" type="date"  <% if(AddUser.strDate.equals("")){ %> required<% }else{ %> value="<%=  AddUser.strDate %>"  readonly<% } %> > </div>
                            </div>
                        </div>
                         <div class="form-row">
                            <div class="name">Address</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="address" <% if(!new AddUser().getAddress().equals("")){ %> value="<%= new AddUser().getAddress() %>" readonly <% }else{ %> required <% } %>>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Phone</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" value="+91" name="ccode">
                                            
                                            <label class="label--desc">Country Code</label>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="tel" name="phone" <% if(!(new AddUser().getPhone()==0)){ %> value="<%= new AddUser().getPhone() %>" readonly <% }else{ %> required <% } %>>
                                            <label class="label--desc">Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <% if(AddUser.sendotp==0){ %>
                         <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" name="password" required>
                                </div>
                            </div>
                        </div>
                         <div class="form-row">
                            <div class="name">Confirm Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" name="confirmpassword" required>
                                </div>
                            </div>
                        </div>
                       
                           
                                 <% }else { %>
                                
                                    <input class="input--style-5" type="hidden" name="password"  value="<%= new AddUser().getPassword() %>">
                                    <input class="input--style-5" type="hidden" name="confirmpassword" value="<%= new AddUser().getConfirmpassword() %>">
                              
                             <div class="row" style="padding:30px; margin-left:140px;">
                                    
                                        <div class="col-sm-6" style="margin-top: -45px;">
                                        <input type="file" style="width:400px;" class="dropify" data-show-loader="false" name="profilepic" required/>
                                    </div>
                                    
                                </div>
                                 <% } %>
                               <% if(AddUser.sendotp==1) {%> 
                              <div class="form-row">
                            <div class="name">Enter OTP</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" name="otp" required>
                                </div>
                            </div>
                        </div>
                        <div>
                            <input class="btn btn--radius-2 btn--red" type="submit" value="Sign up">
                        </div>
                        
                        <% } %>
                        
                        <div>
                        <% if(AddUser.sendotp==0){%>
                            <input class="btn btn--radius-2 btn--red" type="submit" value="Send OTP">
                            <% } %>
                        </div>
                        <div class="text-center p-t-136">
						<a class="name" href="change-signup-login" style="text-decoration:none;">
						<br>
							Already have an Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="rvendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="rvendor/select2/select2.min.js"></script>
    <script src="rvendor/datepicker/moment.min.js"></script>
    <script src="rvendor/datepicker/daterangepicker.js"></script>
       <script src="vendor/dropify/dist/js/dropify.min.js"></script>
    <!-- Dropify init -->
    <script src="js/plugins-init/dropify-init.js"></script>
    
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
    <!-- Main JS-->
    <script src="rjs/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>