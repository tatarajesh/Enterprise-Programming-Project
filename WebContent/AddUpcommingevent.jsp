<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
String s1=request.getParameter("newevent");
System.out.println("new-eve:"+s1);

Connection con=null;
PreparedStatement pstmt;
ResultSet rs;

	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
		if(s1 != "")
		{
		String s="insert into upcommingevents values(?)";
		pstmt=con.prepareStatement(s);
		pstmt.setString(1,s1);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="UpcommingEvents.jsp">
		<jsp:param value="" name=""/>
		</jsp:forward>
		<% 
		}
		else
		{
			%>

			<center style='color:red;font-size:20px;'><span style="background-color:white;">&nbsp;&nbsp; <b>ERROR</b> : <i>Please provide NewEvent To Add - Try Again &nbsp;&nbsp;</i></span></center>
			<jsp:include page="UpcommingEvents.jsp">
			<jsp:param value="" name=""/>
			</jsp:include>
			<%
		}
	}
	catch(Exception e){ out.println(e.getMessage()); }
	finally{
		try{con.close();}
		catch(Exception e1){}
			}
%>