<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import="restaurant.Restaurant" %>
<%@ page import="restaurant.RestaurantDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*"%>
<jsp:useBean id="categoryList" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/deliveryWatta.css">
	<title>배달와따 음식점 목록</title>
</head>
<body>
	<%
		String category = (String)request.getParameter("category");
		category = new String(category.getBytes("ISO-8859-1"), "UTF-8"); // 한글이 깨져 추가함.
	%>
	
	<h2 style="text-align:center;"><%=category%> 음식점</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	<%
		RestaurantDB restaurantDB = new RestaurantDB();
		categoryList = restaurantDB.getCategoryList(category);
	%>
	<div class="res_detail_main">
		<table class="tbl">
	<%
		//선택된 카테고리가 포함된 음식점 목록 출력
		for (Restaurant r : (ArrayList<Restaurant>)categoryList) {
	%>
				<tr>
					<td class="res_list_td"><%=r.getResName()%></td>
					<form method="post" action="res_detail.jsp">
						<td>
							<input type="hidden" name="resName" value="<%= r.getResName() %>"/>
							<input type="hidden" name="resID" value="<%= r.getResID() %>"/>
							<input type="hidden" name="deliveryPrice" value="<%= r.getDeliveryPrice() %>"/>
							<input type="image" src="img/gotores.jpg" width="100px" height="60px" title="음식점 바로가기" style="margin: 10px;"/>
						</td>
					</form>
				</tr>
	<%
		}
	%>
		</table>
	</div>
</body>
</html>
