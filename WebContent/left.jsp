<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "team.elite.management.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	// 로그인 유효성 검사
	String studentId = (String)session.getAttribute("student_id");
	String teacherId = (String)session.getAttribute("teacher_id");
	String adminId = (String)session.getAttribute("admin_id");
	if(studentId == null && teacherId == null && adminId == null) {
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
		
%>
<div class="sidebar">
  <a class="active" href="/Total.Management.System/main.jsp">Home</a>
  <%
  	if(studentId !=null && teacherId == null && adminId == null) {	// 학생로그인일 경우 %>
  		<a href ="/Total.Management.System/student/studentInfo.jsp"><%=studentId %> [님]</a>
  <%}else if(studentId ==null && teacherId != null && adminId == null) { // 강사로그인일 경우%>
  		<a href ="/Total.Management.System/teacher/teacherInfo.jsp"><%=teacherId %> [님]</a>
  <%}else if (studentId ==null && teacherId == null && adminId != null) { // 행정로그인일 경우	%>
  		<a href ="/Total.Management.System/management/managementInfo.jsp"><%=adminId %> [님]</a>
  <%} %>
  <%
  	// 행정일때 강의리스트, 학생리스트보이게
  	if(studentId ==null && teacherId == null && adminId != null) { // 행정로그인일 경우	%>
  		<a href="/Total.Management.System/management/courseList.jsp">강의리스트</a>
  		<a href="/Total.Management.System/student/studentList.jsp">학생리스트</a>
  	<%}%>
  <a href="/Total.Management.System/board/notice.jsp">공지사항</a>
  <a href="/Total.Management.System/management/QNAList.jsp">Q&A게시판</a>
  <%
  	if(studentId !=null && teacherId == null && adminId == null) { %>
  		<a href="/Total.Management.System/note/note.jsp">메모하기</a>
  <%}%>
  <a href="/Total.Management.System/student/logout.jsp">로그아웃</a>
</div>
</body>
</html>