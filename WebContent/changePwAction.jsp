<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="customer.Customer" %>
<%@ page import="restaurant.Restaurant" %>
<%@ page import="customer.CustomerDB" %>
<%@ page import="restaurant.RestaurantDB" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="utility.Hashing" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>배달와따</title>
</head>
<body>
	<%
		String id = null;
	
		if (session.getAttribute("id") != null) {
			id = (String)session.getAttribute("id");
		}
		if (id != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		String usertype = request.getParameter("usertype");
		id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if (id == "" || pw == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			int result;
			
			if (usertype.equals("customer")) {
				CustomerDB customerDB = new CustomerDB();
				result = customerDB.changePW(id, pw);
			}
			else if (usertype.equals("restaurant")) {
				RestaurantDB restaurantDB = new RestaurantDB();
				result = restaurantDB.changePW(id, pw);
			}
			else {
				result = -1;
			}
			
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류 발생')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>