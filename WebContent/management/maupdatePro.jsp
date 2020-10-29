<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*" %>
	<h1>maupdatePro!!!</h1>
	
	 <%
    request.setCharacterEncoding("UTF-8");
    String sessionId = (String)session.getAttribute("admin_id");
	if(sessionId==null){ 
		response.sendRedirect("mgLoginFrom.jsp");
	}
    
  %>
    <jsp:useBean id="dto" class="team.elite.management.Admin_MembersDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
  
 <%--   	Testdao dao = new Testdao();
    	dao.update(dto);
  --%>  
    <script>
    	alert("수정되었당!!!");
    	window.location="managementMain.jsp";
    </script>
    
    