<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 메인</title>
	</head>
	<%
//		String ADMIN_ID = (String)session.getAttribute("TEACHER_ID");
//		if(ADMIN_ID == null) {
//			response.sendRedirect("/project_1/main.jsp");		// 로그인 없이 url사용하는것 방지?? 맞나??
//		}								// 전체 홈.
		
	%>
	<body>
	
		<table border ="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<ul>
						<h3> <a href ="/project_1/studentInfo.jsp"> student </a></h3>
						<h3> <a href ="/project_1/courseList.jsp"> 내 강의</a></h3>
						<h3> <a href ="/project_1/schdule.jsp"> 일정</a></h3>
						<h3> <a href ="/project_1/memo.jsp"> 메모</a></h3>
						<h3> 게시판 </h3>
						<h3> <a href ="/project_1/notice.jsp"> 공지사항 </a> </h3>
						<h3> <a href ="/project_1/massage.jsp"> Q & A </a> </h3>
					</ul>
				</td>
				<td align= "center">
					페이지 선택 시 실행 될 곳... 어떻게 하지?
					include 하면 되지않을까??
				</td>
			</tr>
		</table>
	
	</body>
</html>