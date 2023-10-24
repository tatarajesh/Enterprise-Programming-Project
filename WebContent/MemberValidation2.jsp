<%
String uname=null;
//System.out.print(request.getParameter("pname"));
uname=request.getParameter("pname");

if(uname==null)
{
	Cookie[] cookies= request.getCookies();
	Cookie cookie=cookies[1];
	uname=cookie.getValue();
	//System.out.print("YEs-null so im");
}
out.println("<center><br><h2>Login Successful as <i>'<u>Participant</u>'</i>"); 
out.println("<br><br><b>Welcome : "+uname+" </b>");
out.println("<br><br><a href='LogOut.jsp'><button>Logout</button></a>");
out.println("</center></h1><hr>");
%>
<html>
<head>
<link rel="stylesheet" href="Project1.css">
<title>Welcome..</title>
<body bgcolor="silver">
<br><br><br><br>
<center >
	<form action="" method="get">
		<a href="viewAttandance.jsp?uname=<%=uname%>"> <input class="login loginhover" type="button"  name="x" Value="Attandance Register"> </a>
		<a href="MemberRegister.jsp?uname=<%=uname%>"><input class="login loginhover" type="button" name="x" Value="UpcommingEvents"> </a>
	</form>
</center>
</body>
</html>
