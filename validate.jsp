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

if(uname!=null && password!=null)
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","12345");
	PreparedStatement stmt = con.prepareStatement("select * from register where uname=? and password=?");
	
	stmt.setString(1, uname);
	stmt.setString(2, password);
	
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("index.html");
	}
	else
	{
		request.setAttribute("status","failed");
		response.sendRedirect("first.html");
		out.print("Wrong password");
		
	}
	
}
else
{
	request.setAttribute("status","failed");
	response.sendRedirect("first.html");
	out.print("Wrong password");

}
%>
</body>
</html>