<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="team.elite.management.Teacher_MembersDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.elite.management.Student_MembersDTO"%>
<%@ page import="team.elite.management.NoteDTO" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>5조 프로젝트 사이트</title>
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
<link href="../css/left.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="container">
  <div class="row">
    <div class="column">
	<%
		String studentId = (String)session.getAttribute("student_id");
		if(studentId == null) {	// 로그인 유효성검사
			response.sendRedirect("/Total.Management.System/main.jsp");
		}
		
		int seqno = Integer.parseInt(request.getParameter("seqno"));
		String pageNum = request.getParameter("pageNum");
		
		try{
			ControlDAO dao = ControlDAO.getInstance();
			NoteDTO note = dao.getNote(seqno);
		
	%>
	<body>
	<div class="sidenav">
	<jsp:include page="../left.jsp"/>
	</div>
	<div class="row">
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
	  
	
</div>
<div class="row">
	<div class="left_article">
	<form action="noteUpdatePro.jsp" name="noteContent" method="post" onsubmit="return writeSave()">
		<table  border="1" cellpadding="0" cellspacing="0" align="center">
	    	<tr>
	    		<td align="center"><input type="text" size="20" maxlength="30" name="subject" value="<%=note.getSubject() %>"/></td>
	    		<input type="hidden" name="seqno" value="<%=note.getSeqno() %>"/>
	    	</tr>
	    	<tr>
	    		<td align="center" > <textarea name="content" rows="13" cols="30"><%=note.getContent() %> </textarea> </td>
	    	</tr>
	    	<tr>
	    		<td align="center" >
	    			<input type="submit" value="수정" />
	    			<input type="button" onclick="window.location='note.jsp'" value="새 메모" >
	    			<input type="button" value="삭제" onclick="window.location='noteDeletePro.jsp?seqno=<%=note.getSeqno()%>&pageNum=<%=pageNum%>'"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
		<div>
	     <jsp:include page="noteList.jsp"></jsp:include>
	    </div>
	 </div>
</div>	 
<footer class="secondary_header footer">
			    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
		 </footer>
</body>
	<%
	}catch(Exception e){} 
	%>
</html>