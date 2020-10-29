<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*" %>
<%@ page import="" %>
    <h1>studentInfo</H1>
    
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("student_id");
		if(sessionId==null){ 
			response.sendRedirect("/Total.Management.System/main.jsp");
			
		}
		ControlDAO dao = new ControlDAO();
		Student_MembersDTO dto = dao.studentInfo(sessionId);
	%>
	<form action="updatePro.jsp" method="post">
		student_id : <%=dto.getStudent_id() %> <br />
		<input type="hidden" name="id" value="<%=dto.getStudent_id() %>" />
		student_name : <input type="text" name="student_name" value="<%=dto.getStudent_name()%>" /> <br />
		password : <input type="password" name="password" value="<%=dto.getPassword()%>" /> <br />
		email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		student_pic : <input type="text" name="student_pic" value="<%=dto.getStudent_pic()%>" /> <br />
		reg_date : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		
	</form>
	
	
	
	