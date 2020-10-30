<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Teacher_MembersDTO" %>
<%@ page import="team.elite.management.ControlDAO" %>
    <h1>teacherInfo</H1>
    
    <%
		request.setCharacterEncoding("UTF-8");%>
    
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("teacher_id");
		if(sessionId==null){ 
			response.sendRedirect("tcLoginForm.jsp");
			
		}
		ControlDAO dao = ControlDAO.getInstance();
		Teacher_MembersDTO dto = dao.teacherInfo(sessionId);
	%>
	<form action="teacherUpdate.jsp" method="post">
		강사 아이디 : <%=dto.getTeacher_id() %> <br />
		<input type="hidden" name="teacher_id" value="<%=dto.getTeacher_id() %>" />
		강사 이름 : <input type="text" name="teacher_name" value="<%=dto.getTeacher_name()%>" /> <br />
		강사 PW : <input type="password" name="password" value="<%=dto.getPassword()%>" /> <br />
		Email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		Phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		사진 : <input type="text" name="teacher_pic" value="<%=dto.getTeacher_pic()%>" /> <br />
		가입날짜 : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		
	</form>
	