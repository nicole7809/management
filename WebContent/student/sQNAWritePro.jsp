<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="article" scope="page"
	class="team.elite.management.QNADTO">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());

	ControlDAO dbPro = ControlDAO.getInstance();
	dbPro.insertArticle(article);

	response.sendRedirect("sQNAList.jsp");
%>
