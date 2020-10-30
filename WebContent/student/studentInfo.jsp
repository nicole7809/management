<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Student_MembersDTO" %>
<%@ page import="team.elite.management.ControlDAO" %>
    <h1>studentInfo</H1>
    
    <%request.setCharacterEncoding("UTF-8"); %>
    
   	<% //세션꺼내기 확인!!! 
		String sessionId = (String)session.getAttribute("student_id");
		if(sessionId==null){ 
			response.sendRedirect("studentInfo.jsp");
			
		}
		ControlDAO dao = ControlDAO.getInstance();
		Student_MembersDTO dto = dao.studentInfo(sessionId);
	%>
	<form action="studentUpdate.jsp" method="post">
		학생 ID : <%=dto.getStudent_id() %> <br />
		<input type="hidden" name="student_id" value="<%=dto.getStudent_id() %>" />
		학생 이름 : <input type="text" name="student_name" value="<%=dto.getStudent_name()%>" /> <br />
		학생 PW : <input type="password" name="password" value="<%=dto.getPassword()%>" /> <br />
		Email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		Phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		사진 : <input type="text" name="student_pic" value="<%=dto.getStudent_pic()%>" /> <br />
		가입날짜 : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		<input type="button" value="취소" onclick="window.location='studentMain.jsp'"/>
		
	</form>
	
	
	
	