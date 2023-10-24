<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
String s1=request.getParameter("uname");
String s2=request.getParameter("pw");

//System.out.println("P-U_name:"+s1);


Connection con=null;
Statement stmt;
ResultSet rs;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");

		String s="select * from members where email='"+s1+"' and pw='"+s2+"' ";
		//System.out.println("Email="+s1);
		//System.out.println("pw="+s2);
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(s);
		
		out.println("<body><center>");
		out.println("<h2>");
		if( rs.next())
		{
			String uname=request.getParameter("uname");
			Cookie c2= new Cookie("c1",uname);
			response.addCookie(c2);
			%>
			<jsp:forward page="MemberValidation2.jsp">
			<jsp:param name="pname" value="<%=uname%>"/> 
			</jsp:forward>
			<%
		}
else
{
	out.println("<h2>Invalid Credentials<i> - Please Try Login Again</i></h2>");	
	%>
	<jsp:include page="MemberLogin_Signup.jsp">
	<jsp:param name="" value=""/> 
	</jsp:include>
	<% 
 }

	out.println("</h2></center></body>");
	
	  }
	catch(Exception e){ out.println(e.getMessage()); }
%>
