<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*"%>
<%@ page import="java.util.ArrayList"%>


<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 정보 리스트</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		//		String sessionId = (String)session.getAttribute("admin_id");
		//		if(sessionId == null) {
		//			response.sendRedirect("/Total.Management.System/main.jsp");		
		//		}

		//		행정정보를 꺼낼수 있는 메서드를 DAO 에 생성하고 목록이름부분에 행정이 올수 있게 하자.<%=dto.get ..로	
		ControlDAO dao = ControlDAO.getInstance();
	%> 

	<jsp:include page="../left.jsp" />
		<form action="/Total.Management.System/lecture/lecturePro.jsp"
			method="post">
			<div class="content">
				<table border="1" cellpadding="0" cellspacing="0" align="center">
					<tr align="center" height="50">
						<td width="300">강의명</td>
						<td width="300">강의 기간</td>
						<td width="200">강의실</td>
						<td width="100">강사</td>
					</tr>
					<%
						
						ArrayList list = dao.lectureAll(); 
						if (list.size() > 0) { 
							for (int i = 0; i < list.size(); i++) {
								Lecture_InformationDTO dto = (Lecture_InformationDTO) list.get(i);
					%>
					
					<tr>
						<td><%=dto.getLecture_name()%></td>
						<td><%=dto.getLecture_course()%></td>
						<td><%=dto.getLecture_room()%></td>
						<td><%=dto.getTeacher()%></td>
					</tr>
			
					<%-- href="/Total.Management.System/lecture/lecturePro.jsp?lecture_name=<%=sdto.getLecture_name()%>"> --%>
					<%-- 		<%=sdto.getLecture_name()%> 
								<%=sdto.getLecture_course()%> 
								<%=sdto.getLecture_room()%>
								<%=sdto.getTeacher()%> --%>

					<%
						} 
					%>
					<%
						} 
					%>
					
				</table>
			</div>
</body>
</html>