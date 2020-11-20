<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="team.elite.management.Teacher_MembersDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.elite.management.Student_MembersDTO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 메인</title>
		<link href="../css/left.css" rel="stylesheet" type="text/css">
	</head>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String studentId = (String)session.getAttribute("student_id");
		if(studentId == null) {	// 로그인 유효성검사
			response.sendRedirect("/Total.Management.System/main.jsp");
		}
		
	%>
<body>
	<div class="sidenav">
	<jsp:include page="../left.jsp"/>
	</div>
	<div class="content">
	  <%
		request.setCharacterEncoding("UTF-8");
		ControlDAO dao = ControlDAO.getInstance();
	%>
	
	
		<div class="content">
			<table border="1" cellpadding="0" cellspacing="0" align="center">
				<tr align="center" height="50">
					<td width="300">강의명</td>
					<td width="300">강의 기간</td>
					<td width="200">강의실</td>
					<td width="100">강사</td>
					<td width="100">수강생 이름</td>
					<td width="100">강의 코드</td>
				</tr>
				<%
					String sessionId = (String) session.getAttribute("student_id");
					String name = request.getParameter("name");
					ArrayList list = dao.StudentLecture(sessionId);
					//ArrayList list = dao.teacher();
					ArrayList lecture_name = new ArrayList<Lecture_InformationDTO>();
					if (list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							Lecture_InformationDTO dto = (Lecture_InformationDTO) list.get(i);
				%>
				<tr>
					<td><%=dto.getLecture_name()%></td>
					<td><%=dto.getLecture_course()%></td>
					<td><%=dto.getLecture_room()%></td>
					<td><%=dto.getTeacher()%></td>
					<td><%=dto.getStudent()%></td>
					<td><%=dto.getLecture_code()%></td>
				</tr>
				<%}
					}
				%>
			</table>
		</div>
	
	<div>
	  <jsp:include page="../note/note.jsp"/>
	</div>
	
	<div>
		<footer class="secondary_header footer">
			    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
		 </footer>
	</div>
</body>
</html>