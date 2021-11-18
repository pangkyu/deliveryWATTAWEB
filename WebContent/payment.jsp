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
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- ������ ���� ���Ǵ� ��Ÿ�±� ���� -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/deliveryWatta.css">
    <title>��޿͵� ����</title>
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
	<h2 style="text-align:center;">����</h2>
		<form method="post" action="paymentAction.jsp">
			<fieldset>
				<legend>&nbsp;&nbsp;�ֹ� ����&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td style="font-weight:bold;">������</td>
								<td><%= resName %><input type="hidden" name="resID" value="<%= resID %>"><input type="hidden" name="resName" value="<%= resName %>"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">����</td>
								<td><%= foodName %><input type="hidden" name="foodID" value="<%= foodID %>"/><input type="hidden" name="foodName" value="<%= foodName %>"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">���İ���</td>
								<td><%= foodPrice %>��<input type="hidden" name="foodPrice" value="<%= foodPrice %>"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">�ֹ�����</td>
								<td><input type="text"  name="orderCnt" value="1" maxlength="5" ></td>
							</tr>
						</table>
					</div>
			</fieldset>

			<br/>

			<fieldset>
				<legend>&nbsp;&nbsp;��� ����&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td><label><input type="hidden" name="deliveryPrice" value="<%= deliveryPrice %>"/><input type="hidden" name="cookMinute" value="<%=cookMinute%>"/><input type="radio" name="deliveryOption" value="���" checked>���</label></td>
								<td><label><input type="radio" name="deliveryOption" value="�湮����">�湮����</label></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">�ּ�</td>
								<td><input type="text" placeholder="�ּ�" name="cusAddress" maxlength="50"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">��ȭ��ȣ</td>
								<td><input type="text" placeholder="010-1234-5678" name="cusNumber" maxlength="13"></td>
							</tr>
						</table>
					</div>
			</fieldset>
		
			<br/>
		
			<fieldset>
				<legend>&nbsp;&nbsp;���� ����&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td><label><input type="radio" name="paymentOption" value="�ſ�ī��" checked>�ſ�ī��</label></td>
								<td><label><input type="radio" name="paymentOption" value="����">����</label></td>
							</tr>
						</table>
					</div>
			</fieldset>
			
			<br/>
			
			<fieldset>
				<legend>&nbsp;&nbsp;���� ����&nbsp;&nbsp;</legend>
					<div>
						<table border="0">
							<tr>
								<td style="font-weight:bold;">���αݾ�</td>
								<td><input type="text" name="dc"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">����</td>
								<td><input type="text" name="coupon" placeholder="���� �ڵ� �Է�"/></td>
							</tr>
						</table>
					</div>
			</fieldset>
			
			<br/>
			
			<div style="text-align: center;">
				<input type="submit" value="����"/>
			</div>
		</form>
</body>
</html>
