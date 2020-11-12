<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Student_MembersDTO" %>
<%@ page import="team.elite.management.ControlDAO" %>

<head>
	<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
   	<% //세션꺼내기 /확인!!! 
		String sessionId = (String)session.getAttribute("student_id");
		if(sessionId==null){ 
			response.sendRedirect("../main.jsp");
			
		}
		ControlDAO dao = ControlDAO.getInstance();
		Student_MembersDTO dto = dao.studentInfo(sessionId);
	%>
	<jsp:include page="../left.jsp"/>
	<div class="content">
	<form action="studentUpdate.jsp" method="post">
	
		<center>
	<table border=2 width="400" height="70" bordercolor="skyblue">
			<!-- <caption>강사 개인 정보 수정</caption> -->
			</br>
			</br>
			<strong><p style="font-size:30;color:skyblue"  face="Times">학생 개인 정보 수정</p><strong>
			<tr>
				<td>학생 ID :</td>
				<td><%=dto.getStudent_id() %></td>
				<input type="hidden" name="student_id" value="<%=dto.getStudent_id() %>" />
			</tr>
			<tr>
				<td>학생 이름 :</td>
				<td><input type="text" name="student_name" value="<%=dto.getStudent_name()%>" /> </td>
			</tr>
			<tr>
				<td>학생  PW :</td>
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
				<td><input type="text" name="student_pic" value="<%=dto.getStudent_pic()%>" /> </td>
			</tr>
			<tr>
				<td>가입날짜 :</td>
				<td><%=dto.getReg_date()%></td>
			</tr>
		</table>
		<input type="submit" value ="정보수정" />
	</form>
	</div>

	<footer class="secondary_header footer">
		    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
	 </footer>
	</div>
</body>
	
	