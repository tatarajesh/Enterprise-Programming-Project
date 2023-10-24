<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head><title>PastEvents...</title></head>
<link rel="stylesheet" href="Project1.css">
<style>
</style>

<body bgcolor="pink">
	
	<center>
		<br><h1><i>Lets Go....</i></h1>
		<hr><br>
	</center>
	
	<b><h2 style="color:red">List of Past Events:</h2></b>
	<%
	Connection con=null;
	Statement stmt;
	ResultSet rs;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");

			String s="select * from pastevents";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(s);
			
			out.println("<h2 style='color:blue'><i>");
			while( rs.next()) 
			{
				out.println("->"+rs.getString(1)+"<br>"); 
			}
			out.println("</i></h2>");
		   }
		catch(Exception e){ out.println(e.getMessage()); }
		finally{
			try{con.close();}
			catch(Exception e1){}
				}
				
	%>