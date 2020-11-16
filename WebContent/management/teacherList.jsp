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
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String adminId = (String) session.getAttribute("admin_id");
		String teacherId = (String) session.getAttribute("teacher_id");
		if (adminId == null && teacherId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");
		}

		//		행정정보를 꺼낼수 있는 메서드를 DAO 에 생성하고 목록이름부분에 행정이 올수 있게 하자.<%=dto.get ..로	
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
				//for문으로 학생리스트 반복
				// list로  학생리스트를 만들어 게시판처럼 꺼내면 됨.
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
					} // 페이지 값을 학생 아이디로 넘겨줌.
				%>
				<%
					} // 이렇게 하면 DB에 저장된 학생 수 만큼 반복.
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