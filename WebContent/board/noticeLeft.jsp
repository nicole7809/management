<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	// 로그인 유효성 검사
	String sessionId = (String)session.getAttribute("admin_id");
	if(sessionId == null) {
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
		
%>
<div class="sidebar">
  <a class="active" href="/Total.Management.System/management/managementMain.jsp">Home</a>
  <a href ="managementInfo.jsp"><%=sessionId %> [님]</a>
  <a href="/Total.Management.System/management/courseList.jsp">강의리스트</a>
  <a href="/Total.Management.System/student/studentList.jsp">학생리스트</a>
  <a href="/Total.Management.System/board/notice.jsp">공지사항</a>
  <a href="/Total.Management.System/management/QNAList.jsp">Q&A게시판</a>
  <a href="/Total.Management.System/management/logout.jsp">로그아웃</a>
</div>
</body>
</html>