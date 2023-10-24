<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<html>
<head>
<title>Choose:</title>
<link rel="stylesheet" href="Project1.css"></head>
<br><br>
<body bgcolor="silver">
<center>
<form action="Leader2.jsp">
	<input type="submit"   class="gobackk login" value="HomePage - Organiser">
</form>
<br><br><hr>
<h1 style="color:yellow;"><i>Choose an Event:</i></h1></center>
</body>
</html>
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
			<br>
			<center><table border="5"  style="border-collapse:collapse; font-size:25px; font-family:Comic Sans MS; border:3px redge brown">
			<% 
			while( rs.next()) 
			{
				%>
				<tr>
				<td style="padding: 8px;"><%=rs.getString(1)%></td>
				<td style="padding: 8px;"><a href= "MarkingAttandance.jsp?festname=<%=rs.getString(1)%>">MarkAttandance</a></td>
				</tr>
				<%
			}
			%>
			</table></center>
			<%
			
		   }
		catch(Exception e){ out.println(e.getMessage()); }
		finally{
			try{con.close();}
			catch(Exception e1){}
				}
%>