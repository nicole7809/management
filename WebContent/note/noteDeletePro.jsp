<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO" %>
<%@ page import="java.sql.Timestamp" %>



<%
    request.setCharacterEncoding("UTF-8");
	
	int seqno = Integer.parseInt(request.getParameter("seqno"));
	String pageNum = request.getParameter("pageNum");
	
	ControlDAO dao = ControlDAO.getInstance();
	int x = dao.deleteNote(seqno);
	
	if(x ==1) {	// 글이 삭제 됐다면 페이지 새로고침해라. %>
		<meta http-equi="Refresh" content="0;url=note.jsp?pageNum=<%=pageNum%>" >
	<%} %>
	
	<script>
		alert("삭제 되었습니다.");
		window.location="../student/studentMain.jsp";
	</script>

