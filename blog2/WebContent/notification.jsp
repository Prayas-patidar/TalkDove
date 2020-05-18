
<%@page import="com.error.Handler"%>
<%@page import="java.sql.Date"%>
<%@page import="com.currentpost.currentpostid"%>
<%@page import="java.awt.Image"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Time"%>
<%@page import="com.currentuser.CurrentUserInfo"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnection"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from demo.quixkit.com/corbin/form-drofify.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:53 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Talkdove - Notification</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Dropify -->
<link rel="stylesheet" href="vendor/dropify/dist/css/dropify.min.css">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="spinner">
			<div class="spinner-a"></div>
			<div class="spinner-b"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->
      <% if(CurrentUserInfo.getEmail()!=null){ %>

	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="index.jsp" class="brand-logo"> <span class="logo-abbr">Q</span>
				<img src="images/talkdove.png"
				style="width: 110px; margin-left: -10px; margin-right: -20px;"></img>
				<span class="brand-title">TalkDove</span>
			</a>

			<div class="nav-control">
				<div class="hamburger">
					<span class="toggle-icon"><i class="icon-menu"></i></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						 <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon d-md-none p-3 c-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-search"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form class="form-inline" action="otherprofile">
                                        <input class="form-control" name="profilename" type="search" placeholder="Search by Email Id" aria-label="Search">
                                    </form>
                               </div>
                            </div>
                        </div>
                  
                       
                   
                 
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="mdi mdi-bell"></i>
                                    
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <h5 class="notification_title">Notifications</h5>
                                    <ul class="list-unstyled">
                                    
                                        <li class="media dropdown-item">
                                         <i class="mdi mdi-account-plus" class="mr-3" ></i>
                                            <div class="media-body">
                                                <a href="#">
                                
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Follow Request </h5><span class="badge badge-primary"><%= 0 %></span>
                                                    </div>
                                                   
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                            <i  class="mdi mdi-heart" class="mr-3"></i>
                                            <div class="media-body">
                                                <a href="#">
                                
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Likes  </h5><span class="badge badge-primary"><%=0 %></span>
                                                    </div>
                                                    
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                             <i  class="mdi  mdi-comment" class="mr-3"></i>
                                            <div class="media-body">
                                                <a href="#">
                                 
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Comments</h5><span class="badge badge-primary"><%=0 %></span>
                                                    </div>
                                                    
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
									<a class="all-notification" href="#">All Notifications</a>
								</div></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <!--  <i class="mdi mdi-home"></i> -->

									<%
										try {

											Connection con = DBConnection.getConnection();
											Statement st = con.createStatement();

											ResultSet rs2 = st.executeQuery(
													"Select (profilepic) from register where email='" + CurrentUserInfo.getEmail() + "'");
											if (rs2.next()) {
												String path = "C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog\\WebContent\\profile\\";
												//                                                path=path+"downloaded";

												path = path + CurrentUserInfo.getEmail() + ".jpg";
												Blob blob = rs2.getBlob("profilepic");
												InputStream ins = blob.getBinaryStream(1, blob.length());
												Files.copy(ins, Paths.get(path), StandardCopyOption.REPLACE_EXISTING);
												//String desc = rs.getString("idesc");
												ins.close();
												rs2.close();
											} 
										} catch (Exception e) {
									%>catch mein hun <%=e%> <%
 	}
 %> <img src="<%="profile/" + CurrentUserInfo.getEmail() + ".jpg"%>"
									style="height: 30px; width: 30px; border-radius: 100px;">
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="myprofile.jsp" class="dropdown-item"> <span>My
											profile</span>
									</a> <a href="#!" class="dropdown-item"> <span>Calender</span>
									</a> <a href="#!" class="dropdown-item"> <span>Inbox</span>
									</a> <a href="#!" class="dropdown-item"> <span>Settings</span>
									</a> <a href="logout" class="dropdown-item"> <span>Logout</span>
									</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="quixnav">
			<div class="quixnav-scroll">
				<ul class="metismenu" id="menu">
					<li class="nav-label">Navigation</li>
					<li><a href="myprofile.jsp"> <img
							src="<%="profile/" + CurrentUserInfo.getEmail() + ".jpg"%>"
							style="margin-bottom: 10px; height: 45px; width: 45px; border-radius: 100px;" />
							<span class="nav-text">Profile</span></a></li>

					<li><a class="has-arrow" href="ui-card.jsp"><i
							class="mdi mdi-home"></i><span class="nav-text">Home</span></a></li>
					<li><a class="has-arrow" href="form-drofify.jsp"><i
							class="mdi mdi-upload"></i><span class="nav-text">Upload</span></a></li>
					<li><a class="has-arrow" href="notification.jsp"><i class="mdi mdi-bell"></i><span class="nav-text">Notification</span></a>
                     </li>

					<li><a class="has-arrow" href="chatlist"
						aria-expanded="false"><i class="mdi mdi-message-text"></i><span
							class="nav-text">Chats</span></a></li>

					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i
							class="mdi mdi-account-settings-variant"></i><span
							class="nav-text">User Account</span></a></li>

					<li><a class="has-arrow" href="logout" aria-expanded="false"><i
							class="mdi mdi-power"></i><span class="nav-text">Logout</span></a></li>



				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
    
        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container">

				<!-- row -->
				<div class="row">

					<div class="col-xl-12 col-xxl-12"
						style="margin-top: 100px; margin-left: 50px; padding-right: -100px; margin-right: -50px;">
						<div class="card" style="margin-right: 170px;">

							<div class="card-body">



								<%
								try{	
								Connection con = DBConnection.getConnection();
									Statement st1 = con.createStatement();
									ResultSet rs= null;
									Statement st= con.createStatement();
									ResultSet rs1 = st1.executeQuery("select * from " + CurrentUserInfo.getEmail() + "notify order by time DESC ");
									if(rs1.next()){
									do{
										String postid = rs1.getString("postid");
										String userid = rs1.getString("userid");
										String type = rs1.getString("type");
										String time= rs1.getString("time");
										String msg = rs1.getString("msg");
										String username= null;
										String postuserinfo ="select username from register where email='"+userid+"'"; 
										
																				rs = st.executeQuery(postuserinfo);
																				
 										if(rs.next())
										{
											   username = rs.getString("username");
 										}
											
								%>



								<div class="row"
									style="padding-left: 10px; padding-down: 25px; margin-top: -25px;">

									<div class="media pt-3" style="width: 10%; float: left;">
	
											
											
											
										<form action="otherprofile">
										
											<input type="hidden" name="profilename" value="<%=userid.substring(0, userid.length()-1)%>">
											<button type="submit"
												style="border: none; background: none; padding-top: 0px; padding-down: 0px;">
												<img class="mr-4 rounded-circle" alt="<%= userid %>"
												<%
												if(type.equals("accepted"))
												userid = userid.substring(0, userid.length()-1);
												String pic = userid+".jpg"; %>
													src="profile/<%=pic%>" style="margin-top: 8px;"
													width=75px; height=70px;>
													
											</button>
										</form>
									</div>
									
									<div class="media-body"
										style="margin-right: 100px; width: 70%; float: right;">
										<div
											style="padding-top: 35px; padding-left: 20px; width: 30%; float: left;">
											<span class="text-dark"><%= username %></span><br> <span class=""
												style="font-size: 10px; margin-right: 15px; height: 10px; font-weight: 40; color: #A5A7AB;">
												<%= time %></span>
										</div>
										
										<div
											style="padding-top: 35px; padding-left: 20px; width: 70%; float: right;">
												<% if(type.equals("comment")){ %>
											<h6 class="text-primary"
												style="font-size: 14px; padding-top: 0px; margin-left:; margin-right: 40px; font-weight:; color: #A5A7AB;">
											
											has commented on your photo  " <%=msg %> ".
												</h6> 
												<% }else if(type.equals("like")){
													%>
																							<h6 class="text-primary"
												style="font-size: 14px; padding-top: 0px; margin-left:; margin-right: 40px; font-weight:; color: #A5A7AB;">
											
											like your photo .
												</h6> 
												<% }
												else if(type.equals("message")){%>
																							<h6 class="text-primary"
												style="font-size: 14px; padding-top: 0px; margin-left:; margin-right: 40px; font-weight:; color: #A5A7AB;">
											
											sent you a new message.
												</h6> 
												<% }else if(type.equals("request")){ %>
																							<span class="text-primary"
												style="font-size: 14px; padding-top: 0px; margin-left:; margin-right: 40px; font-weight:; color: #A5A7AB;">
											
										has requested you to follow.
												</span> 
												<% }else if(type.equals("accepted")){ %>
												
																							<span class="text-primary"
												style="font-size: 14px; padding-top: 0px; margin-left:; margin-right: 40px; font-weight:; color: #A5A7AB;">
											
										<%= msg %>.</span> 
												<%} %>
												<br>

										</div>
									</div>
									<div
										style="padding-top: 27px; padding-right: 25px; width: 20%; float: right;">
										
										<% if(type.equals("request")){ %>
										<div  style="float:left; width:50%;">
										<form action="request">
										<input type="hidden" value="<%=userid%> " name="userid">
										<input type="hidden" value="accepted" name="request" >
										<button class="bg-success text-light" style="border : none; height:15px; padding:15px;padding-top:10%;margin-left:12px;margin-top:13px; border-radius:120px;background : none">
										<i class="mdi mdi-account-check" 
										Style="float:left;text-shadow: 0 0 5px black;padding-right:10%;font-size:25px;padding-bottom:10%; margin-top:-14px;"></i></button>
										</form>
										</div>
										<div style="float:right; width:50%;">
										<form action="request">
										<input type="hidden" value="<%=userid%> " name="userid">
										<input type="hidden" value="rejected" name="request" >
										<button class="bg-danger text-light" style="border : none;height:15px; padding:15px;padding-top:10%;margin-top:13px;border-radius:120px; background:none;"><b>
										<i class="mdi mdi-account-remove" 
										Style="float:left;text-shadow: 0 0 5px black;padding-right:10%;font-size:25px;padding-bottom:10%; margin-top:-14px;"></i></b></button>
										 
										</form>
										</div>
										<% }else if (type.equals("msg")) { }
										else if(type.equals("accepted"))
										{
											
										}
										else{%>
										
										<img alt="image" src="post/<%= postid %>.jpg " width=120px;
											height=90px; style="border: 1px solid grey;">
										<% } %>
									</div>

								</div>
		<hr style="margin-bottom: 20px; margin-top: 10px;">

								<%
									}while(rs1.next());
									}else{
									%>
									<div class="row"
											style="padding-left: 10px; padding-down: 25px; margin-top: -5px;">
										<font style="font-family:sans-serif;font-size: 17px; font-style: oblique;margin-left: 37%;" >You don't have any notification yet.</font>
											</div>
									<%}
									String sql = "Update "+CurrentUserInfo.getEmail()+ "notify set seen=0 where seen=1 ";
									Statement st2 = con.createStatement();
									st2.executeUpdate(sql);
									
								}catch(Exception ee){
									System.out.println(ee);
								}
								%>


								








							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************col-sm-6 mb-4 
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#"
						target="_blank">Talkdove Team</a> 2019
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--removeIf(production)-->
		<!--**********************************
            Right sidebar start
        ***********************************-->
		<div class="sidebar-right">
			<a class="sidebar-right-trigger gradient-5" href="javascript:void(0)">
				<span><i class="fa fa-cog fa-spin"></i></span>
			</a>
			<div class="sidebar-right-inner">
				<!-- <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" data-toggle="tab" href="#home8">
                            <span><i class="icon-settings" aria-hidden="true"></i></span>
                        </a>
                    </li>
                </ul> -->

				<div class="tab-content tab-content-default tabcontent-border">
					<div class="tab-pane fade active show" id="home8" role="tabpanel">
						<div class="admin-settings">
							<h4>Pick your style</h4>
							<div>
								<p>Navigation Header</p>
								<div>
									<span> <input type="radio" name="navigation_header"
										value="color_1" class="filled-in chk-col-primary"
										id="nav_header_color_1"> <label
										for="nav_header_color_1"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_2" class="filled-in chk-col-primary"
										id="nav_header_color_2"> <label
										for="nav_header_color_2"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_3" class="filled-in chk-col-primary"
										id="nav_header_color_3"> <label
										for="nav_header_color_3"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_4" class="filled-in chk-col-primary"
										id="nav_header_color_4"> <label
										for="nav_header_color_4"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_5" class="filled-in chk-col-primary"
										id="nav_header_color_5"> <label
										for="nav_header_color_5"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_6" class="filled-in chk-col-primary"
										id="nav_header_color_6"> <label
										for="nav_header_color_6"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_7" class="filled-in chk-col-primary"
										id="nav_header_color_7"> <label
										for="nav_header_color_7"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_8" class="filled-in chk-col-primary"
										id="nav_header_color_8"> <label
										for="nav_header_color_8"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_9" class="filled-in chk-col-primary"
										id="nav_header_color_9"> <label
										for="nav_header_color_9"></label>
									</span> <span> <input type="radio" name="navigation_header"
										value="color_10" class="filled-in chk-col-primary"
										id="nav_header_color_10"> <label
										for="nav_header_color_10"></label>
									</span>
								</div>
							</div>
							<div>
								<p>Header</p>
								<div>
									<span> <input type="radio" name="header_bg"
										value="color_1" class="filled-in chk-col-primary"
										id="header_color_1"> <label for="header_color_1"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_2" class="filled-in chk-col-primary"
										id="header_color_2"> <label for="header_color_2"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_3" class="filled-in chk-col-primary"
										id="header_color_3"> <label for="header_color_3"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_4" class="filled-in chk-col-primary"
										id="header_color_4"> <label for="header_color_4"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_5" class="filled-in chk-col-primary"
										id="header_color_5"> <label for="header_color_5"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_6" class="filled-in chk-col-primary"
										id="header_color_6"> <label for="header_color_6"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_7" class="filled-in chk-col-primary"
										id="header_color_7"> <label for="header_color_7"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_8" class="filled-in chk-col-primary"
										id="header_color_8"> <label for="header_color_8"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_9" class="filled-in chk-col-primary"
										id="header_color_9"> <label for="header_color_9"></label>
									</span> <span> <input type="radio" name="header_bg"
										value="color_10" class="filled-in chk-col-primary"
										id="header_color_10"> <label for="header_color_10"></label>
									</span>
								</div>
							</div>
							<div>
								<p>Sidebar</p>
								<div>
									<span> <input type="radio" name="sidebar_bg"
										value="color_1" class="filled-in chk-col-primary"
										id="sidebar_color_1"> <label for="sidebar_color_1"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_2" class="filled-in chk-col-primary"
										id="sidebar_color_2"> <label for="sidebar_color_2"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_3" class="filled-in chk-col-primary"
										id="sidebar_color_3"> <label for="sidebar_color_3"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_4" class="filled-in chk-col-primary"
										id="sidebar_color_4"> <label for="sidebar_color_4"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_5" class="filled-in chk-col-primary"
										id="sidebar_color_5"> <label for="sidebar_color_5"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_6" class="filled-in chk-col-primary"
										id="sidebar_color_6"> <label for="sidebar_color_6"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_7" class="filled-in chk-col-primary"
										id="sidebar_color_7"> <label for="sidebar_color_7"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_8" class="filled-in chk-col-primary"
										id="sidebar_color_8"> <label for="sidebar_color_8"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_9" class="filled-in chk-col-primary"
										id="sidebar_color_9"> <label for="sidebar_color_9"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
										value="color_10" class="filled-in chk-col-primary"
										id="sidebar_color_10"> <label for="sidebar_color_10"></label>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Right sidebar end
        ***********************************-->
		<!--endRemoveIf(production)-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Here is navigation script -->
	<script src="vendor/quixnav/quixnav.min.js"></script>
	<script src="js/quixnav-init.js"></script>
	<script src="js/custom.min.js"></script>
	<!--removeIf(production)-->
	<!-- Demo scripts -->
	<script src="js/styleSwitcher.js"></script>
	<!--endRemoveIf(production)-->


	<!-- Dropify -->
	<script src="vendor/dropify/dist/js/dropify.min.js"></script>
	<!-- Dropify init -->
	<script src="js/plugins-init/dropify-init.js"></script>
<% }else{
	
	Handler.errorNotInUse=1;
	response.sendRedirect("index.jsp");
	}%>
</body>

<!-- Mirrored from demo.quixkit.com/corbin/form-drofify.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:55 GMT -->
</html>