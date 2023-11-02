<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Cookie makeCookie(String id) {
	return new Cookie("id", id);
}
%>
<%
// id 쿠키 삭제
Cookie cookie = makeCookie("");
cookie.setMaxAge(0);
response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
로그아웃되었습니다.
<a href="index.jsp">🏠 home</a>
</body>
</html>