<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 리스트</title>
<style>
a {
	text-decoration: none;
}
</style>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		ControlDAO dao = ControlDAO.getInstance();
	%>
	<jsp:include page="../left.jsp" />
	<div class="content">
		<table border="1" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td colspan="3" align="center" bgcolor="#f1f1f1" height="30">
					강사 리스트</td>
			</tr>

			<%
			
				ArrayList list = dao.teacherAll();
				if (list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						Teacher_MembersDTO dto = (Teacher_MembersDTO) list.get(i);
			%>
			<tr>
				<td colspan="3" align="center" height="20"><a
					href="/Total.Management.System/teacher/teacherInfo.jsp?teacher_id=<%=dto.getTeacher_id()%>">
						<%=dto.getTeacher_name()%></a></td>
				<%
					} 
				%>
				<%
					} 
				%>
			</tr>
		</table>
	</div>
	<!-- <div>
			<footer class="secondary_header footer">
				<div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
			</footer>
		</div> -->

</body>
</html>