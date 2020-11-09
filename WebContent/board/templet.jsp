<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "team.elite.management.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0px;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 15px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}
.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
</style>
</head>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("student_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
	%>
<body>

<div class="sidebar">
  <a class="active" href="/Total.Management.System/main.jsp">Home</a>
  <a href ="studentInfo.jsp">내정보<%=sessionId %></a>
  <a href="/Total.Management.System/courseList.jsp">내강의</a>
  <a href="/Total.Management.System/schdule.jsp">일정스케쥴</a>
  <a href="/Total.Management.System/board/notice.jsp">공지사항</a>
  <a href="/Total.Management.System/board/message.jsp">Q&A게시판</a>
  <span style="cursor:pointer" onclick="openNav()">&#9776; 메모하기</span>
  <a href="/Total.Management.System/student/logout.jsp">로그아웃</a>
</div>

<div class="content">
  <jsp:include page="notice.jsp"></jsp:include>
</div>

	  <footer class="secondary_header footer">
	    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
	  </footer>
	</div>
</div>
</body>
</html>