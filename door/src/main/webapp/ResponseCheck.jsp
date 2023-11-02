<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String value = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String item = c.getName() + ": " + c.getValue();
		if (c.getName().equals("id")) {
	value = c.getValue();
		}
	}
}
if (value == null) {
	response.sendRedirect("index.jsp");
}
%>