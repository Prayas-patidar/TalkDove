

<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Follow.CheckProfile"%>
<%@page import="com.login.CheckUser"%>
<%@page import="com.error.Handler"%>
<%@page import="com.db.DBCreateLikeTable"%>
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
<html lang="en">


<!-- Mirrored from demo.quixkit.com/corbin/ui-card.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:33 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <title>Talkdove - Home Page</title>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="css/style.css" rel="stylesheet">
    
</head>
        <style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
  width:100%;
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
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader"><div class="spinner"><div class="spinner-a"></div><div class="spinner-b"></div></div></div>
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
            <a href="index.jsp" class="brand-logo">
                <span class="logo-abbr">Q</span>
                <img src="images/talkdove.png" style="width:110px; margin-left:-10px;margin-right:-20px;"></img>
                <span class="brand-title">Talkdove</span>
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
                    
                    <% String sqll = "select count(*) from "+CurrentUserInfo.getEmail()+"notify where seen = '1'"; 
                       Statement stc = DBConnection.getConnection().createStatement();
                       ResultSet rsc = stc.executeQuery(sqll);
                       int notificationcount =0;
                       if(rsc.next()){
                    	   notificationcount = rsc.getInt("count(*)");
                       }
                       %>
                       
                   
                 
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="mdi mdi-bell"></i>
                                     <% if(notificationcount != 0){ %> <span class="badge badge-primary"><%= notificationcount %></span><% } %>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <h5 class="notification_title">Notifications</h5>
                                    <ul class="list-unstyled">
                                    
                                        <li class="media dropdown-item">
                                         <i class="mdi mdi-account-plus" class="mr-3" ></i>
                                            <div class="media-body">
                                                <a href="#">
                                                <% String sqll1 = "select count(*) from "+CurrentUserInfo.getEmail()+"notify where seen = '1' and type = 'request'"; 
                       Statement stc1 = DBConnection.getConnection().createStatement();
                       ResultSet rsc1 = stc1.executeQuery(sqll1);
                       int request1 =0;
                       if(rsc1.next()){
                    	   request1 = rsc1.getInt("count(*)");
                       }
                       %>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Follow Request </h5><span class="badge badge-primary"><%= request1 %></span>
                                                    </div>
                                                   
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                            <i  class="mdi mdi-heart" class="mr-3"></i>
                                            <div class="media-body">
                                                <a href="#">
                                                   <% String sqll2 = "select count(*) from "+CurrentUserInfo.getEmail()+"notify where seen = '1' and type = 'like'"; 
                       Statement stc2 = DBConnection.getConnection().createStatement();
                       ResultSet rsc2 = stc2.executeQuery(sqll2);
                       int request2 =0;
                       if(rsc2.next()){
                    	   request2 = rsc2.getInt("count(*)");
                       }
                       %>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Likes  </h5><span class="badge badge-primary"><%= request2 %></span>
                                                    </div>
                                                    
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                             <i  class="mdi  mdi-comment" class="mr-3"></i>
                                            <div class="media-body">
                                                <a href="#">
                                                                <% String sqll3 = "select count(*) from "+CurrentUserInfo.getEmail()+"notify where seen = '1' and type = 'comment'"; 
                       Statement stc3 = DBConnection.getConnection().createStatement();
                       ResultSet rsc3 = stc3.executeQuery(sqll3);
                       int request3 =0;
                       if(rsc3.next()){
                    	   request3 = rsc3.getInt("count(*)");
                       }
                       %>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 style="margin-left:14px;margin-top:4px;">Comments</h5><span class="badge badge-primary"><%= request3 %></span>
                                                    </div>
                                                    
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">All Notifications</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    
                                   <!--  <i class="mdi mdi-home"></i> -->
                                   
                                   <%try{
                                         
                                            Connection con = DBConnection.getConnection();
                                            Statement st = con.createStatement();
                                            
                                            ResultSet rs = st.executeQuery("Select (profilepic) from register where email='"+CurrentUserInfo.getEmail()+"'");
                                            if(rs.next()){
                                                String path="C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog2\\WebContent\\profile\\";
//                                                path=path+"downloaded";
                                               
                                                path=path+CurrentUserInfo.getEmail()+".jpg";
                                                Blob blob =rs.getBlob("profilepic");
                                                InputStream ins = blob.getBinaryStream(1,blob.length());
                                                Files.copy(ins,Paths.get(path),StandardCopyOption.REPLACE_EXISTING);
                                                //String desc = rs.getString("idesc");
                                                ins.close();
                                                }else{
                                                	
                                                }
                                   }
                                   			catch(Exception e){
                                                	%>catch mein hun <%=e%><% 
                                                }
                                            
                                                %>
                                   
                                   
                                   
                                 
                                   
                                   
                                   
                                   
                                   <img src="<%="profile/"+CurrentUserInfo.getEmail()+".jpg"%>" style="height: 30px; width:30px; border-radius:100px; ">
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="myprofile.jsp" class="dropdown-item">
                                        
                                        <span>My profile</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Calender</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Inbox</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Settings</span>
                                    </a>
                                    <a href="logout" class="dropdown-item">
                                        
                                        <span>Logout</span>
                                    </a>
                                </div>
                            </li>
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
                    <li><a href="myprofile.jsp">
                   
                    <img src="<%="profile/"+CurrentUserInfo.getEmail()+".jpg"%>" 
                    
                    style=" margin-bottom:10px;
                    height: 45px;
                    width: 45px;
                    border-radius: 100px;"/>
                      <span class="nav-text">Profile</span></a></li>
                    
                    <li><a class="has-arrow" href="ui-card.jsp"><i class="mdi mdi-home"></i><span class="nav-text">Home</span></a>
                       
                    </li>
                    <li><a class="has-arrow" href="form-drofify.jsp"><i class="mdi mdi-upload"></i><span class="nav-text">Upload</span></a>
                       
                    </li>
               
                       
                   
                    <li><a class="has-arrow" href="notification.jsp" ><i class="mdi mdi-bell"></i><% if(notificationcount != 0){ %> <span class="badge badge-primary" ><%= notificationcount %></span><% } %><br>Notification</a>
                     </li>
                    
                    <li><a class="has-arrow" href="chatlist" aria-expanded="false"><i class="mdi mdi-message-text"></i><span class="nav-text">Chats</span></a>
                       
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-account-settings-variant"></i><span class="nav-text">User Account</span></a>
                       
                    </li>

                    <li><a class="has-arrow" href="logout" aria-expanded="false"><i class="mdi mdi-power"></i><span class="nav-text">Logout</span></a>
                        
                    </li>

                    

                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
    
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container"style="margin-top:60px;">
                
                <div class="row" >
                    
                         <%  if(CheckProfile.invalidusername==1){ CheckProfile.invalidusername=0; %>
    <div class="alert warning">
  <span class="closebtn">&times;</span>  
  No user exist with Email Id <strong><%= CheckProfile.getProfilename() %>@gmail.com</strong>
   </div>
   <% } %>
                    
                    
                    <%
                            String checkfollower = "select * from follow where sender ='"+CurrentUserInfo.getEmail()+"' and status='accepted'";      
                    		ArrayList<String> follower = new  ArrayList<String>();		
                    try{
                    			Connection con = DBConnection.getConnection();
                    			Statement sst = con.createStatement();
                    			ResultSet rsfollow = sst.executeQuery(checkfollower);
                    			while(rsfollow.next()){
                    				follower.add(rsfollow.getString("accepter"));
                    			}
                    		}catch(Exception ee){
                    			System.out.println(ee);
                    		}
                    
                    		if(!CurrentUserInfo.getEmail().equals(null)){
                                   try{
                                         // dp laani h yaha pr
                                            Connection con = DBConnection.getConnection();
                                            Statement st = con.createStatement();
                                            
                                            ResultSet rs = st.executeQuery("Select * from allpost where status = 1 order by time DESC");
                                            System.out.println("query ho gyi");
                                            while(rs.next()){
                                                String path="C:\\Users\\"+System.getProperty("user.name")+"\\workspace\\blog2\\WebContent\\post\\";
 												String path1= path+rs.getString("postid")+"1.jpg";                                              
                                                path=path+rs.getString("postid")+".jpg";
 
                                                Blob blob =rs.getBlob("image");
                                                InputStream ins = blob.getBinaryStream(1,blob.length());
                                                Files.copy(ins,Paths.get(path),StandardCopyOption.REPLACE_EXISTING);
                                                BufferedImage img = null;
                                                img= ImageIO.read(new File(path));
                                                Image dimg= img.getScaledInstance(300,100,Image.SCALE_SMOOTH);
                                                img= new BufferedImage(300,100,BufferedImage.TYPE_INT_ARGB);
                                                ImageIO.write(img,"jpg", new File(path1));
                                                String desc = rs.getString("description");
                                             	Timestamp datetime = rs.getTimestamp("time");
                                              //  System.out.println(datetime);
                                                ins.close();
                                            String user= rs.getString("postid").substring(0, rs.getString("postid").indexOf("post"));
                                                   System.out.println(user);
                                                   if(!(follower.contains(user)||user.equals(CurrentUserInfo.getEmail()))){
                                                	   continue;
                                                   }
                                                   Statement st1 = con.createStatement();
                                               String postuserinfo ="select username from register where email='"+user+"'"; 
                                               ResultSet rs1 = st1.executeQuery(postuserinfo);
                                               String username="";
                                               if(rs1.next())
                                               {
                                            	   username = rs1.getString("username");
                                               }
                                               
                                            //username and email
                                 %>  
                    
                             
                                
                                   
                                   
                    
                    
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6" style="width:70%;height:40%;">
                        <div class="card mb-3">
                        <form action="welcome">
                        <input type="hidden" value="<%=rs.getString("postid")%>" name="postid" />
                           <button type="submit"><img class="card-img-top img-fluid" src="post/<%=rs.getString("postid")%>.jpg" alt="Card image cap"/>
                           </button>
                           </form> <div class="card-header">
                                <div style="float:left; width:10%; margin-left:-10px;">
                               
                               
                                <form action="otherprofile">
                                                   <% System.out.println("  ==================   =======  "+user); %>
                                                   <input type="hidden" name="profilename" value="<%= user %>">
                                                   <button type="submit"  style="border : none;background : none">
                                                 <img src="profile/<%=user+".jpg"%>" style="border-radius:100px;width:45px;height:45px;">
                                                   </button>
                                                   </form>
                               
                               
                                </div>
                                <div style="float:right; text-align:left; margin-left:-20px; width:50%;">
                                <h5 class="card-title text-t8" style="font-size:15px;"><b><%=username%></b></h5>
                                </div>
                                 <div style="float:right;">
                               <% 	        
                               String postid= rs.getString("postid");
                  				int countlike=0;
                  				String checkLike = "select status from "+rs.getString("postid")+"like where CUsername = '"+CurrentUserInfo.getEmail()+"'";
								int status=0;
                  				Statement st2= con .createStatement();
								ResultSet rs2 = st2.executeQuery(checkLike);
								if(rs2.next()){
								status =	rs2.getInt("status");
								}
								
                    %>
                               <form action="checkLikeCard">
                              <input type="hidden" value="<%=rs.getString("postid")%>" name="postid" />
                              <button type= "submit" style="border : none;background : none">
                              <% if(status==1){ %>
                              
                              
                              
                              	<i class="mdi mdi-heart like-button"  style="font-size:27px;"></i>
								<% } else { %>       <i class="mdi mdi-heart-outline" style="padding-left:10px;font-size:27px;"> </i>        <% } %>               </button></form>
                                 <% 	        
                  				int countlike1=0;
                  				String checkLike1 = "select count(*) from "+postid+"like where status = 1";
								System.out.println("postid ======  "+postid+"like");
                  				Statement st21= con .createStatement();
								ResultSet rs21 = st21.executeQuery(checkLike1);
								if(rs21.next()){
								countlike1 =	rs21.getInt("count(*)");
								}
                    %>
                               <span style="margin-top:-7px; font-size:13px;"><%= countlike1 %> likes</span>
                                </div>
                            </div>
                            <div class="card-body">
                            <div class="row" style="margin-bottom:20px;">
                                <p class="card-text text-t8"> <%=rs.getString("description")%></p>
                                
                                </div>
                                <form action ="addcommentCard">
                                <div class = "row" style="margin-top:20px;">
                               	 
                               	      	 <div class="form-group " style="width:85%; float:left;">
                                            <input type="text" class="form-control input-rounded bg-light" name="comment" style="height:40px;" placeholder="+ Add Comment">

                                        </div>
                                        
                                        <div style="float:right;width:15%;margin-top:0px; margin-right:-10px; ">
                                        <input type="hidden" value="<%=rs.getString("postid")%>" name="postid" />
                                        <button type="submit" class="bg-dark text-light" style=" margin-top:-5px; border-radius:100px; padding-left:10px;
                                        padding-right:10px;
                                        padding-top:5px;
                                        padding-bottom:5px;
                                      font-size:20px;
                                         margin-left:5px;"> <i class="mdi mdi-telegram" ></i></button>
                                        </div>
                                       
                                        
                               	</div>
                                </form>
                                <div class="row">
                                <p class="card-text"style="font-size:12px; font-weight: 500;">Published on : <%=datetime%></p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    <%}	
                           
                  }
                                   			catch(Exception e){
                                   				System.out.println("catch mein hun na "+e);
                                                	%>catch mein hun main<%=e%><%
                                                			
                                   			}
                                   }
                                                %>
                    
                    
                    
                    
                                            
                    
  <!-- <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3 text-t0 bg-b3">
                  <a href ="#"><img class="card-img-top img-fluid" src="images/guitar.jpg" alt="Card image cap"></a>
                            <div class="card-header"><div style="float:left; width:10%; margin-left:-10px;">
                                <img src="images/guitar.jpg" style="
                                border-radius:100px;
                                width:45px;
                                height:45px;
                               
                                ">
                                </div>
                                <div style="float:right; text-align:left; margin-left:-20px; width:50%;">
                                <h5 class="card-title text-t0">Card title</h5>
                                </div>
                                <div style="float:right; width:40;">
                                <i class="mdi mdi-heart" style="font-size:28px; margin-top:-10px; color:#FF1A03;"></i>
                                </div>                            </div>
                            <div class="card-body">
                                                                <div class="row">
                                <p class="card-text">This is a wider card with supporting text below as a
                                    natural lead-in to additional content. This content is a little bit longer.</p>
                                
                                </div>
                                <div class = "row" style="margin-top:10px;">
                               	 
                               	      	 <div class="form-group " style="width:85%; float:left;">
                                            <input type="text" class="form-control input-rounded bg-light" style="height:40px;" placeholder="+ Add Comment">

                                        </div>
                                        
                                        <div style="float:right;width:15%;margin-top:0px; margin-right:-10px; ">
                                        <button class="bg-dark text-light" style=" margin-top:-5px; border-radius:100px; padding-left:10px;
                                        padding-right:10px;
                                        padding-top:5px;
                                        padding-bottom:5px;
                                      font-size:20px;
                                         margin-left:5px;"> <i class="mdi mdi-telegram" ></i></button>
                                        </div>
                                       
                                        
                               	</div>
                                
                                <div class="row">
                                <p class="card-text text-light"style="font-size:12px; font-weight: 500;">Published on : 20 May 2017</p>
                                </div>
                            </div>
                        </div>
                    </div>

