<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="customer.Customer"%>
<%@ page import="restaurant.Restaurant"%>
<%@ page import="demand.Demand"%>
<%@ page import="food.Food"%>
<%@ page import="customer.CustomerDB"%>
<%@ page import="restaurant.RestaurantDB"%>
<%@ page import="demand.DemandDB"%>
<%@ page import="food.FoodDB"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 웹에 사용되는 메타태그 넣음 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>배달와따 주문내역</title>
</head>
<body class="page_manage">
	<h2 style="text-align: center;">주문내역</h2>
	<hr style="margin: 0 auto; width: 500px;" />
	<%
		Date nowTime = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String foodName = request.getParameter("foodName");
		String resID = request.getParameter("resID");
		String resName = request.getParameter("resName");
		String cusID = (String) session.getAttribute("cusid");
		String foodID = request.getParameter("foodID");
		String orderTime = fm.format(nowTime);
		String paymentOption = request.getParameter("paymentOption");
		int orderCnt = Integer.parseInt((String)request.getParameter("orderCnt"));
		int foodPrice = Integer.parseInt((String)request.getParameter("foodPrice"));
		int deliveryPrice = 0;
		String orderStatus = "주문중";
		String cookStart = null;
		int dc = 0;
		String coupon = "없음";
		String deliveryOption = request.getParameter("deliveryOption");
		int amount = foodPrice * orderCnt;
		int cookMinute = Integer.parseInt(request.getParameter("cookMinute"));
		int deliveryMinute = cookMinute * 60;
	
		// 조리시작시간 정하기 난수
		Random rand = new Random();
		int t = rand.nextInt(600);	//테스트할때는 60(초) 또는 10(초)로 하시면 편해요!
		Calendar cal = Calendar.getInstance();
		cal.setTime(nowTime);
		cal.add(Calendar.SECOND, t);
		cookStart = fm.format(cal.getTime());

		String cusAddress = "";
		String cusNumber = request.getParameter("cusNumber");
		
		if (request.getParameter("dc") != "" && request.getParameter("coupon") != "") {
			dc = Integer.parseInt((String) request.getParameter("dc"));
			coupon = request.getParameter("coupon");
			amount -= dc;
		}
		if (deliveryOption.equals("배달")) {
			cusAddress = request.getParameter("cusAddress");
			deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
			amount += deliveryPrice;
		}
		
		if (cusID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href='login.html'");
			script.println("</script>");
		}
		
		if ((deliveryOption.equals("배달") && cusAddress == "") || cusNumber == "" || orderCnt == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			int result;
			DemandDB demandDB = new DemandDB();
			result = demandDB.addDemand(new Demand(resID, cusID, foodID, orderTime, paymentOption, orderCnt, amount,
			orderStatus, cookStart, dc, coupon, deliveryOption, deliveryMinute));
			
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('결제 오류.')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('결제 완료 - 주문내역페이지로 이동합니다.')");
				script.println("</script>");
	%>
	
	<fieldset>
		<div>
			<table border="0">
				<tr>
					<td style="font-weight: bold;">음식점</td>
					<td><%=resName%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">주문시간</td>
					<td><%=orderTime%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">주문처리상태</td>
					<td><%=orderStatus%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">음식</td>
					<td><%=foodName%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">주문수량</td>
					<td><%=orderCnt%>개</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">음식금액</td>
					<td><%=foodPrice * orderCnt%>원</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">사용쿠폰</td>
					<td><%=coupon%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">할인금액</td>
					<td><%=dc%>원</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">배달방법</td>
					<td><%=deliveryOption%></td>
				</tr>
				<%
				if(deliveryOption.equals("배달")) {
					deliveryMinute += 300 + rand.nextInt(300);
					demandDB.updateDeliveyMinute(deliveryMinute, cookStart);
				%>
				<tr>
					<td style="font-weight: bold;">배달시간</td>
					<td>약 <%=deliveryMinute/60%>분</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">배달비</td>
					<td><%=deliveryPrice%>원</td>
				</tr>
				<% } else { %>
					<tr>
					<td style="font-weight: bold;">요리완료시간</td>
					<td>약 <%=deliveryMinute/60%>분</td>
				</tr>
				<% } %>
				<tr>
					<td style="font-weight: bold;">결제방법</td>
					<td><%=paymentOption%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">결제금액</td>
					<td><%=amount%>원</td>
				</tr>
			</table>
		</div>
	</fieldset>
	<br/><hr style="margin: 0 auto; width: 500px;" /><br/>
	<%
			}
		}
	%>

</body>
</html>