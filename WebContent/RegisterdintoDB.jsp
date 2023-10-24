<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
try{
	String uname=request.getParameter("uname");
	String festname=request.getParameter("festname");
	//System.out.println(uname);
	//System.out.println(festname);
	
Connection con=null;
PreparedStatement pstmt;
ResultSet rs;
ResultSet rs0;
Statement stmt;

  try{ 
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
			  
    String ss="select * from festmembers where username='"+uname+"' and festname='"+festname+"'";
    stmt = con.createStatement();
	rs0 = stmt.executeQuery(ss);
	if( rs0.next())
	{ 
		%>
		<center style='color:Red;font-size:20px;'><span style="background-color:silver;">&nbsp;&nbsp;<B>ERROR</B> : Already Registered ! &nbsp;&nbsp;</i></span></center>		  
		<jsp:include page="MemberRegister.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
		<%
	}
	else
	{
		String s="insert into festmembers values(?,?)";
	    pstmt=con.prepareStatement(s);
		pstmt.setString(1,uname);
		pstmt.setString(2,festname);
		pstmt.executeUpdate();
				  
				  %>
		<center style='color:Green;font-size:20px;'><span style="background-color:silver;">&nbsp;&nbsp;Successfully Registered... &nbsp;&nbsp;</i></span></center>		  
		<jsp:include page="MemberRegister.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
				  <%
	}
  }catch(Exception e){ out.println(e); }
  
}//try closed
catch(Exception e)
{ 
	out.println(e);
}
%>