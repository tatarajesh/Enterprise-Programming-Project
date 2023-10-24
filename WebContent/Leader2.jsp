<%
//System.out.print(request.getParameter("oname"));
String uname=null;

uname=request.getParameter("oname");

if(uname==null)
{
	Cookie[] cookies= request.getCookies();
	Cookie cookie=cookies[1];
	uname=cookie.getValue();
	//System.out.print("YEs-null so im");
}
out.println("<center><br><br><h1><i>Login Successful as '<u>Organiser</u>'</i>"); 
out.println("<br><br><b>Welcome : "+uname+" </b>");
out.println("<br><br><a href='LogOut.jsp'><button>Logout</button></a>");
out.println("</center></h1><hr>");
%>
<html>
<head>
<link rel="stylesheet" href="Project1.css">
<title>Welcome@Core</title>
</head>
<body bgcolor="silver">
<br><br><br><br>
<center >
	<form action="Leader2.jsp" method="get">
		<input class="login loginhover" type="submit"  name="x" Value="PastEvents">
		<input class="login loginhover" type="submit" name="x" Value="UpcommingEvents">
		<input class="login loginhover" type="submit" name="x" Value="Mark Attandance">
	</form>
</center>
</body>
</html>


<%
try{
String s=request.getParameter("x");
//System.out.println(s);
if(s.equals("PastEvents"))
{
	%>
	<jsp:forward page="PastEvents.jsp">
	<jsp:param value="" name=""/>
	</jsp:forward>
	<%	
}
else if(s.equals("UpcommingEvents"))
{
	%>
	<jsp:forward page="UpcommingEvents.jsp">
	<jsp:param value="" name=""/>
	</jsp:forward>
	<%	
}

else if(s.equals("Mark Attandance"))
{
	%>
	<jsp:forward page="MarkAttandance.jsp">
	<jsp:param value="" name=""/>
	</jsp:forward>
	<%	
}

else
{}

}
catch(Exception e)
{ 
	//out.println(e); //new
}
%>