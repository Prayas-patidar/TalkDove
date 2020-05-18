<!DOCTYPE html>
<%@page import="com.chats.AddChat"%>
<%@page import="com.chats.CurrentChatInfo"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Time"%>
<%@page import="com.currentuser.CurrentUserInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnection"%>
<html lang="en">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <title>Talkdove - Chat</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%try
{
	Connection con = DBConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from "+CurrentChatInfo.getTableName());
	while(rs.next()){
	if(rs.getString("sender").equals(CurrentChatInfo.getrEmail())){
                     %>       
                              
                            
                            
                            
                            <div class="card-body">
                          <!-- <div style="float:left;width:10%; padding:15px; padding-left:30px;">
                           	<button style="border:0px; background:none;">
                            	<img alt="profile" src="images/guitar.jpg" style="width:50px; height:45px; border-radius:70%">
                            	</button>
                           </div>
							-->                            
                            
                            <div class="input-rounded bg-light text-dark" style="float:left; border:1px solid #DEDDDD;  text-align:justify;margin-top:13px; border-radius:50px;padding:13px; padding-left:30px; width:70%">
                           <span style="width:70%; padding:20px;" ><%=rs.getString("message")%>
                            </span>
                            </div>
                            
                            
                </div>
                
                <% }else{
                System.out.println("else part of box");
                     
                	%>
                
                
                
                            <div class="card-body">   
                            <!--    <div style="float:right;width:10%; padding:15px; padding-left:30px;">
                           	<button style="border:0px; background:none;">
                            	<img alt="profile" src="images/guitar.jpg" style="width:50px; margin-top:10px; height:45px; border-radius:70%">
                            	</button>
                           </div>
                           -->
                           <div class="input-rounded bg-dark text-light" style="float:right; border:1px solid #DEDDDD;  text-align:justify;margin-top:13px; border-radius:50px;padding:13px; padding-left:30px; width:70%">
                           <span style="width:70%; padding:20px;" ><%=rs.getString("message")%>
                            </span>
                            </div>
                                    
                                </div>
                               
                                
                       <%
                }
	}                
	}catch(Exception e){
		System.out.println("Exception in box "+e);
	}
                       
                      %>         
                             
                                
                      
</body>
</html>