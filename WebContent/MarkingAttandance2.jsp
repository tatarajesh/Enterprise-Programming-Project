<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
Connection con=null;
Statement stmt;
ResultSet rs;

String ename=request.getParameter("festname");
//System.out.println(ename);

String festdate=request.getParameter("festdate");
//System.out.println("festdat="+festdate);

PreparedStatement pstmt;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","3377");
		
		String s1="select * from festmembers where festname='"+ename+"' ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(s1);
		if(festdate != "")
		{
		while(rs.next())
		{
		String s2="insert into attandance values(?,?,?,?) ";		
		String s=request.getParameter(rs.getString(1));
		pstmt=con.prepareStatement(s2);
		pstmt.setString(1,ename);
		pstmt.setString(2,festdate);
		pstmt.setString(3,rs.getString(1));
		pstmt.setString(4,s);
		pstmt.executeUpdate();
		}
		%>
		<center style='color:Green;font-size:23px;'><span style="background-color:white;">&nbsp;&nbsp; Successfully Marked Attandance for '<i><u><%=ename %></u></i>' &nbsp;&nbsp;</i></span></center>
		<center><h2></h2></center>
		<jsp:include page="MarkAttandance.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
		<%
		}
		else
		{
			%>
			<center><span style="color:red;background-color:white;font-size:20px;">&nbsp;<b>ERROR</b> : Please input 'FEST DATE' &nbsp;</Span></center>
			
			<jsp:include page="MarkingAttandance.jsp">
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