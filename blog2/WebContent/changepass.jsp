<html>
<head>
<script src="changepass.js"></script>
<link rel="stylesheet" href="css/changepass.css">
<link rel="stylesheet" href="css/style.css">
<title>Talkdove - Change Password</title>
</head>
<div id="box">

  <form action="changepass" id="myform-search" method="post" autocomplete="off">
  <h1>Change Password <span>choose a good one!</span></h1>
  <br>
    <p>
      <input type="password" value="" placeholder="Enter Password" id="p" class="password" name="pass">
    </p>
    <p>     
      <input type="password" value="" placeholder="Confirm Password" id="p-c" class="password" name="conpass">
      <br>
    <input type="submit" class="bg-dark text-light" value="Change Password" style=" margin-top:20px; margin-bottom:20px; border-radius:20px;width:80%; height:30px;">
   
    <br>
    <small>Must be 6+ characters long and contain at least 1 upper case letter, 1 number, 1 special character</small>
    </p>
  </form>
</div>

</html>