<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="customer.CustomerDB" %>
<%@ page import="restaurant.RestaurantDB" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>배달와따</title>
</head>
<body>
	<%
		session.invalidate(); //세션 끊기게 (로그아웃)
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>