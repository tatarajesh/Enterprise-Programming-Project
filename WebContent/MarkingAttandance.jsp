<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
Connection con=null;
Statement stmt;
ResultSet rs;
String ename=request.getParameter("festname");
//System.out.println(ename);
int flag=0;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
String s="select * from festmembers where festname='"+ename+"' ";
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(s);
		%>
		<html>
		<link rel="stylesheet" href="Project1.css">
		<body bgcolor="skyblue">
		<center> <br><br>
		<h1>Mark Attandance @ <%=ename %></h1>
		<form action="MarkingAttandance2.jsp?festname=<%=ename%>" method="post">
		<b>Date:</b> <input type="date" id="festdate" name="festdate">
		<hr><br><br>
		<table border="3px solid gold;"  style="border-collapse:collapse;font-size:20px;">
		<tr> <th>UserName</th>
		<th>Present</th>
		<th>Absent</th> </tr>
		<% 
		while( rs.next()) 
		{
			flag=1;
			%>
			<tr>
			<td style="padding: 3px;"><%=rs.getString(1)%></td>
			<td align="center"><input type="radio" name="<%=rs.getString(1)%>" value="1" > </td>
			<td align="center"><input type="radio" name="<%=rs.getString(1)%>" value="0" > </td>
			</tr>
			<%
		}
		
		if(flag==1)
		{
		%>
		<tr> <td colspan="3" align="center"> <input type="submit" class="login" value="Submit"></td> </tr>
			</table></form> </center> </body>
			</html>
		<%
	   	}
		else
		{
		%>
			<tr> <td colspan="3" align="center"><a href="MarkAttandance.jsp" > <input type="button" class="login" value="Go Back - No Data to Submit" ></a></td> </tr>
			</table></form> </center> </body>
			</html>
		<%
		}
			
		}//try closed
	catch(Exception e){ out.println(e.getMessage()); }
	finally{
		try{con.close();}
		catch(Exception e1){}
			}
%>