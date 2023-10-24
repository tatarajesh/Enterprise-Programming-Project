<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head><title>View Attandance</title>
<link rel="stylesheet" href="Project1.css"></head>
<body bgcolor="yellow">
<center>
	<br>
	<%
	Connection con=null;
	Statement stmt;
	ResultSet rs;
   String uname=request.getParameter("uname");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");

			String s="select * from attandance where username='"+uname+"' ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(s);
			%>
			<h1>Attandance..!</h1>
			<h2><b>User Name : </b><i style="color:blue;"><u><%= uname %></u></i></h2><br><br><hr><br>
			<table border="3" style="border-collapse:collapse; font-size:20px;">
			<tr>
			<th style="padding: 8px;">&nbsp;FestName&nbsp;</th>
			<th style="padding: 8px;">&nbsp;&nbsp;FestDate&nbsp;&nbsp;</th>
			<th style="padding: 8px;">Status</th>
			</tr>
			<%
			if(rs.next())
			{
			while( rs.next()) 
			{
			%>
			<tr style=" padding: 35px;">
				<td style="padding: 8px;"><%=rs.getString(1)%></td>
				<td style="padding: 4px;"><%=rs.getString(2)%></td>
				<% 
				int n=Integer.parseInt(rs.getString(4));
				if(n==0)
				%><td style="padding: 8px;">Absent</td><%
				else if(n==1)
				%><td style="padding: 8px;">Present</td><%
				%>
			</tr>
			<%
			}
			}
			else
			{
				%>
				<tr><td colspan="3" align="center">No data Availabe </td></tr>
				<%
			}
		   }
		catch(Exception e){ out.println(e.getMessage()); }
		finally{
			try{con.close();}
			catch(Exception e1){}
				}
				
	%>
	</table>
</body>
</html>