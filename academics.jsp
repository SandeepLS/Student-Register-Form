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
String schoolname = request.getParameter("schoolname");
String sboard = request.getParameter("sboard");
String spassy = request.getParameter("spassyear");
String sslcm = request.getParameter("sslcm");
String spercentage = request.getParameter("spercentage");
String cname = request.getParameter("collegename");
String cboard = request.getParameter("cboard");
String cpassy = request.getParameter("cpassyear");
String cstream = request.getParameter("cstream");
String pucm = request.getParameter("pucm");
String cpercentage =request.getParameter("cpercentage");
String ugname = request.getParameter("ugname");
String ugboard = request.getParameter("ugboard");
String ugpassy = request.getParameter("ugpassyear");
String ugstream = request.getParameter("ugstream");
String ugm = request.getParameter("ugm");
String ugpercentage =request.getParameter("ugpercentage");

if(schoolname!=null)
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","12345");
	PreparedStatement stmt = con.prepareStatement("insert into academics values(?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)");
	
	stmt.setString(1, schoolname);
	stmt.setString(2, sboard);
	stmt.setString(3, spassy);
	stmt.setString(4, sslcm);
	stmt.setString(5, spercentage);
	stmt.setString(6, cname);
	stmt.setString(7, cboard);
	stmt.setString(8, cpassy);
	stmt.setString(9, cstream);
	stmt.setString(10, pucm);
	stmt.setString(11, cpercentage);
	stmt.setString(12, ugname);
	stmt.setString(13, ugboard);
	stmt.setString(14, ugpassy);
	stmt.setString(15, ugstream);
	stmt.setString(16, ugm);
	stmt.setString(17, ugpercentage);
	
	stmt.execute();
	
	
	out.print("Your Registration Is Completed Successfull");
	 out.print("<form action='fst.html'><input type='submit' value='go to the login page' /></form>");
	con.close();
}
%>
</body>
</html>