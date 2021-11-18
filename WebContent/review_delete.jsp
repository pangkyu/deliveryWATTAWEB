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
<jsp:useBean id="reviewList" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>배달와따 리뷰삭제</title>
</head>
<body class="page_manage">
	<h2 style="text-align:center;">리뷰삭제</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	<%
		String cusID = (String)session.getAttribute("cusid");
		ReviewDB reviewDB = new ReviewDB();
		reviewList = reviewDB.getReviewList(cusID);

        for (Review r : (ArrayList<Review>)reviewList) {
	%>
        <form method="post" action="reviewDeleteAction.jsp">
        	<table style="margin: 0 auto;">
				<tr>
					<td style="font-weight:bold;">음식점</td>
					<td><input type="text" name="ResID" value="<%=r.getResID() %>" style="display:none;"><%= r.getResID() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">아이디</td>
					<td><input type="text" name="CusID" value="<%=r.getCusID() %>" style="display:none;"><%= r.getCusID() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">음식</td>
					<td><input type="text" name="FoodID" value="<%=r.getFoodID() %>" style="display:none;"><%=r.getFoodID() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">주문시간</td>
					<td><input type="text" name="OrderTime" value="<%=r.getOrderTime() %>" style="display:none;"><%= r.getOrderTime() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">리뷰작성시간</td>
					<td><%= r.getOrderTime() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">평점</td>
					<td><%= r.getGrade() %></td>
				</tr>
				<tr>
					<td style="font-weight:bold;">리뷰 내용</td>
					<td><%= r.getReview() %></td>
				</tr>
			</table><br/>
			<div style="text-align: center;"><input type="submit" value="삭제"/></div>
			<br/><br/>
		</form>
	<% } %>		
</body>
</html>