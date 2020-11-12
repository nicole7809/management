<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>

<%@ page import="team.elite.management.Teacher_MembersDTO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
<title>Insert title here</title>
</head>
<body>


	<jsp:useBean id="dto" class="team.elite.management.Teacher_MembersDTO" />
	<jsp:setProperty property="*" name="dto" />

<%-- 	<%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String) session.getAttribute("teacher_id");
		if (sessionId == null) {
			response.sendRedirect("tcLoginForm.jsp");
		}
	%> --%>
	
<%-- 	<%
		ControlDAO dao = ControlDAO.getInstance();
		dao.teacherUpdate(dto);
	%> --%>
	
	
	<%
	 	request.setCharacterEncoding("UTF-8"); 
		String save = request.getRealPath("img");
		int size = 1024*1024*10; // 10mb
		String enc = "UTF-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
		
		Teacher_MembersDTO DTO = new Teacher_MembersDTO();
		dto.setTeacher_id(mr.getParameter("teacher_id"));
		dto.setTeacher_name(mr.getParameter("teacher_name"));
		dto.setPassword(mr.getParameter("password"));
		dto.setEmail(mr.getParameter("email"));
		dto.setPhone(mr.getParameter("phone"));
	
		
		
		
		String teacher_pic = mr.getFilesystemName("teacher_pic");
		String sysImg = mr.getParameter("sysImg");
		if(teacher_pic == null){
			dto.setTeacher_pic(sysImg);
		}else{
			dto.setTeacher_pic(teacher_pic);
		}
		
		
		
		
		ControlDAO dao = ControlDAO.getInstance();
		dao.teacherUpdate(dto);
	%>
	<script>
		alert("수정되었습니다.");
		window.location = "teacherInfo.jsp";
	</script>



</body>
</html>