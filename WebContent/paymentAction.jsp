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
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- ������ ���� ���Ǵ� ��Ÿ�±� ���� -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
	<title>��޿͵� �ֹ�����</title>
</head>
<body class="page_manage">
	<h2 style="text-align: center;">�ֹ�����</h2>
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
		String orderStatus = "�ֹ���";
		String cookStart = null;
		int dc = 0;
		String coupon = "����";
		String deliveryOption = request.getParameter("deliveryOption");
		int amount = foodPrice * orderCnt;
		int cookMinute = Integer.parseInt(request.getParameter("cookMinute"));
		int deliveryMinute = cookMinute * 60;
	
		// �������۽ð� ���ϱ� ����
		Random rand = new Random();
		int t = rand.nextInt(600);	//�׽�Ʈ�Ҷ��� 60(��) �Ǵ� 10(��)�� �Ͻø� ���ؿ�!
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
		if (deliveryOption.equals("���")) {
			cusAddress = request.getParameter("cusAddress");
			deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
			amount += deliveryPrice;
		}
		
		if (cusID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� ���ּ���.')");
			script.println("location.href='login.html'");
			script.println("</script>");
		}
		
		if ((deliveryOption.equals("���") && cusAddress == "") || cusNumber == "" || orderCnt == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� �׸��� �ֽ��ϴ�.')");
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
				script.println("alert('���� ����.')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���� �Ϸ� - �ֹ������������� �̵��մϴ�.')");
				script.println("</script>");
	%>
	
	<fieldset>
		<div>
			<table border="0">
				<tr>
					<td style="font-weight: bold;">������</td>
					<td><%=resName%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�ֹ��ð�</td>
					<td><%=orderTime%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�ֹ�ó������</td>
					<td><%=orderStatus%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">����</td>
					<td><%=foodName%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�ֹ�����</td>
					<td><%=orderCnt%>��</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">���ıݾ�</td>
					<td><%=foodPrice * orderCnt%>��</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�������</td>
					<td><%=coupon%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">���αݾ�</td>
					<td><%=dc%>��</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">��޹��</td>
					<td><%=deliveryOption%></td>
				</tr>
				<%
				if(deliveryOption.equals("���")) {
					deliveryMinute += 300 + rand.nextInt(300);
					demandDB.updateDeliveyMinute(deliveryMinute, cookStart);
				%>
				<tr>
					<td style="font-weight: bold;">��޽ð�</td>
					<td>�� <%=deliveryMinute/60%>��</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">��޺�</td>
					<td><%=deliveryPrice%>��</td>
				</tr>
				<% } else { %>
					<tr>
					<td style="font-weight: bold;">�丮�Ϸ�ð�</td>
					<td>�� <%=deliveryMinute/60%>��</td>
				</tr>
				<% } %>
				<tr>
					<td style="font-weight: bold;">�������</td>
					<td><%=paymentOption%></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�����ݾ�</td>
					<td><%=amount%>��</td>
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