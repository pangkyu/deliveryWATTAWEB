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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String number = request.getParameter("number");
		
		if (id == "" || pw == "" || name == "" || address == "" || number == "") {
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
				result = customerDB.join(new Customer(id,pw,name,address,number));
			}
			
			else {
				RestaurantDB restaurantDB = new RestaurantDB();
				result = restaurantDB.join(new Restaurant(id,pw,name,address,number));
			}
			
			if (result == -1) { //이미 있는 아이디를 입력했을 때 데이터베이스 오류가 발생함!
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류 발생 - 이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입을 환영합니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>