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
String uname = request.getParameter("uname");
String password = request.getParameter("password");
String email = request.getParameter("email");

if(uname!=null)
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","12345");
	PreparedStatement stmt = con.prepareStatement("insert into register values(?, ?, ?)");
	
	stmt.setString(1, uname);
	stmt.setString(2, password);
	stmt.setString(3, email);
	stmt.execute();
	
	out.print("Registration Successfull");  
	  out.print("<form action='frist.jsp'><input type='submit' value='go to the login page' /></form>");

	con.close();
}
%>
</body>
</html>