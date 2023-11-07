<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="door.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 처리</title>
</head>
<body>
<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
%>
username: <%= username %>
<br>
	password: <%= password %>
	<%
	JDBConnect jdbc = new JDBConnect();

Statement stmt = jdbc.con.createStatement();
String sql = "SELECT * FROM MEMBER WHERE id='" + username + "' AND pass='" + password + "'";

ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	String id = rs.getString(1);
	String pass = rs.getString(2);
	String name = rs.getString(3);
	java.sql.Date regidate = rs.getDate("regidate");
	
	out.println(String.format("%s %s %s %s", id, pass, name, regidate) + "<br>");
}
%>
</body>
</html>