<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.Review"%>
<%@ page import="review.ReviewDB"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>배달와따</title>
</head>
<body>
	<%
		String ResID = (String)request.getParameter("ResID");
		String CusID = (String)request.getParameter("CusID");
		String FoodID = (String)request.getParameter("FoodID");
		String OrderTime = (String)request.getParameter("OrderTime");
		
		ReviewDB reviewDB = new ReviewDB();
		int result = reviewDB.deleteReview(ResID, CusID, FoodID, OrderTime);
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰삭제가 완료되었습니다.')");
			script.println("location.href = 'review_delete.jsp'");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>