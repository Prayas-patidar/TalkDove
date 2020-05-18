<!DOCTYPE html>
<%@page import="java.io.File"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.ArrayList"%>
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
<html lang="en">


<!-- Mirrored from demo.quixkit.com/corbin/ui-card.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:33 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <title>Talkdove - Chat</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Dropify -->
    <link rel="stylesheet" href="vendor/dropify/dist/css/dropify.min.css">
       <script type="text/javascript">
       history.pushState(null, null, location.href);
       window.onpopstate = function () {
           history.go(1);
       };
       function goback(){
    	   window.history.back();
       }
    </script>
    
</head>

<body>
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader"><div class="spinner"><div class="spinner-a"></div><div class="spinner-b"></div></div></div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
   	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="index.jsp" class="brand-logo"> <span class="logo-abbr"></span>
				<img src="images/talkdove.png"
				style="width: 110px; margin-left: -10px; margin-right: -20px;"></img>
				<span class="brand-title"></span>
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
		<%
			try {

				Connection con = DBConnection.getConnection();
				Statement st = con.createStatement();
				System.out.println("" + CurrentUserInfo.getEmail());
				ResultSet rs = st.executeQuery(
						"Select (profilepic) from register where email='" + CurrentUserInfo.getEmail() + "'");
				if (rs.next()) {
					String path = "C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog2\\WebContent\\profile\\";
					//                                                path=path+"downloaded";

					path = path + CurrentUserInfo.getEmail() + ".jpg";
					Blob blob = rs.getBlob("profilepic");
					InputStream ins = blob.getBinaryStream(1, blob.length());
					Files.copy(ins, Paths.get(path), StandardCopyOption.REPLACE_EXISTING);
					//String desc = rs.getString("idesc");
					ins.close();
				} else {

				}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		<div class="header" style="padding-top: 10px; padding-bottom: 0px;">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">

						<div class="header-left">

							<form action="addstory" method="post"
								enctype="multipart/form-data">
								<input type="hidden" value="<%=CurrentUserInfo.getEmail()%>"
									name="user"> <input type="file" name="story"
									id="myFile" style="display: none"> <label for="myFile">
									<span style="font-size: 35px;"> <i
										class="mdi mdi-plus-circle"></i>
								</span>
								</label>
								<button type="submit" style="border: none; background: none">
									<span style="font-size: 35px;"> <i
										class="mdi mdi-cloud-upload"></i>
									</span>
								</button>

							</form>
						</div>
						<div class="hs">


							<div class="showcase">

								<%
									Connection constt = DBConnection.getConnection();
									Statement stst = constt.createStatement();
									ResultSet rsst = stst.executeQuery("select * from story ");
									ArrayList<String> duser = new ArrayList<String>();
									while (rsst.next()) {
										Timestamp ts1 = new Timestamp(System.currentTimeMillis());
										Timestamp ts2 = rsst.getTimestamp("time");
										if (TimeUnit.MILLISECONDS.toMillis(ts1.getTime() - ts2.getTime()) > 1800000) //story for 3 min ,if 24hr then 86400000;
										{
											Statement stdl = constt.createStatement();
											stdl.executeUpdate("update story set status=0 where time = '" + ts2 + "'");
											stdl.executeUpdate("delete  from " + rsst.getString("user") + "story where storyid = '"
													+ rsst.getString("user") + rsst.getInt("userstoryno") + "'");
											File file = new File("C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog2\\WebContent\\story\\"
													+ rsst.getString("user") + rsst.getInt("userstoryno") + ".jpg");
											file.delete();
											duser.remove(rsst.getString("user"));
											continue;
										}
										if (TimeUnit.MILLISECONDS.toMinutes(ts1.getTime() - ts2.getTime()) > 60) {
											Statement stdl = constt.createStatement();
											stdl.executeUpdate("delete from story where time ='" + ts2 + "' ");

											continue;
										}
										
										String sql = "select * from " + rsst.getString("user") + "story where user='"
												+ CurrentUserInfo.getEmail() + "' && storyid = '" + rsst.getString("user")
												+ rsst.getInt("userstoryno") + "'";
										String path = "C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog2\\WebContent\\story\\";
										//          path=path+"downloaded";
										path = path + rsst.getString("user") + rsst.getInt("userstoryno") + ".jpg";
										Blob blob = rsst.getBlob("img");
										InputStream ins = blob.getBinaryStream(1, blob.length());
										Files.copy(ins, Paths.get(path), StandardCopyOption.REPLACE_EXISTING);
										//String desc = rs.getString("idesc");
										ins.close();

										if (duser.contains(rsst.getString("user"))) {
											continue;
										}
										Statement stcheck = constt.createStatement();
										ResultSet rscheck = stcheck.executeQuery(sql);
										if (rscheck.next()) {
											continue;
										}
										duser.add(rsst.getString("user"));
								%>
								<div style="float: left">
									<form action="storydisplay">
										<input type="hidden" name="user"
											value="<%=rsst.getString("user")%>"> <input
											type="hidden" name="id"
											value="<%=rsst.getInt("userstoryno")%>">
										<button type="submit" style="border: none; background: none">
											<img
												src="<%="story/" + rsst.getString("user") + rsst.getInt("userstoryno") + ".jpg"%>"
												style="height: 60px; width: 60px; border-radius: 100px; border: solid black 1px; margin-left: 8px;">
										</button>

									</form>
								</div>
								<%
									}
								%>
								<%
									Connection consttseen = DBConnection.getConnection();
									Statement ststseen = consttseen.createStatement();
									ResultSet rsstseen = ststseen.executeQuery("select * from story where status=1");
									while (rsstseen.next()) {
										String sql = "select * from " + rsstseen.getString("user") + "story where user='"
												+ CurrentUserInfo.getEmail() + "' && storyid = '" + rsstseen.getString("user")
												+ rsstseen.getInt("userstoryno") + "'";
										Statement stcheck1 = constt.createStatement();
										ResultSet rscheck1 = stcheck1.executeQuery(sql);
										if (duser.contains(rsstseen.getString("user"))) {
											continue;
										}
										if (rscheck1.next()) {

											duser.add(rsstseen.getString("user"));
								%>
								<div class="fade-in" style="float: left">
									<form action="storydisplay">
										<input type="hidden" name="user"
											value="<%=rsstseen.getString("user")%>"> <input
											type="hidden" name="id"
											value="<%=rsstseen.getInt("userstoryno")%>">
										<button type="submit" style="border: none; background: none">
											<img
												src="<%="story/" + rsstseen.getString("user") + rsstseen.getInt("userstoryno") + ".jpg"%>"
												style="height: 60px; width: 60px; opacity: 0.6; border-radius: 100px; border: solid silver 1px; margin-left: 8px;">
										</button>

									</form>
								</div>

								<%
									}
									}
									duser.clear();
								%>
							</div>

						</div>
						<%
							String sqll = "select count(*) from " + CurrentUserInfo.getEmail() + "notify where seen = '1'";
							Statement stc = DBConnection.getConnection().createStatement();
							ResultSet rsc = stc.executeQuery(sqll);
							int notificationcount = 0;
							if (rsc.next()) {
								notificationcount = rsc.getInt("count(*)");
							}
						%>



						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="mdi mdi-bell"></i> <%
 	if (notificationcount != 0) {
 %> <span class="badge badge-primary"><%=notificationcount%></span> <%
 	}
 %>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<h5 class="notification_title">Notifications</h5>
									<ul class="list-unstyled">

										<li class="media dropdown-item"><i
											class="mdi mdi-account-plus" class="mr-3"></i>
											<div class="media-body">
												<a href="#"> <%
 	String sqll1 = "select count(*) from " + CurrentUserInfo.getEmail()
 			+ "notify where seen = '1' and type = 'request'";
 	Statement stc1 = DBConnection.getConnection().createStatement();
 	ResultSet rsc1 = stc1.executeQuery(sqll1);
 	int request1 = 0;
 	if (rsc1.next()) {
 		request1 = rsc1.getInt("count(*)");
 	}
 %>
													<div class="d-flex justify-content-between">
														<h5 style="margin-left: 14px; margin-top: 4px;">Follow
															Request</h5>
														<span class="badge badge-primary"><%=request1%></span>

													</div>


												</a>
											</div></li>
										<li class="media dropdown-item"><i class="mdi mdi-heart"
											class="mr-3"></i>
											<div class="media-body">
												<a href="#"> <%
 	String sqll2 = "select count(*) from " + CurrentUserInfo.getEmail()
 			+ "notify where seen = '1' and type = 'like'";
 	Statement stc2 = DBConnection.getConnection().createStatement();
 	ResultSet rsc2 = stc2.executeQuery(sqll2);
 	int request2 = 0;
 	if (rsc2.next()) {
 		request2 = rsc2.getInt("count(*)");
 	}
 %>
													<div class="d-flex justify-content-between">
														<h5 style="margin-left: 14px; margin-top: 4px;">Likes
														</h5>
														<span class="badge badge-primary"><%=request2%></span>
													</div>

												</a>
											</div></li>
										<li class="media dropdown-item"><i
											class="mdi  mdi-comment" class="mr-3"></i>
											<div class="media-body">
												<a href="#"> <%
 	String sqll3 = "select count(*) from " + CurrentUserInfo.getEmail()
 			+ "notify where seen = '1' and type = 'comment'";
 	Statement stc3 = DBConnection.getConnection().createStatement();
 	ResultSet rsc3 = stc3.executeQuery(sqll3);
 	int request3 = 0;
 	if (rsc3.next()) {
 		request3 = rsc3.getInt("count(*)");
 	}
 %>
													<div class="d-flex justify-content-between">
														<h5 style="margin-left: 14px; margin-top: 4px;">Comments</h5>
														<span class="badge badge-primary"><%=request3%></span>
													</div>

												</a>
											</div></li>
									</ul>
									<a class="all-notification" href="notification.jsp">All
										Notifications</a>
								</div></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <!--  <i class="mdi mdi-home"></i> -->

									<img
									src="<%="profile/" + CurrentUserInfo.getEmail() + ".jpg"%>"
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
					<li><a class="has-arrow" href="notification.jsp"><i
							class="mdi mdi-bell"></i> <%
 	if (notificationcount != 0) {
 %> <span class="badge badge-primary"><%=notificationcount%></span> <%
 	}
 %><br>Notification</a></li>

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
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
        <!--**********************************
            Sidebar end
        ***********************************-->
    
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container">
                
               
                
                <!-- row -->
                <div class="row">
                
                
                    <div class="col-xl-12 col-xxl-12" style="margin-top:100px; margin-left:20px; ">
                    
                        <div class="card" >
                            <div class="card-header bg-dark">

                            <div class="text-light" style="float:left; width:10%; padding:-10px;">
                            	<button style="border:0px; background:none;">
                            		<img class="mr-4 rounded-circle" src="<%="profile/"+CurrentUserInfo.getEmail()+".jpg"%>" alt="profile" style="width:45px; margin-left:20px; height:40px;broder-radius:100px; ">
                                    </button>
                            	</div>
                            	<div style="float:left; width:85%;"> 
                                	<h4 class="card-title text-t0">Chat Inbox</h4>
                                </div>	
                                <div style="float:right; width:5%">
                                <form action="">
                                <button style="background:none; border: 0px;">
                                <i class="fa fa-power-off text-light" aria-hidden="true" style=""></i>
                                </button>
                                </form>
                                </div>
                                
                            </div>
                            
                            <%
                            try{
                            	Connection con = DBConnection.getConnection();
                            	Statement st = con.createStatement();
                            	String sql ="Select * from "+CurrentUserInfo.getEmail()+"inbox where status ='active'";
                            	ResultSet rs = st.executeQuery(sql);
                            	while(rs.next()){
                            %>
                            
                            
                            
                 <!-- div for chat box -->
                            <div class="card-body" > 
                                <div class="basic-form bg-light" >
                                    
                                    <div class="row" style="float:left; width:13% ;height:20%; padding-top:-10px;padding-left:30px;">
                                    
                                    <form action="" method="post">
                                    
                                    <button style="background: none; border:0px;">
                                    	<img class="mr-4 rounded-circle" src="profile/<%=rs.getString("email")%>.jpg" alt="profile" style="width:45px; height:40px;broder-radius:100px; ">
                                    </button>
                                    </form> 
                                    </div>
                                    <form action="chatbox" method="post">
                                    
                                    
                                    <input type="hidden" value="<%=rs.getString("email")%>" name="rEmail">
                                    <input type="hidden" value="<%=rs.getString("username")%>" name="rUsername">
                                    
                                    <div class="row" style="float:left;padding-left:30px;width:77%">
                                    
                                    <button style="background:none; border:0px; width:90%; height:50px;">
                                    <div class="row"><h6 class="text-primary" style="margin-left:25px;"><%=rs.getString("username")%></h6></div>
                                    
                                    <div class="row">
                                    <p style="font-size:11px; font-weight:50px; margin-left:25px;margin-top:-5px; color:#71859F;">Hey I'm using Talkdove</p>
                                    </div>
                                  </button>
                                    
                                   </div>
                                   </form>
                                   
                                    <div class="row" style="float:right;width:10%">
                                   <!-- icons --> 
                                    </div>
                                </div>
                            </div>
                            <hr style="margin-top:-10px;">
                            
                            <%}
                            }catch(Exception e){
                            	%><%=e%>
                            <%
                            }
                            %>
                            
                            <!--
                            <div class="card-body"> 
                                <div class="basic-form bg-light" >
                                    
                                    <div class="row" style="float:left; width:13% ;height:20%; padding-top:-10px; padding-left:30px;">
                                    <form action="">
                                    <button style="background: none; border:0px;">
                                    	<img class="mr-4 rounded-circle" src="images/guitar.jpg" alt="profile" style="width:45px; height:40px;broder-radius:100px; ">
                                    </button>
                                    </form>
                                    </div>
                                    
                                    <div class="row" style="float:left;padding-left:30px;width:77%">
                                    
                                    <button style="background:none; border:0px; width:90%; height:50px;">
                                    <div class="row"><h6 class="text-primary" style="margin-left:25px;">Kashish_10</h6></div>
                                    
                                    <div class="row">
                                    <p style="font-size:11px; font-weight:50px; margin-left:25px;margin-top:-5px; color:#71859F;">Hey dude how are you?</p>
                                    </div>
                                  </button>
                                    
                                   </div>
                                   
                                    <div class="row" style="float:right;width:10%">
                                    icons
                                    </div>
                                </div>
                            </div>
                            <hr style="margin-top:-10px;">
                            
                             -->
							
                            
                            <div class="card-body">   
                                <div class="row" style="float:right; padding-right:50px;">
                                    <form action="addchat.jsp">
                                      <div class="right-header-create-post" style="margin-top:0px;">
                                	<button type="submit" value="" style="  margin-right:0px; background: none; border:0px;" class="btn btn-rounded btn-primary" ><i
                                                class="mdi mdi-message-plus text-dark" style="color:#9400F3; font-size:30px;"></i>
                                                </button>
                                                
                                </div> 
                                    </form>
                               </div>  
                                    
                                </div>
                               
                                
                            </div>
                           
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Talkdove Team</a> 2019</p>
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
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_1" class="filled-in chk-col-primary" id="nav_header_color_1">
                                        <label for="nav_header_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_2" class="filled-in chk-col-primary" id="nav_header_color_2">
                                        <label for="nav_header_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_3" class="filled-in chk-col-primary" id="nav_header_color_3">
                                        <label for="nav_header_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_4" class="filled-in chk-col-primary" id="nav_header_color_4">
                                        <label for="nav_header_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_5" class="filled-in chk-col-primary" id="nav_header_color_5">
                                        <label for="nav_header_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_6" class="filled-in chk-col-primary" id="nav_header_color_6">
                                        <label for="nav_header_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_7" class="filled-in chk-col-primary" id="nav_header_color_7">
                                        <label for="nav_header_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_8" class="filled-in chk-col-primary" id="nav_header_color_8">
                                        <label for="nav_header_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_9" class="filled-in chk-col-primary" id="nav_header_color_9">
                                        <label for="nav_header_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_10" class="filled-in chk-col-primary" id="nav_header_color_10">
                                        <label for="nav_header_color_10"></label>
                                    </span>
                                </div>
                            </div>
                            <div>
                                <p>Header</p>
                                <div>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_1" class="filled-in chk-col-primary" id="header_color_1">
                                        <label for="header_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_2" class="filled-in chk-col-primary" id="header_color_2">
                                        <label for="header_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_3" class="filled-in chk-col-primary" id="header_color_3">
                                        <label for="header_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_4" class="filled-in chk-col-primary" id="header_color_4">
                                        <label for="header_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_5" class="filled-in chk-col-primary" id="header_color_5">
                                        <label for="header_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_6" class="filled-in chk-col-primary" id="header_color_6">
                                        <label for="header_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_7" class="filled-in chk-col-primary" id="header_color_7">
                                        <label for="header_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_8" class="filled-in chk-col-primary" id="header_color_8">
                                        <label for="header_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_9" class="filled-in chk-col-primary" id="header_color_9">
                                        <label for="header_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_10" class="filled-in chk-col-primary" id="header_color_10">
                                        <label for="header_color_10"></label>
                                    </span>
                                </div>
                            </div>
                            <div>
                                <p>Sidebar</p>
                                <div>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_1" class="filled-in chk-col-primary" id="sidebar_color_1">
                                        <label for="sidebar_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_2" class="filled-in chk-col-primary" id="sidebar_color_2">
                                        <label for="sidebar_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_3" class="filled-in chk-col-primary" id="sidebar_color_3">
                                        <label for="sidebar_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_4" class="filled-in chk-col-primary" id="sidebar_color_4">
                                        <label for="sidebar_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_5" class="filled-in chk-col-primary" id="sidebar_color_5">
                                        <label for="sidebar_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_6" class="filled-in chk-col-primary" id="sidebar_color_6">
                                        <label for="sidebar_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_7" class="filled-in chk-col-primary" id="sidebar_color_7">
                                        <label for="sidebar_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_8" class="filled-in chk-col-primary" id="sidebar_color_8">
                                        <label for="sidebar_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_9" class="filled-in chk-col-primary" id="sidebar_color_9">
                                        <label for="sidebar_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_10" class="filled-in chk-col-primary" id="sidebar_color_10">
                                        <label for="sidebar_color_10"></label>
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

</body>

<!-- Mirrored from demo.quixkit.com/corbin/form-drofify.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:55 GMT -->
</html>