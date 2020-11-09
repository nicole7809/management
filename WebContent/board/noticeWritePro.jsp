<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "team.elite.management.ControlDAO" %>
<%@ page import= "java.sql.Timestamp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeWritePro</title>
	</head>
	<body>
	
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		
		<jsp:useBean id = "notice" scope="page" class="team.elite.management.NoticeDTO"/>
		<jsp:setProperty property="*" name="notice" />
		
		<%
			notice.setReg_date(new Timestamp(System.currentTimeMillis()));	// 현재 시간
			notice.setIp(request.getRemoteAddr());							// 클라이언트의 ip가져옴.
			
			ControlDAO dao = ControlDAO.getInstance();
			dao.insertNotice(notice);										// DB에 공지사항 전달.
			
			response.sendRedirect("notice.jsp");
		%>
		
		
	</body>
</html>