<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demand.Demand" %>
<%@ page import="demand.DemandDB" %>
<%@ page import="cancel.Cancel" %>
<%@ page import="cancel.CancelDB" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*"%>
<%@ page import="utility.Hashing" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>배달와따</title>
</head>
<body>
	<%
		CancelDB cancelDB = new CancelDB();
		String cusid = (String)session.getAttribute("cusid");
		String ordertime = request.getParameter("ordertime");
		Date nowTime = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String canceltime = fm.format(nowTime);
		String reason = request.getParameter("reason");
		
		int result = cancelDB.changeOrderStatus(cusid, ordertime);
		
		if (result == 1) {
			int result2 = cancelDB.cancelData(cusid, ordertime);
			int result3 = cancelDB.cancelData2(canceltime, reason, cusid, ordertime);
			
			if (result2 == 1 && result3 == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('주문취소 완료!')");
				script.println("location.href = 'order_manage.jsp'");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류 발생')");
				script.println("history.back()");
				script.println("</script>");
			}
			/*
			else if (result2 != 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('cancelData 오류')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result3 != 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('cancelData2 오류')");
				script.println("history.back()");
				script.println("</script>");
			}*/
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류 발생')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>