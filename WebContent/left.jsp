<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "team.elite.management.*" %>
    <%
	// 로그인 유효성 검사
	String studentId = (String)session.getAttribute("student_id");
	String teacherId = (String)session.getAttribute("teacher_id");
	String adminId = (String)session.getAttribute("admin_id");
	if(studentId == null && teacherId == null && adminId == null) {
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
	%>
 <header>
    <div class="primary_header">
      <h1 class="title"> 학사관리 사이트</h1>
    </div>
    <nav class="secondary_header" id="menu">
      <ul>
        <%
  	if(studentId !=null && teacherId == null && adminId == null) {	//------------------------ 학생로그인일 경우 %>
  		<li><a class="active" href="/Total.Management.System/student/studentMain.jsp">학생메인</a></li>
  		<li><a href ="/Total.Management.System/student/studentInfo.jsp"><%=studentId %> [님]</a></li>
  		<li><a href="/Total.Management.System/student/stMyLecture.jsp">내 강의 정보</a></li>
  		<li><a href="/Total.Management.System/board/notice.jsp">공지사항</a></li>
  		<li><a href ="/Total.Management.System/student/sQNAList.jsp">Q&A게시판 </a></li>
  		
  <%}else if(studentId ==null && teacherId != null && adminId == null) { 	//--------------- 강사로그인일 경우%>
  		<li><a class="active" href="/Total.Management.System/teacher/teacherMain.jsp">강사메인</a></li>
  		<li><a href ="/Total.Management.System/teacher/teacherInfo.jsp"><%=teacherId %> [님]</a></li>
  		<li><a href="/Total.Management.System/teacher/tcMyLecture.jsp">내 강의 정보</a></li>
  		<li><a href="/Total.Management.System/student/studentList.jsp">학생리스트</a></li>
  		<li><a href="/Total.Management.System/board/notice.jsp">공지사항</a></li>
  		<li><a href ="/Total.Management.System/teacher/tQNAList.jsp">Q&A게시판 </a></li>
  		
  <%}else if (studentId ==null && teacherId == null && adminId != null) {	//--------------- 행정로그인일 경우	%>
  		<li><a class="active" href="/Total.Management.System/management/managementMain.jsp">행정메인</a></li>
  		<li><a href ="/Total.Management.System/management/managementInfo.jsp"><%=adminId %> [님]</a></li>
  		<li><a href="../lecture/lectureForm.jsp">강의 등록</a></li>
  		<li><a href="/Total.Management.System/management/courseList.jsp">강의리스트</a></li>
  		<li><a href="/Total.Management.System/teacher/teacherList.jsp">강사리스트</a></li>
  		<li><a href="/Total.Management.System/student/studentList.jsp">학생리스트</a></li>
  		<li><a href="/Total.Management.System/board/notice.jsp">공지사항</a></li>
  		<li><a href ="/Total.Management.System/management/QNAList.jsp">Q&A게시판 </a></li>
  		
  <%}%>
  
  <%// 실행 중 가끔 목록이 사라진 경우가 있어 로그아웃은 항상 띄워놓았음.
  	if(studentId !=null && teacherId == null && adminId == null) {	//------------------------ 학생로그인일 경우 %>
  		<li><a href="/Total.Management.System/student/logout.jsp">로그아웃</a></li>
  <%}else if(studentId ==null && teacherId != null && adminId == null) { 	//--------------- 강사로그인일 경우%>
  		<li><a href="/Total.Management.System/teacher/logout.jsp">로그아웃</a></li>
  <%}else if (studentId ==null && teacherId == null && adminId != null) {	//--------------- 행정로그인일 경우	%>
  		<li><a href="/Total.Management.System/management/logout.jsp">로그아웃</a></li>
  <%} %>
      </ul>
    </nav>
  </header>