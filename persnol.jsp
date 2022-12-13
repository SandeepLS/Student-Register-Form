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
String father_name = request.getParameter("father_name");
String mother_name = request.getParameter("mother_name");
String mother_tounge = request.getParameter("mother_tounge");
String address = request.getParameter("address");
String state = request.getParameter("state");
String nationality = request.getParameter("nationality");
String caste = request.getParameter("caste");
String occupation = request.getParameter("occupation");
String phno = request.getParameter("phno");
String eid = request.getParameter("eid");

if(father_name!=null)
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","12345");
	PreparedStatement stmt = con.prepareStatement("insert into guardian values(?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
	
	stmt.setString(1, father_name);
	stmt.setString(2, mother_name);
	stmt.setString(3, mother_tounge);
	stmt.setString(4, address);
	stmt.setString(5, state);
	stmt.setString(6, nationality);
	stmt.setString(7, caste);
	stmt.setString(8, occupation);
	stmt.setString(9, phno);
	stmt.setString(10, eid);
	stmt.execute();
	  
	out.print("Registration Successfull");  
	 out.print("<form action='acadamic.html'><input type='submit' value='go to the Acadamic page' /></form>");
	  

	con.close();
	
}
%>
</body>
</html>