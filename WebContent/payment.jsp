<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="food.Food" %>
<%@ page import="food.FoodDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
    <title>배달와따 결제</title>
</head>
<body class="page_manage">
	<%
		String resID = request.getParameter("resID");
		String resName = request.getParameter("resName");
		String foodName = request.getParameter("foodName");
		int foodPrice = Integer.parseInt((String)request.getParameter("foodPrice"));
		String foodID = request.getParameter("foodID");
		int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
		int cookMinute = Integer.parseInt(request.getParameter("cookMinute"));
	%>
	<h2 style="text-align:center;">결제</h2>
		<form method="post" action="paymentAction.jsp">
			<fieldset>
				<legend>&nbsp;&nbsp;주문 정보&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td style="font-weight:bold;">음식점</td>
								<td><%= resName %><input type="hidden" name="resID" value="<%= resID %>"><input type="hidden" name="resName" value="<%= resName %>"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">음식</td>
								<td><%= foodName %><input type="hidden" name="foodID" value="<%= foodID %>"/><input type="hidden" name="foodName" value="<%= foodName %>"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">음식가격</td>
								<td><%= foodPrice %>원<input type="hidden" name="foodPrice" value="<%= foodPrice %>"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">주문수량</td>
								<td><input type="text"  name="orderCnt" value="1" maxlength="5" ></td>
							</tr>
						</table>
					</div>
			</fieldset>

			<br/>

			<fieldset>
				<legend>&nbsp;&nbsp;배달 정보&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td><label><input type="hidden" name="deliveryPrice" value="<%= deliveryPrice %>"/><input type="hidden" name="cookMinute" value="<%=cookMinute%>"/><input type="radio" name="deliveryOption" value="배달" checked>배달</label></td>
								<td><label><input type="radio" name="deliveryOption" value="방문포장">방문포장</label></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">주소</td>
								<td><input type="text" placeholder="주소" name="cusAddress" maxlength="50"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">전화번호</td>
								<td><input type="text" placeholder="010-1234-5678" name="cusNumber" maxlength="13"></td>
							</tr>
						</table>
					</div>
			</fieldset>
		
			<br/>
		
			<fieldset>
				<legend>&nbsp;&nbsp;결제 정보&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td><label><input type="radio" name="paymentOption" value="신용카드" checked>신용카드</label></td>
								<td><label><input type="radio" name="paymentOption" value="현금">현금</label></td>
							</tr>
						</table>
					</div>
			</fieldset>
			
			<br/>
			
			<fieldset>
				<legend>&nbsp;&nbsp;할인 정보&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td style="font-weight:bold;">할인금액</td>
								<td><input type="text" name="dc"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">쿠폰</td>
								<td><input type="text" name="coupon" placeholder="쿠폰 코드 입력"/></td>
							</tr>
						</table>
					</div>
			</fieldset>
			
			<br/>
			
			<div style="text-align: center;">
				<input type="submit" value="결제"/>
			</div>
		</form>
</body>
</html>
