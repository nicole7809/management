<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Admin_MembersDTO" %>
<%@ page import="" %>
    <h1>managementInfo</H1>
    
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("admin_id");
		if(sessionId==null){ 
			response.sendRedirect("/Total.Management.System/main.jsp");
			
		}
		Testdao dao = new Testdao();
		Admin_MembersDTO dto = dao.managementInfo(sessionId);
	%>
	<form action="updatePro.jsp" method="post">
		admin_id : <%=dto.getAdmin_id() %> <br />
		<input type="hidden" name="id" value="<%=dto.getAdmin_id() %>" />
		admin_name : <input type="text" name="name" value="<%=dto.getAdmin_name()%>" /> <br />
		password : <input type="password" name="pw" value="<%=dto.getPassword()%>" /> <br />
		email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
		phone : <input type="text" name="phone" value="<%=dto.getPhone()%>" /> <br />
		admin_pic : <input type="text" name="admin_pic" value="<%=dto.getAdmin_pic()%>" /> <br />
		reg_date : <%=dto.getReg_date() %> <br />
		
		<input type="submit" value ="정보수정" />
		
	</form>
	
	   