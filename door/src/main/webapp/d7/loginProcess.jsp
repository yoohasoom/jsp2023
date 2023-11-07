<%@page import="java.sql.PreparedStatement"%>
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

String sql = "SELECT * FROM MEMBER WHERE id=? AND pass=?";
PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
pstmt.setString(1, username);
pstmt.setString(2, password);
ResultSet rs = pstmt.executeQuery();

boolean isLogin = false;
while(rs.next()){
	String id = rs.getString(1);
	String pass = rs.getString(2);
	String name = rs.getString(3);
	java.sql.Date regidate = rs.getDate("regidate");
	
	out.println(String.format("%s %s %s %s", id, pass, name, regidate) + "<br>");
	isLogin = true;
	session.setAttribute("id", id);
}
if(!isLogin){
	session.removeAttribute("id");
}
%><a href="login.jsp">로그인</a>
</body>
</html>