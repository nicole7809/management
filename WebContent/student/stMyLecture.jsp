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
		<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
	</head>
	<jsp:include page="../left.jsp" />
<body>
<div class="container">
 
	  <%
		request.setCharacterEncoding("UTF-8");
		ControlDAO dao = ControlDAO.getInstance();
	%>
	
<section>
	<div>
	
	<h2>Main Content</h2>
    <article class="left_article">
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
      <h3>학생 정보 안내</h3>
      <p><img src="/Total.Management.System/img/ahn.jpg" alt="" width="150" height="120"/></p> 
      <p>강의명 - <%=dto.getLecture_name()%></p>
      <p>강의 기간 - <%=dto.getLecture_course()%></p>
      <p>강의실 : <%=dto.getLecture_room()%></p>
      <p>강의 기간 : <%=dto.getTeacher()%></p>
      <p>수강생 이름 : <%=dto.getStudent()%></p>
      <p>강의 코드 : <%=dto.getLecture_code()%></p>
    </article>
    <aside class="right_article">내강의정보</aside>
  </section>	
		
				<%}
					}
				%>
		</div>
	
	<div>
		<footer class="secondary_header footer">
			    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
		 </footer>
	</div>
</body>
</html>