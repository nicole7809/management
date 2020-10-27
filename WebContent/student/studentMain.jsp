<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 메인</title>
		<link href="css/mainTemplate.css" rel="stylesheet" type="text/css">
	</head>
	<%
//		String ADMIN_ID = (String)session.getAttribute("teacher_id");
//		if(ADMIN_ID == null) {
//			response.sendRedirect("/project_1/main.jsp");		// 로그인 없이 url사용하는것 방지?? 맞나??
//		}								// 전체 홈.
		

	%>
	<body>
	
		<table border ="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<ul>
						<h3> <a href ="/Total.Management.System/studentInfo.jsp"> student </a></h3>
						<h3> <a href ="/Total.Management.System/courseList.jsp"> 내 강의</a></h3>
						<h3> <a href ="/Total.Management.System/schdule.jsp"> 일정</a></h3>
						<h3> <a href ="/Total.Management.System/memo.jsp"> 메모</a></h3>
						<h3> 게시판 </h3>
						<h3> <a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </h3>
						<h3> <a href ="/Total.Management.System/massage.jsp"> Q & A </a> </h3>
					</ul>
				</td>
				<td align= "center">
					페이지 선택 시 실행 될 곳... 어떻게 하지?
					include 하면 되지않을까??
				</td>
			</tr>
		</table> 
		이걸 활용 하고 싶습니다.....
		<div class = "container">
			<div class = "left" >
				<ul>
					<li><a href ="/Total.Management.System/studentInfo.jsp"> student </a> </li>
					<li><a href ="/Total.Management.System/courseList.jsp"> 내 강의</a> </li>
					<li><a href ="/Total.Management.System/schdule.jsp"> 일정</a> </li>
					<li><a href ="/Total.Management.System/memo.jsp"> 메모</a> </li>
					<li><a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </li>
					<li><a href ="/Total.Management.System/massage.jsp"> Q & A </a> </li>
				</ul>
			</div>
			<div class = "center">
				<p> 여기엔 뭐가 있어야 할까요? </p>
			</div>
			<footer class="secondary_header footer">
   				 <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
 			</footer>
		</div>
	</body>
</html>