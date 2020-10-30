<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
<title>Insert title here</title>
</head>
<body>

	<h1>updatePro</h1>


	<%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String) session.getAttribute("teacher_id");
		if (sessionId == null) {
			response.sendRedirect("teacherInfo.jsp");
		}
	%>
	<jsp:useBean id="dto" class="team.elite.management.Teacher_MembersDTO" />
	<jsp:setProperty property="*" name="dto" />
	<%
		ControlDAO dao = ControlDAO.getInstance();
		dao.teacherUpdate(dto);
	%>
	<script>
		alert("수정되었습니다.");
		window.location = "teacherInfo.jsp";
	</script>



</body>
</html>