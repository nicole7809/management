<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@ page import ="team.elite.management.ControlDAO"%>
<%@ page import="java.io.File" %> 
<%@page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %> 
 
    
    <jsp:useBean id="dto" class="team.elite.management.Student_MembersDTO" />
	<jsp:setProperty property="*" name="dto" />
    <%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String) session.getAttribute("student_id");
		if (sessionId == null) {
			response.sendRedirect("stLoginForm.jsp");
		}
	%>
	
	<%
		ControlDAO dao = ControlDAO.getInstance();
		
		String save = request.getRealPath("img");	// 실제 파일저장되는 폴더 
 		int size = 1024*1024*50; //10mb 
 		String enc = "UTF-8"; 
 		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); 
 		MultipartRequest mr = new MultipartRequest(request, save, size, enc, dp); 
 	
 		dto.setStudent_id(mr.getParameter("student_id"));
		dto.setStudent_name(mr.getParameter("student_name"));
		dto.setPassword(mr.getParameter("password"));
		dto.setEmail(mr.getParameter("email"));
		dto.setPhone(mr.getParameter("phone"));
	
		String Student_pic = mr.getFilesystemName("Student_pic");
		String sysImg = mr.getParameter("sysImg");
		if(Student_pic == null){
			dto.setStudent_pic(sysImg);
		}else{
			dto.setStudent_pic(Student_pic);
		}
	
		dao.studentUpdate(dto);
		%>
	<script>
		alert("수정되었습니다.");
		window.location = "studentMain.jsp";
	</script>



</body>
</html>