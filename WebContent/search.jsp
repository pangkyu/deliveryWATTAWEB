<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import="restaurant.Restaurant" %>
<%@ page import="restaurant.RestaurantDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*"%>
<jsp:useBean id="searchList" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/deliveryWatta.css">
	<title>배달와따</title>
</head>
<body style="margin: 0 auto; width: 1000px; background-color: white;">
	
	<%
		String search = (String)request.getParameter("search"); 
		search = new String(search.getBytes("ISO-8859-1"), "UTF-8");
	%>
	
	<h2 style="text-align:center;"><%=search%> 검색결과</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	
	<%
		RestaurantDB restaurantDB = new RestaurantDB();
		searchList = restaurantDB.getSearchList(search);
	%>
	
	<div class="res_detail_main">
		<table class="tbl">
	<%
		//검색으로 입력받은 단어가 포함된 음식점 목록 출력
		for (Restaurant r : (ArrayList<Restaurant>)searchList) {
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
	
	<br/>
	
	<!-- 동작을 담당할 자바 스크립트 가져옴 -->
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</body>
</html>