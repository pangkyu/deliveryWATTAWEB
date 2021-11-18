<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
		String id = null;
		int n=-1;
		if (session.getAttribute("cusid") != null) {
			id = (String)session.getAttribute("cusid");
			n=1;
		}
		else {
			id = (String)session.getAttribute("resid");
			n=2;
		}
	%>
	
	
	<!-- header -->
	<header>
		<marquee direction="right" scrollamount="10">배달와따! 지금 결제하면 10% 할인!</marquee>
		<%
			if (id != null) { //세션에 로그인되어 있는 상태
		%>
		<ul class="login_join">
			<li class="right"><a href="logoutAction.jsp">logout</a></li>
			<%-- 고객은 'cus_page.html'연결, 음식점은 'res_page.html'연결되게 --%>
			<%
				if (n==1) {
					%>
						<li class="right"><a href="cus_page.html" target="display_area">마이페이지</a></li>
					<%
				}
				else if (n==2) {
			%>
						<li class="right"><a href="res_page.html" target="display_area">음식점페이지</a></li>
			<% } %>
		</ul>
		<%
			} else {
		%>
		<ul class="login_join">
			<li class="right"><a href="login.html">login</a></li>
			<li class="right"><a href="join.html">join</a></li>
		</ul>
		<%		
			}
		%>
		
		<br/>
		
		<div class="header_logo">
			<a href="main.jsp"><img class="deliveryWatta_logo" src="${pageContext.request.contextPath}/img/deliveryWattaLogo.jpg"></a>
		</div>
	</header>
	
	
	
	<!-- nav -->
	<nav class="nav">
		<ul style="margin-top:27px;">
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="korean" style="display:none;"><input type="text" name="category" value="한식" style="display:none;"><li style="color:#363636; margin-left: 0px;">한식</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="western" style="display:none;"><input type="text" name="category" value="양식" style="display:none;"><li style="color:#363636; margin-left: 40px;">양식</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="chinese" style="display:none;"><input type="text" name="category" value="중식" style="display:none;"><li style="color:#363636; margin-left: 40px;">중식</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="japanese" style="display:none;"><input type="text" name="category" value="일식" style="display:none;"><li style="color:#363636; margin-left: 40px;">일식</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="chicken" style="display:none;"><input type="text" name="category" value="치킨" style="display:none;"><li style="color:#363636; margin-left: 40px;">치킨</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="jokbal" style="display:none;"><input type="text" name="category" value="족발" style="display:none;"><li style="color:#363636; margin-left: 40px;">족발</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="bunsik" style="display:none;"><input type="text" name="category" value="분식" style="display:none;"><li style="color:#363636; margin-left: 40px;">분식</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="franchise" style="display:none;"><input type="text" name="category" value="프랜차이즈" style="display:none;"><li style="color:#363636; margin-left: 40px;">프랜차이즈</li></label>
			</form>
			<form method="post" action="res_list.jsp" target="display_area" style="display:inline;">
				<label><input type="button" onclick="submit()" name="one_serving" style="display:none;"><input type="text" name="category" value="1인분" style="display:none;"><li style="color:#363636; margin-left: 40px;">1인분</li></label>
			</form>
			<form method="post" action="search.jsp" target="display_area" style="display:inline;">
				<li style="float: right;">
					<input type="text" name="search" placeholder="음식점 검색"/>
					<input type="submit" value="검색"/> <!-- search.jsp로 전송 -->
				</li>
			</form>
		</ul>
	</nav>

	<br/>
	
	<!-- article -->
	<article style="margin: 0 auto;">
		<iframe class="a_iframe" name="display_area" width="1000px" height="650px" src="main_list.html"></iframe>
	</article>

	<hr/>

	<!-- footer -->
	<footer style="margin: 10px; text-align: center;">
		<span class="copyright">Copyright ⓒ 2021 배달와따. All rights reserved.</span>
		<span class="copyright" style="float:right;"><a href="changePW.html">비밀번호 변경</a></span>
	</footer>

	<!-- 동작을 담당할 자바 스크립트 가져옴 -->
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</body>
</html>