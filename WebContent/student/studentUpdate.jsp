<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="team.elite.management.ControlDAO"%>
    <h1>studentUpdate!!!</h1>
    
    <%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String) session.getAttribute("student_id");
		if (sessionId == null) {
			response.sendRedirect("studentInfo.jsp");
		}
	%>
	<jsp:useBean id="dto" class="team.elite.management.Student_MembersDTO" />
	<jsp:setProperty property="*" name="dto" />
	<%
		ControlDAO dao = ControlDAO.getInstance();
		dao.studentUpdate(dto);
	%>
	<script>
		alert("수정되었습니다.");
		window.location = "studentInfo.jsp";
	</script>


     
</body>
</html>