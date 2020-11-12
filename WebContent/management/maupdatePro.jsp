<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import="team.elite.management.ControlDAO"%> 
<%@ page import="java.io.File" %> 
<%@page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %> 

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
 <% 
 	ControlDAO dao = ControlDAO.getInstance(); 

 	//String save="d://save//"; 

 	String save = request.getRealPath("img");	// 실제 파일저장되는 폴더 
 	int size = 1024*1024*10; //10mb 
 	String enc = "UTF-8"; 
 	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); 
 	MultipartRequest mr = new MultipartRequest(request, save, size, enc, dp); 
 	
 	dto.setAdmin_id(mr.getParameter("admin_id"));
	dto.setAdmin_name(mr.getParameter("admin_name"));
	dto.setPassword(mr.getParameter("password"));
	dto.setEmail(mr.getParameter("email"));
	dto.setPhone(mr.getParameter("phone"));
	
	String Admin_pic = mr.getFilesystemName("Admin_pic");
	String sysImg = mr.getParameter("sysImg");
	if(Admin_pic == null){
		dto.setAdmin_pic(sysImg);
	}else{
		dto.setAdmin_pic(Admin_pic);
	}
	dao.maupdatePro(dto);
	%>   

    <script> 
    alert("수정되었당!!!"); 
    window.location="managementInfo.jsp"; 
    </script> 