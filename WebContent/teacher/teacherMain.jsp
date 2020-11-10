<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "team.elite.management.*" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 강사 메인</title>
		<link href="/Total.Management.System//css/mainTemplate.css" rel="stylesheet" type="text/css">
		<style>
			.menu{background-color:#B3B3B3; width:20%; padding-top:15px; padding-bottom:15px; text-align:center;}
		</style>
	</head>
	<%

		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("teacher_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		

	%>
	<body>
		<table border ="0" cellpadding="0" cellspacing="0" width="100%" align="center">
			<tr>
				<td class="menu"> <a href ="teacherInfo.jsp"> <%=sessionId %> </a></td>
				<td align= "center" rowspan="6" bgcolor="#ECEBFF">
					강의리스트에서 여러 반이 나와서 클릭하면 해당 반 학생리스트가 나오고 거기서 학생정보가 나오는거 아닌가요?<br>
					아. 강의리스트 에서 반 클릭시 맨 위 강사     다음 학생리스트가 나와서 거기서 클릭시 해당 정보가 나오는것???<br>
					이렇게 include하면 되는 거아닌가 왜 안되지? jsp:include page="/Total.Management.System/board/notice.jsp"/>
				</td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/courseList.jsp"> 강의리스트</a> </td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/schdule.jsp"> 학생리스트</a> </td>
			</tr>
			<tr>
				<td class="menu"> <a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </td>
			</tr>
			<tr>
				<td class="menu"><a href ="/Total.Management.System/teacher/tQNAList.jsp"> Q & A </a> </td>
			</tr>
			<tr>
				<td class="menu"><a href ="/Total.Management.System/teacher/logout.jsp"> 로그아웃 </a> </td>
			</tr>

		</table>
		<footer class="secondary_header footer">
   			 <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
 		</footer>
	</body>
</html>


		
				
				
				