<div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3 text-t0 bg-b4">
                           <a href ="#"> <img class="card-img-top img-fluid" src="images/guitar.jpg" alt="Card image cap"></a>
                            <div class="card-header">
                                <div style="float:left; width:10%; margin-left:-10px;">
                                <img src="images/guitar.jpg" style="
                                border-radius:100px;
                                width:45px;
                                height:45px;
                               
                                ">
                                </div>
                                <div style="float:right; text-align:left; margin-left:-20px; width:50%;">
                                <h5 class="card-title text-t0">Card title</h5>
                                </div>
                                <div style="float:right; width:40;">
                                <i class="mdi mdi-heart" style="font-size:28px; margin-top:-10px; color:#FF1A03;"></i>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                <p class="card-text text-t0">This is a wider card with supporting text below as a
                                    natural lead-in to additional content. This content is a little bit longer.</p>
                                
                                </div>
                                <div class = "row" style="margin-top:10px;">
                               	 
                               	      	 <div class="form-group " style="width:85%; float:left;">
                                            <input type="text" class="form-control input-rounded bg-light" style="height:40px;" placeholder="+ Add Comment">

                                        </div>
                                        
                                        <div style="float:right;width:15%;margin-top:0px; margin-right:-10px; ">
                                        <button class="bg-dark text-light" style=" margin-top:-5px; border-radius:100px; padding-left:10px;
                                        padding-right:10px;
                                        padding-top:5px;
                                        padding-bottom:5px;
                                      font-size:20px;
                                         margin-left:5px;"> <i class="mdi mdi-telegram" ></i></button>
                                        </div>
                                       
                                        
                               	</div>
                                
                                <div class="row">
                                <p class="card-text text-light"style="font-size:12px; font-weight: 500;">Published on : 20 May 2017</p>
                                </div>

                            </div>
                        </div>
                    </div>



   -->                                      
                                         
                    
                    
                     
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
    <script src="vendor/highlightjs/highlight.pack.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
<% }else{
	
	Handler.errorNotInUse=1;
	response.sendRedirect("index.jsp");
	}%>
</body>
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
<!-- Mirrored from demo.quixkit.com/corbin/ui-card.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:34 GMT -->
</html>