<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "team.elite.management.*" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 행정 메인</title>	
		<link href="../css/left.css" rel="stylesheet" type="text/css">
	</head>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("admin_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
		
	%>
	<body>
		<jsp:include page="adminLeft.jsp"/>
		
		<div class="content">
		<h2>게시판 불러오는곳</h2>
			<p>This example use media queries to transform the sidebar to a top navigation bar when the screen size is 700px or less.</p>
			<p>We have also added a media query for screens that are 400px or less, which will vertically stack and center the navigation links.</p>
			<h3>Resize the browser window to see the effect.</h3>
		</div>
		<div>

		<footer class="secondary_header footer">
   			<div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
 		</footer>
	</body>
</html>


		
				
				
				