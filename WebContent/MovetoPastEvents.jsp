<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
try{
	String ename=request.getParameter("moveevent");
	System.out.println(ename);
Connection con=null;
PreparedStatement pstmt;
PreparedStatement pstmt2;
PreparedStatement pstmt3;
ResultSet rs;
  try{ 
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
			  
    String s="select * from upcommingevents where eventname='"+ename+"'";
     pstmt=con.prepareStatement(s);
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
		String s2="insert into pastevents values(?)";
		pstmt2=con.prepareStatement(s2);
		pstmt2.setString(1,ename);
		pstmt2.executeUpdate();
		
		String s3="delete from upcommingevents where eventname='"+ename+"' ";
		pstmt3=con.prepareStatement(s3);
		pstmt3.executeUpdate();
	
		%>
		
		<center style='color:green;font-size:20px;'><span style="background-color:white;">&nbsp;&nbsp; Moved Successfully... &nbsp;&nbsp;</i></span></center>
		<jsp:include page="UpcommingEvents.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
		<%
	}
	else
	{
		%>
		<center style='color:red;font-size:20px;'><span style="background-color:white;">&nbsp;&nbsp; <b>ERROR</b> : <i>Please provide valid EventName & Try Again &nbsp;&nbsp;</i></span></center>
		<jsp:include page="UpcommingEvents.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
		<%
	}
  }
  catch(Exception e){  }
  }
  catch(Exception e1)
  { //out.println(e);
  }

%>