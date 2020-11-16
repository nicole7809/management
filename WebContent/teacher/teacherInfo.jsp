<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Teacher_MembersDTO" %>
<%@ page import="team.elite.management.ControlDAO" %>


<head>
	<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
    
   	<% //세션꺼내기 /확인!!! 
		 String sessionId = (String)session.getAttribute("teacher_id");
		if(sessionId==null){ 
			response.sendRedirect("tcLoginForm.jsp");
			
		}
		String teacher_id = request.getParameter("teacher_id");
		ControlDAO dao = ControlDAO.getInstance();
		
		Teacher_MembersDTO dto = dao.teacherInfo(sessionId);
	%>
	<jsp:include page="../left.jsp"/>
	<div class="content">
		<form action="teacherUpdate.jsp" method="post"  enctype="multipart/form-data">
		
		<center>
	<table border=4 width="500" height="100" bordercolor="skyblue">
			<!-- <caption>강사 개인 정보 수정</caption> -->
			</br>
			</br>
			<strong><p style="font-size:30;color:skyblue"  face="Times">강사 개인 정보 수정</p><strong>
			<tr>
				<td>강사 아이디 :</td>
				<td><%=dto.getTeacher_id() %></td>
				<input type="hidden" name="teacher_id" value="<%=dto.getTeacher_id() %>" />
			</tr>
			<tr>
				<td>강사 이름 :</td>
				<td><input type="text" name="teacher_name" value="<%=dto.getTeacher_name()%>" /></td>
			</tr>
			<tr>
				<td>강사 PW :</td>
				<td><input type="password" name="password" value="<%=dto.getPassword()%>" /> </td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Phone :</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>" /></td>
			</tr>
			<tr>
				<td>사진 :</td>
				<td>
				<input type="file" name="teacher_pic" /> 
				<input type="hidden" name="sysImg" value="<%=dto.getTeacher_pic()%>" />
				<input type="hidden" name="teacher_id" value="<%=dto.getTeacher_id()%>" />
			  	<img src="/Total.Management.System/img/<%=dto.getTeacher_pic()%>" />
				</td>
			</tr>
			<tr>
				<td>이미지 이름</td>
				<td><%=dto.getTeacher_pic()%></td>
			</tr>
				</tr>
				<td>가입날짜 :</td>
				<td><%=dto.getReg_date()%></td>
			</tr>
		</table>
		<input type="submit" value ="정보수정" />
	</form>
	</div>
	<div>
		<footer class="secondary_header footer">
			<div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
		 </footer>
	</div>
</body>	