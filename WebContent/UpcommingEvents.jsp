<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<html>
<head><title>NextEvents...</title>
<link rel="stylesheet" href="Project1.css"></head>
<body bgcolor="pink">
<center><br>	
<form action="Leader2.jsp">
	<input type="submit"   class="gobackk login" value="HomePage-Organiser">
</form>

		<h1><i>Lets Go....</i></h1>
		<hr><br>
	</center>
	<b><h2 style="color:red;">List of Upcomming Events:</h2></b>
	<%
	Connection con=null;
	Statement stmt;
	ResultSet rs;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");

			String s="select * from upcommingevents";
			
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
	<form action="AddUpcommingevent.jsp" method="get">
	<input type="text" name="newevent" placeholder="Add New Event">
	<input type="submit"  value="Add">
	</form>
	
	<form action="MovetoPastEvents.jsp" method="get">
	<input type="text" name="moveevent" placeholder="Move to Past Events">
	<input type="submit"  value="Move">
	</form>
</body>
</html>