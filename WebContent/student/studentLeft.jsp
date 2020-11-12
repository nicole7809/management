<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "team.elite.management.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	// 로그인 유효성 검사
	String studentId = (String)session.getAttribute("student_id");
	if(studentId == null) {
		response.sendRedirect("/project_1/main.jsp");
	}
		
%>
<div class="sidebar">
  <a class="active" href="/project_1/main.jsp">Home</a>
  <a href ="studentInfo.jsp"><%=studentId %> [님]</a>
  <a href="/project_1/board/notice.jsp">공지사항</a>
  <a href="/project_1/management/QNAList.jsp">Q&A게시판</a>
  <a href="/project_1/note/note.jsp">메모하기</a>
  <a href="/project_1/student/logout.jsp">로그아웃</a>
</div>
</body>
</html>