<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="team.elite.management.Teacher_MembersDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 정보 리스트</title>
<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
	<style>
a {
	text-decoration: none;
}
</style>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ControlDAO dao = ControlDAO.getInstance();
	%>
	<jsp:include page="../left.jsp" />
	<form action="/Total.Management.System/lecture/lecturePro.jsp"
		method="post">
		<div class="content">
			<table border="1" cellpadding="0" cellspacing="0" align="center">
				<tr align="center" height="50">
					<td width="300">강의명</td>
					<td width="300">강의 기간</td>
					<td width="200">강의실</td>
					<td width="100">강사</td>
					<td width="100">수강생 이름</td>
					<td width="100">강의 코드</td>
				</tr>
				<%
					String sessionId = (String) session.getAttribute("student_id");
					String name = request.getParameter("name");
					ArrayList list = dao.StudentLecture(sessionId);
					//ArrayList list = dao.teacher();
					ArrayList lecture_name = new ArrayList<Lecture_InformationDTO>();
					if (list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							Lecture_InformationDTO dto = (Lecture_InformationDTO) list.get(i);
				%>
				<tr>
					<td><%=dto.getLecture_name()%></td>
					<td><%=dto.getLecture_course()%></td>
					<td><%=dto.getLecture_room()%></td>
					<td><%=dto.getTeacher()%></td>
					<td><%=dto.getStudent()%></td>
					<td><%=dto.getLecture_code()%></td>
				</tr>
				<%
					}
					}
				%>



				<%
					int seqno = 0;
					String writer = "";
					if (request.getParameter("seqno") != null) {
						seqno = Integer.parseInt(request.getParameter("seqno"));
						writer = request.getParameter("writer");
					}
				%>



				<form action="noteWritePro.jsp" onsubmit="return writeSave()"
					method="post">
					<input type="hidden" name="seqno" value="<%=seqno%>" /> <input
						type="hidden" name="writer" value="<%=writer%>" />
					<table border="1" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td align="center">제목 <input type="text" size="20"
								maxlength="30" name="subject" /></td>
						</tr>
						<tr>
							<td align="center"><textarea name="content" rows="13"
									cols="30"> </textarea></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="저장">
								<input type="reset" value="다시쓰기"></td>
					</table>
				</form>
		</div>
		<div class="columns2">

			<jsp:include page="noteList.jsp"></jsp:include>

		</div>
		</div>
		<footer class="secondary_header footer">
			<div class="copyright">
				&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong>
			</div>
		</footer>
		</div>
</body>
</html>
