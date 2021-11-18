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
		
		String foodID = request.getParameter("foodID");
		String foodName = request.getParameter("foodName");
		String priceCheck = request.getParameter("foodPrice");
		String minCheck = request.getParameter("cookMinute");
		
		if (foodID == "" || foodName == "" || priceCheck == "" || minCheck == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			int result;
			int foodPrice = Integer.parseInt((String)request.getParameter("foodPrice"));
			int cookMinute = Integer.parseInt((String)request.getParameter("cookMinute"));
			
			FoodDB foodDB = new FoodDB();
			result = foodDB.foodSearch(resID, foodID);
			
			if (result == 1) {
				foodDB.foodUpdateManage(new Food(resID, foodID, foodName, foodPrice, cookMinute));
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('기존 음식이 수정되었습니다.')");
				script.println("history.href = 'food_manage.html'");
				script.println("</script>");
			}
			else if (result == 0){
				foodDB.foodAddManage(new Food(resID, foodID, foodName, foodPrice, cookMinute));
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('새로운 음식이 추가되었습니다.')");
				script.println("location.href = 'food_manage.html'");
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