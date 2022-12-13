<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String lname = request.getParameter("lname");
String dob = request.getParameter("dob");
String address = request.getParameter("address");
String phno = request.getParameter("phno");
String eid = request.getParameter("eid");

if(name!=null)
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","12345");
	PreparedStatement stmt = con.prepareStatement("insert into pinfoo values(?, ?, ?, ?, ?, ?)");
	
	stmt.setString(1, name);
	stmt.setString(2, lname);
	stmt.setString(3, dob);
	stmt.setString(4, address);
	stmt.setString(5, phno);
	stmt.setString(6, eid);
	stmt.execute();
	
	out.print("Registration Successfull");
	 out.print("<form action='persnol.html'><input type='submit' value='go to the Persnol page' /></form>");
	con.close();
}
%>
</body>
</html>