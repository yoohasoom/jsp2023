<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Cookie makeCookie(String id) {
	return new Cookie("id", id);
}
%>
<html>
<head><title>내장 객체 - Response</title></head>
<body>
<%
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd"); 
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
	Cookie cookie = makeCookie(id);
	response.addCookie(cookie);
    response.sendRedirect("ResponseWelcome.jsp");
}
else {
    request.getRequestDispatcher("index.jsp?loginErr=1")
       .forward(request, response); 
}
%>
</body>
</html>