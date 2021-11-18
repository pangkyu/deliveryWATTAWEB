<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demand.Demand" %>
<%@ page import="demand.DemandDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="orders" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>배달와따 주문관리</title>
</head>
<body class="page_manage">
	<h2 style="text-align:center;">주문 취소</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	<%
		String id = (String)session.getAttribute("cusid"); 
		DemandDB db = new DemandDB();
		orders = db.getCancellableList(id);
		
		for (Demand d : (ArrayList<Demand>)orders) {
	%>
	<form method="post" action="cancelAction.jsp">
		<fieldset>
			<div>
				<table border="0">
					<tr>
						<td style="font-weight:bold;">음식점</td>
						<td><%= d.getResID() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">음식</td>
						<td><%= d.getFoodID() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">주문시간</td>
						<td><%= d.getOrderTime() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">주문수량</td>
						<td><%= d.getOrderCnt() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">주문금액</td>
						<td><%= d.getAmount() %>원</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">할인금액</td>
						<td><%= d.getDc() %>원</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">사용쿠폰</td>
						<td><%= d.getCoupon() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">결제방법</td>
						<td><%= d.getPaymentOption() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">주문처리상태</td>
						<td><%= d.getOrderStatus() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">배달방법</td>
						<td><%= d.getDeliveryOption() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">배달시간</td>
						<td><%= d.getDeliveryMinute() %>분</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">취소 사유</td>
						<td><textarea name="reason" cols="50" rows="3" placeholder="취소 사유 작성란"></textarea></td>
					</tr>
				</table>
				<input type="text" name="ordertime" value="<%=d.getOrderTime()%>" style="display:none;"/>
				<br/><div style="text-align:center;"><input type="submit" value="주문취소"/></div>
			</div>
		</fieldset>
	</form>
	<hr style="margin:0 auto; width: 500px;"/><br/>
	<% } %>
</body>
</html>