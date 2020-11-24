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
	<jsp:include page="../left.jsp" />
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String studentId = (String)session.getAttribute("student_id");
		if(studentId == null) {	// 로그인 유효성검사
			response.sendRedirect("/Total.Management.System/main.jsp");
		}
		
	%>
<body>
<div class="container">
 
	  <%
		request.setCharacterEncoding("UTF-8");
		ControlDAO dao = ControlDAO.getInstance();
	%>
	
<section>
	<div>
	
	<h2>학생모드 메인</h2>
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
    <aside class="right_article">메모장</aside>
  </section>	
		
				<%}
					}
				%>
		</div>
	<div class="columns2">
	  <jsp:include page="../note/note.jsp"/>
	</div>
	<div></div>
	<footer class="text-center">
      <div>
        <div>
          <div class="col-12">
            <p class="secondary_header">Ⓒ 2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</p>
          </div>
        </div>
      </div>
    </footer>
</body>
</html>