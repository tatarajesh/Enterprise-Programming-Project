<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
String uname=request.getParameter("uname");
String festname=request.getParameter("festname");
%>
<html>
<link rel="stylesheet" href="Project1.css">
<style>
.dis {cursor: no-drop;}
</style>
<body bgcolor="pink">
<br><hr><br>
<marquee behavior="alternate" style="color:blue; font-size:20px">Live every day as if it is a festival. Turn your life into a celebration</marquee>
<br><br><hr><br><br>
<center>
<table border="3" style="border-collapse:collapse; font-size:20px;">
<form action="RegisterdintoDB.jsp">
<tr><td><b>Username/Email:</b></td>
<td><input type="text" value=<%=uname%> class="dis" name="uname" readonly></td></tr>
<tr><td><b>Fest Name:</b></td>
<td><input type="text" value=<%=festname%>  name="festname"  class="dis" readonly></td></tr>
<tr><td colspan="2" align="center"><input type="submit" class="login" value="Register"> </td></tr>
</form>
</table>
</center>
</body>
</html>
