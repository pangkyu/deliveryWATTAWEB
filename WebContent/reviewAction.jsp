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
		String Review = (String)request.getParameter("Review");
		Review = new String(Review.getBytes("ISO-8859-1"), "UTF-8");
		double Grade = Integer.parseInt((String)request.getParameter("Grade"));
		
		ReviewDB reviewDB = new ReviewDB();
		int result = reviewDB.addReview(new Review(ResID, CusID, FoodID, OrderTime, null, Review, Grade));
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰작성이 완료되었습니다.')");
			script.println("location.href = 'review_manage.jsp'");
			script.println("</script>");
			
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 리뷰를 작성하셨습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>