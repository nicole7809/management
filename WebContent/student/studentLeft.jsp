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
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
		
%>
<div class="sidebar">
  <a class="active" href="/Total.Management.System/student/studentMain.jsp">Home</a>
  <a href ="studentInfo.jsp"><%=studentId %> [님]</a>
  <a href="/Total.Management.System/board/notice.jsp">공지사항</a>
  <a href="/Total.Management.System/management/QNAList.jsp">Q&A게시판</a>
  <a href="/Total.Management.System/note/note.jsp">메모하기</a>
  <a href="/Total.Management.System/student/logout.jsp">로그아웃</a>
</div>
</body>
</html>