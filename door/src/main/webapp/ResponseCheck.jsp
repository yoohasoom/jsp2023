<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public Cookie getCookieByName(Cookie[] cookies, String cookieName) {
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals(cookieName)) {
				return c;
			}
		}
	}
	return null;
}
%>
<%
Cookie[] cookies = request.getCookies();

Cookie cookie = getCookieByName(cookies, "id");

if (cookie == null) {
	response.sendRedirect("index.jsp");
}
%>