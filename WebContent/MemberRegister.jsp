<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head><title>NextEvents...</title></head>
<style>
</style>
<body>
	<center>
		<br><h1><i>Lets Go....</i></h1>
		<hr><br>
	<b><h1 style="color:red">List of Upcomming Events:</h1></b></center>
	<%
	Connection con=null;
	Statement stmt;
	ResultSet rs;
String uname=request.getParameter("uname");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");

			String s="select * from upcommingevents";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(s);
			%>
			<div style="position:absolute;left:43%;top:230px;">
			<table border="3px solid gold;"  style="border-collapse:collapse; font-size:25px;">
			<% 
			while( rs.next()) 
			{
				%>
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><a href= "Registerintoevent.jsp?uname=<%=uname%>&festname=<%=rs.getString(1)%>">Register</a></td>
				</tr>
				<%
			}
			%>
			</table>
				</div>
			<%
			
		   }
		catch(Exception e){ out.println(e.getMessage()); }
		finally{
			try{con.close();}
			catch(Exception e1){}
				}
				
	%>