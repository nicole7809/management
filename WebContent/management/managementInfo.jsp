<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Admin_MembersDTO" %>
<%@ page import="team.elite.management.ControlDAO" %>
    <h1>managementInfo</H1>
    
    <%request.setCharacterEncoding("UTF-8"); %>
    
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("admin_id");
		if(sessionId==null){ 
			response.sendRedirect("mgtLoginForm.jsp");
			
		}
		ControlDAO dao = ControlDAO.getInstance();
		Admin_MembersDTO dto = dao.managementInfo(sessionId);
	%>
	<form action="maupdatePro.jsp" method="post">
		관리자 아이디 : <%=dto.getAdmin_id() %> <br />
		<input type="hidden" name="admin_id" value="<%=dto.getAdmin_id() %>" />
		관리자 이름 : <input type="text" name="admin_name" value="<%=dto.getAdmin_name()%>" /> <br />
		관리자 PW : <input type="password" name="password" value="<%=dto.getPassword()%>" /> <br />
		Email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		Phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		사진 : <input type="text" name="admin_pic" value="<%=dto.getAdmin_pic()%>" /> <br />
		가입날짜 : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		<input type="button" value="취소" onclick="window.location='managementMain.jsp'" />
		
	</form>
	
	   