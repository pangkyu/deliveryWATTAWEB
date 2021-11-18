<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demand.Demand"%>
<%@ page import="demand.DemandDB"%>
<%@ page import="review.Review"%>
<%@ page import="review.ReviewDB"%>
<%@ page import="food.Food"%>
<%@ page import="food.FoodDB" %>
<%@ page import="restaurant.Restaurant" %>
<%@ page import="restaurant.RestaurantDB" import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="demandList" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>배달와따 리뷰쓰기</title>
</head>
<body class="page_manage">
	<h2 style="text-align:center;">리뷰쓰기</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	<%
		String cusID = (String)session.getAttribute("cusid");
		DemandDB demandDB = new DemandDB();
		demandList = demandDB.getDemandList(cusID);
		FoodDB foodDB = new FoodDB();

        for (Demand d : (ArrayList<Demand>)demandList) {
	%>
        <form method="post" action="reviewAction.jsp">
        	<table style="margin: 0 auto;">
				<tr>
					<td style="font-weight:bold;">음식점</td>
					<td><input type="text" name="ResID" value="<%=d.getResID() %>" style="display:none;"><%= d.getResName() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">아이디</td>
					<td><input type="text" name="CusID" value="<%=d.getCusID() %>" style="display:none;"><%= d.getCusID() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">음식</td>
					<td><input type="text" name="FoodID" value="<%=d.getFoodID() %>" style="display:none;"><%=d.getFoodName() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">주문시간</td>
					<td><input type="text" name="OrderTime" value="<%=d.getOrderTime() %>" style="display:none;"><%= d.getOrderTime() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">평점(1-5)</td>
					<td><input type="range" name="Grade" min="1" max="5" value="3"/></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">리뷰 내용</td>
					<td><textarea name="Review" cols="50" rows="3" placeholder="리뷰 작성란"></textarea></td>
				</tr>
			</table>
			<div style="text-align: center;"><input type="submit" value="작성"/></div><br/><br/>
		</form>
	<% } %>
</body>
</html>