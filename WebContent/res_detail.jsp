<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="food.Food" %>
<%@ page import="food.FoodDB" %>
<%@ page import="review.Review" %>
<%@ page import="review.ReviewDB" %>
<%@ page import="restaurant.Restaurant" %>
<%@ page import="restaurant.RestaurantDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*" %>
<jsp:useBean id="foodList" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id="reviewList" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id="resDetail" scope="request" class="java.util.ArrayList"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<link rel="stylesheet" href="css/bootstrap.css">
    <title>배달와따 음식점 상세페이지</title>
</head>
<body class="res_detail">
	<% 
		String resID = (String)request.getParameter("resID");
		String resName = (String)request.getParameter("resName");
		int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
		FoodDB foodDB = new FoodDB();
		foodList = foodDB.getFoodList(resID);
		ReviewDB reviewDB = new ReviewDB();
		reviewList = reviewDB.getResReviewList(resID);
		RestaurantDB restaurantDB = new RestaurantDB();
		resDetail = restaurantDB.resDetail(resID);
	
		double sumGrade = 0.0;
		double gradeAvg = 0.0;
		String star = "";
		int reviewCnt = 0;
	
		for (Review r : (ArrayList<Review>)reviewList) {
			sumGrade += r.getGrade();
			reviewCnt++;
		}
		gradeAvg = sumGrade / reviewCnt;
	
		for (int i = 0; i < (int)gradeAvg; i++) {
			star += "★";
		}
		for (int i = 0; i < (5-(int)gradeAvg); i++) {
			star += "☆";
		}
	%>
	
	<h2 style="text-align:center;"><%= resName %></h2>
	<hr style="margin:0 auto; width: 500px;"/>				
	
	<div class="res_detail_main">
   		<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    	<label for="tab1">메뉴</label>

    	<input id="tab2" type="radio" name="tabs">
    	<label for="tab2">리뷰</label>

    	<input id="tab3" type="radio" name="tabs">
    	<label for="tab3">정보</label>

    	<section id="content1">
		<%
			for (Food f : (ArrayList<Food>)foodList) {
		%>
        	<table class="tbl">
				<tr>
					<td class="res_list_td"><%= f.getFoodName() %><br/><%= f.getFoodPrice() %>원</td>
					<form method="post" action="payment.jsp">
					<td>
						<input type="text" name="foodName" value="<%= f.getFoodName() %>" style="display:none;"/>
						<input type="text" name="resID" value="<%= resID %>" style="display:none;"/>
						<input type="text" name="resName" value="<%= resName %>" style="display:none;"/>
						<input type="text" name="foodPrice" value="<%= f.getFoodPrice() %>" style="display:none;"/>
						<input type="text" name="foodID" value="<%= f.getFoodID() %>" style="display:none;"/>
						<input type="text" name="deliveryPrice" value="<%= deliveryPrice %>" style="display:none;"/>
						<input type="text" name="cookMinute" value="<%= f.getCookMinute() %>" style="display:none;"/>
						<input type="image" src="img/order.jpg" width="100px" height="52px" style="margin: 10px;"/>
					</td>
					</form>
				</tr>
			</table>
		<% 	
			}
		%>
    	</section>

    	<section id="content2">
    	<%
    		if (reviewCnt != 0) {
    	%>
        	<p><h1><%= gradeAvg %><br><%= star %></h1><br>리뷰 <%= reviewCnt %></p><hr/>
        <%
        	for (Review r : (ArrayList<Review>)reviewList) {
        %>
        	<table class="tbl">
        		<tr>
        			<td class="res_list_td">
	        			<strong><%= r.getCusID() %>님</strong><br/>
	        			<small><%= r.getReviewTime() %></small><br/><br/>
	        			<%= r.getFoodID() %>		<%= r.getGrade()%><br/>
	        			<%= r.getReview() %>
        			</td>
        		</tr>
        	</table>
        <% 	
        	}
    	} else {
        %>
           <p><h1>리뷰가 없습니다</h1><br>리뷰 <%= reviewCnt %></p><hr/>
        <%
    		}
        %>
        
    	</section>

    	<section id="content3">
    	<%
    		for (Restaurant r : (ArrayList<Restaurant>)resDetail) {
    	%>
        	<p><h3 style="text-align: left;">업체정보</h3><hr/>
				<table border="0.1">
					<tr>
						<td class="res_detail_td">전화번호</td>
						<td style="text-align: left;"><%= r.getResNumber() %></td>
					</tr>
					<tr>
						<td class="res_detail_td">주소</td>
						<td style="text-align: left;"><%= r.getResAddress() %></td>
					</tr>
				</table>
       		</p>
       		
        	<p><h3 style="text-align: left;">결제정보</h3><hr/>
				<table border="0.1">
					<tr>
						<td class="res_detail_td">배달비</td>
						<td style="text-align: left;"><%= r.getDeliveryPrice() %>원</td>
					</tr>
					<tr>
						<td class="res_detail_td">결제방법</td>
						<td style="text-align: left;">신용카드, 현금</td>
					</tr>
				</table>
       		</p>
       	<%
       		}
       	%>
    	</section>
	</div>
</body>
</html>
