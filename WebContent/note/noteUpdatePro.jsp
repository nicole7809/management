<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO" %>
<%@ page import="java.sql.Timestamp" %>

    <%
    	request.setCharacterEncoding("UTF-8");
    %>
    <jsp:useBean id ="note" class = "team.elite.management.NoteDTO" scope="page" />
    <jsp:setProperty property="*" name = "note" />
    
    <%
    	String pageNum = request.getParameter("pageNum");
    
    	ControlDAO dao = ControlDAO.getInstance();
    	dao.updateArticle(note);		//----------- 글 수정 메서드호출.
    	
    	
    //	새로 고침 하는 것%>
    <meta http-equi="Refresh" content="0;url=note.jsp?pageNum=<%=pageNum%>" >
    
    <script>
		alert("수정 되었습니다.");
		window.location="note.jsp";
	</script>
	