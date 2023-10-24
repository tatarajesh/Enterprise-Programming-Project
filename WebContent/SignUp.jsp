<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head>
<title>SignUP FORM</title>
<link rel="stylesheet" href="Project1.css">
<style>
div{
border: 3px solid black;width:300px;position:absolute;
height:320px;top:15%;left:35%;padding:1.5%;
background-color:skyblue;}
</style><script>
function fun0()
{
var x=document.getElementById("fn");
x.value=x.value.toUpperCase();
}
function check()
{
var nme=document.getElementById("fn").value;
if(nme=="")
{
window.alert("Error :: UserName required");
return false;
}


var eml=document.getElementById("email").value;
if(eml=="")
{
window.alert("Error :: Email required");
return false;
}
var at=eml.indexOf("@");
var dot=eml.lastIndexOf(".");
var le=eml.length;
if(dot>at+3 && at>5 && le>=dot+1+2) { }
else
{ window.alert("Error :: Invalid Email"); 
return false;
}

var no=document.getElementById("pw").value;
var no2=parseInt(no);
if( no.length>5 && no != "") { }
else
{
window.alert("Error :: Enter Strong Password");
return false;
}


var no=document.getElementById("ph").value;
var no2=parseInt(no);
if(no2 != NaN && no.length==10 && no != "") { }
else
{
window.alert("Error :: Enter valid Phone number");
return false;
}
var cb=document.getElementById("checkbox").checked;
if(cb != false)
{ }
else
{
window.alert("Error :: please accept terms & conditions");
return false;
}}</script>	</head>	
<body bgcolor="orange"><div> 
<h2 align="center"><i>SignUP FORM </i> </h2>
<hr>
<br>
<table onsubmit="return check()">
 <form action="SignUp.jsp" method="post">
<tr>
<td> UserName:</td>
<td> <input type="text" id="fn" name="uname" onchange="fun0()"> </td>
</tr><tr>

<tr>
<td> Email:</td>
<td><input type="text" id="email" name="email"> </td>
</tr>

<td>Password:</td>
<td><input type="password" id="pw" name="pw"> </td>
</tr>

<td>Phone no:</td>
<td><input type="text" id="ph" name="ph"> </td>
</tr>

<tr>
<td colspan="2"><input type="checkbox" id="checkbox">I accept to the terms & conditions</td>
</tr><tr>
<td align="center" colspan="2"><input type="submit" class="login" id="submit" value="SUBMIT"> </td>
</tr> </form>
</table>
 </div>
</body>
</html>


<%
try{
String s1=request.getParameter("uname");
String s2=request.getParameter("email");
String s3=request.getParameter("pw");
String s4=request.getParameter("ph");

Connection con=null;
PreparedStatement pstmt;
ResultSet rs;
System.out.println(s1);
  try{ 
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
			  
    String s="insert into members values(?,?,?,?)";
     pstmt=con.prepareStatement(s);
	pstmt.setString(1,s2);
	pstmt.setString(2,s3);
	pstmt.setString(3,s1);
	pstmt.setString(4,s4);
	pstmt.executeUpdate();
			  
    System.out.println("Success...");
			  %>
	<jsp:forward page="MemberLogin_Signup.jsp">
	<jsp:param value="" name=""/>
	</jsp:forward>
			  <%
  	}
  catch(Exception e){  }
}
catch(Exception e)
{ //out.println(e);
}
%>