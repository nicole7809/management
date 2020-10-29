<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*" %>
<%@ page import="" %>
    <h1>teacherInfo</H1>
    
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("teacher_id");
		if(sessionId==null){ 
			response.sendRedirect("/Total.Management.System/main.jsp");
			
		}
		ControlDAO dao = new ControlDAO();
		Teacher_MembersDTO dto = dao.teacherInfo(sessionId);
	%>
	<form action="updatePro.jsp" method="post">
		Teacher_id : <%=dto.getTeacher_id() %> <br />
		<input type="hidden" name="id" value="<%=dto.getTeacher_id() %>" />
		Teacher_name : <input type="text" name="name" value="<%=dto.getTeacher_name()%>" /> <br />
		password : <input type="password" name="pw" value="<%=dto.getPassword()%>" /> <br />
		email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		Teacher_pic : <input type="text" name="admin_pic" value="<%=dto.getTeacher_pic()%>" /> <br />
		reg_date : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		
	</form>
	