<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head> <title>Login</title>
<link rel="stylesheet" href="Project1.css">
<script>
function validate()
{
var un=document.getElementById("un");
var pw=document.getElementById("pw");
if(un.value=="")
{
document.getElementById("3").innerHTML="ERROR : Email is mandatory";
return false;
}
else { document.getElementById("3").innerHTML=""; }

if(pw.value=="") 
{ 
document.getElementById("3").innerHTML="ERROR : Password is required"; 
return false; 
}
else { document.getElementById("3").innerHTML=""; }
}
</script>

<style>
table,tr,td
{background-color:skyblue;}
	
	table{ 
	padding:2%;
	border:5px ridge black;}
</style>
</head>

<body bgcolor="pink"><br>
<form action="SignUp.jsp">
<center><a href="" ><input type="submit" class="login" value="SignUp"> </a>  </center>
</form><br><hr><br>
<h1 style="text-align:center; color:Blue;"><i>Login Page</i> </h1>
<center>
<table onsubmit="return validate()">
<form action="MemberValidation.jsp" method="post">
<tr>
<td>Email:</td>
<td><input type="text" value="" id="un" name="uname"> <br><br> </td>
</tr>

<tr>
<td>Password</td>
<td><input type="password" id="pw" name="pw">  </td>
</tr>
<tr> </tr><tr> </tr><tr> </tr>
<tr>
<td colspan="2" align="center"><input class="login" type="submit" value="Login.."></td> 
</tr>

<tr>
<td colspan="2"><span id="3" style="color:red;"> </span> </td>
</tr>
</form>	
		</table> </center>
   </body>
</html>


