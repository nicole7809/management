<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.ControlDAO" %>
<%@ page import="team.elite.management.Student_MembersDTO" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생 상태변경</title>
	</head>
	<body>
		
		<%
			String student_id=request.getParameter("student_id");
			String state = request.getParameter("state");
			
			ControlDAO dao = ControlDAO.getInstance();
			dao.studentState(student_id, state);	//state 수강중으로  상태 변경.
		%>
		
		<script>
			alert("수강 중으로 변경 되었습니다.");
			window.location("studentList.jsp");
		</script>
		
	</body>
</html>