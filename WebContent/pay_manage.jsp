<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demand.Demand" %>
<%@ page import="demand.DemandDB" %>
<%@ page import="java.io.PrintWriter" import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="payments" scope="request" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>배달와따 결제관리</title>
</head>
<body class="page_manage">
	<h2 style="text-align:center;">결제내역</h2>
	<hr style="margin:0 auto; width: 500px;"/>
	<% 
		Date date = new Date();
		SimpleDateFormat fmDateToString = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTime = fmDateToString.format(date);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat fmStringToDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String id = (String)session.getAttribute("cusid"); 
		DemandDB db = new DemandDB();
		payments = db.getPayList(id);
			
		for (Demand d : (ArrayList<Demand>)payments) {
			
			Date deliveryDate = fmStringToDate.parse(d.getCookStart());
			cal.setTime(deliveryDate);
			cal.add(Calendar.SECOND, d.getDeliveryMinute());
			String deliveryTime = fmDateToString.format(cal.getTime());
	%>
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
					<% 
					if (d.getDc() != 0) {
					%>
					<tr>
						<td style="font-weight:bold;">할인금액</td>
						<td><%= d.getDc() %>원</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">사용쿠폰</td>
						<td><%= d.getCoupon() %></td>
					</tr>
					<% } %>
					<tr>
						<td style="font-weight:bold;">결제방법</td>
						<td><%= d.getPaymentOption() %></td>
					</tr>
					<%
					if (nowTime.compareTo(d.getCookStart()) > 0 && !d.getOrderStatus().equals("주문취소")) {
					%>
					<tr>
						<td style="font-weight:bold;">조리시작시간</td>
						<td><%= d.getCookStart() %></td>
					</tr>
					<% 
					db.updateOrderStatus("조리중", d.getCookStart());
					} 
					if (nowTime.compareTo(deliveryTime) > 0) {
						db.updateOrderStatus("완료", d.getCookStart());
					}
					%>
					<tr>
						<td style="font-weight:bold;">주문처리상태</td>
						<td><%= d.getOrderStatus() %></td>
					</tr>
					<tr>
						<td style="font-weight:bold;">배달방법</td>
						<td><%= d.getDeliveryOption() %></td>
					</tr>
					<%
					if(d.getDeliveryOption().equals("배달")) {
					%>
					<tr>
						<td style="font-weight:bold;">배달시간</td>
						<td><%= d.getDeliveryMinute() / 60 %>분</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">예정배달시간</td>
						<td><%= deliveryTime %></td>
					</tr>
					<% }
					else if(d.getDeliveryOption().equals("방문포장")) {
					%>
					<tr>
						<td style="font-weight:bold;">요리완료시간</td>
						<td><%= d.getDeliveryMinute() / 60 %>분</td>
					</tr>
					<tr>
						<td style="font-weight:bold;">예정요리완료시간</td>
						<td><%= deliveryTime %></td>
					</tr>
					<% } %>
				</table>
			</div>
		</fieldset>
		<br/><hr style="margin:0 auto; width: 500px;"/><br/>
	<% } %>
</body>
</html>