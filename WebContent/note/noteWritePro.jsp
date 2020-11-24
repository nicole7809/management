<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO" %>
<%@ page import="java.sql.Timestamp" %>


<% 	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "note" class = "team.elite.management.NoteDTO" />
<jsp:setProperty property="*" name="note" />

<%
	note.setReg_date(new Timestamp(System.currentTimeMillis()) );
	
	ControlDAO dao = ControlDAO.getInstance();
	dao.insert(note);
	
	response.sendRedirect("../student/studentMain.jsp");
%>