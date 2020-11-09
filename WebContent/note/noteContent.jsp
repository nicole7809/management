<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO" %>
<%@ page import="team.elite.management.NoteDTO" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>5조 프로젝트 사이트</title>
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="container">
  <header>
    <div class="primary_header">
      <h1 class="title">학사관리시스템</h1>
    </div>
  </header>
  <div class="row">
    <div class="columns1">
	<%
		String adminId = (String)session.getAttribute("admin_id");
		String teacherId = (String)session.getAttribute("teacher_id");
		String studentId = (String)session.getAttribute("student_id");
		if(adminId ==null && teacherId ==null && studentId == null) {	// 로그인 유효성검사
			response.sendRedirect("/Total.Management.System/main.jsp");
		}
		
		int seqno = Integer.parseInt(request.getParameter("seqno"));
		String pageNum = request.getParameter("pageNum");
		
		try{
			ControlDAO dao = ControlDAO.getInstance();
			NoteDTO note = dao.getNote(seqno);
		
	%>
	<body>

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
    <div class="columns2">
      
     <jsp:include page="noteList.jsp"></jsp:include>
     
    </div>
  </div>
  <footer class="secondary_header footer">
    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
  </footer>
</div>
	</body>
	<%
	}catch(Exception e){} 
	%>
</html>