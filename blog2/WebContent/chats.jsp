<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Talkdove - Chat</title>
</head>
<body>
<form action="chat" method= "post" enctype="multipart/form-data">
<input type="text" name="fromId"/>
<input type="text" name="toId"/><br>
<textarea rows="2" cols="100" name="message"></textarea>
<input type="file" name ="fileAttached"/>
<input type="submit"/>

</form>
</body>
</html>


