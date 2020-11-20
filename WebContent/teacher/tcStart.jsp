<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.ControlDAO" %>
<%@ page import="team.elite.management.Student_MembersDTO" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>강사 상태변경</title>
	</head>
	<body>
		
		<%
			String teacher_id=request.getParameter("teacher_id");
			String stateNum = request.getParameter("stateNum");
			
			ControlDAO dao = ControlDAO.getInstance();
			dao.teacherState(teacher_id, stateNum);	//state 재직 상태 변경.
		%>
		
		<script>
			alert("재직으로 변경 되었습니다.");
			window.location("teacherList.jsp");
		</script>
		
	</body>
</html>