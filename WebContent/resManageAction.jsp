<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="customer.Customer"%>
<%@ page import="restaurant.Restaurant"%>
<%@ page import="food.Food"%>
<%@ page import="customer.CustomerDB"%>
<%@ page import="restaurant.RestaurantDB"%>
<%@ page import="food.FoodDB"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>배달와따</title>
</head>
<body>
	<% 
		String resID = null;
		
		if (session.getAttribute("resid") != null) {
			resID = (String)session.getAttribute("resid");
		}
		if (resID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자 로그인을 해주세요.')");
			script.println("location.href='login.html'");
			script.println("</script>");
		}
		
		String resNumber = request.getParameter("resNumber");
		String resAddress = request.getParameter("resAddress");
		String resCategory = request.getParameter("resCategory");
		String checkPrice = request.getParameter("deliveryPrice");
		
		
		if (resNumber == "" || resAddress == "" || resCategory == "" || checkPrice == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			int result;
			int deliveryPrice = Integer.parseInt((String)request.getParameter("deliveryPrice"));
			
			RestaurantDB restaurantDB = new RestaurantDB();
			result = restaurantDB.resManage(resID, resNumber, resAddress, resCategory, deliveryPrice);
			if (result == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('기존 음식점이 수정되었습니다.')");
				script.println("history.href = 'res_manage.html'");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류 발생 - ???')");
				script.println("history.back()");
				script.println("</script>");
			}
				
		}
	%>
</body>
</html>
