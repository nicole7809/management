<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Student_MembersDTO"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="java.util.ArrayList"%>

<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		//세션꺼내기 /확인!!! 
		String studentId = (String) session.getAttribute("student_id");
		String teacherId = (String) session.getAttribute("teacher_id");
		String adminId = (String) session.getAttribute("admin_id");

		// 유효성검사.
		if (studentId == null && teacherId == null && adminId == null) {
			response.sendRedirect("../main.jsp");
		}
		ControlDAO dao = ControlDAO.getInstance();
		Student_MembersDTO dto = dao.studentInfo(studentId); // 학생정보꺼내는 메서드호출.

		// 관리자가 url로 학생정보 볼 수 있게 파라미터 받기.
		if (adminId != null || teacherId != null) {
			String student_id = request.getParameter("student_id"); // url파라미터 받은 것.
			dto = dao.studentInfoList(student_id); // 받은 파라미터로도 데이터받는 메서드 호출.
		}
	%>
	<jsp:include page="../left.jsp" />
	<div class="content">
		<form action="studentUpdate.jsp" method="post"
			enctype="multipart/form-data">

			<center>
				<table border=2 width="400" height="70" bordercolor="skyblue">
					<!-- <caption>강사 개인 정보 수정</caption> -->
					</br>
					</br>
					<strong><p style="font-size: 30; color: skyblue"
							face="Times">학생 개인 정보 수정</p>
						<strong>
							<tr>
								<td>학생 ID :</td>
								<td><%=dto.getStudent_id()%>
								<input type="hidden" name="student_id"
									value="<%=dto.getStudent_id()%>" /></td>
							</tr>
							<tr>
								<td>학생 이름 :</td>
								<td><%=dto.getStudent_name()%>
								<input type="hidden" name="student_name"
									value="<%=dto.getStudent_name()%>" /></td>
							</tr>
							<tr>
								<td>학생 PW :</td>
								<td><input type="password" name="password"
									value="<%=dto.getPassword()%>" /></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td><input type="text" name="email"
									value="<%=dto.getEmail()%>" /></td>
							</tr>
							<tr>
								<td>Phone :</td>
								<td><input type="text" name="phone"
									value="<%=dto.getPhone()%>" /></td>
							</tr>
							<tr>
								<td>사진 :</td>
								<td><input type="file" name="Student_pic" /><br /> <input
									type="hidden" name="sysImg" value="<%=dto.getStudent_pic()%>" />
									<img
									src="/Total.Management.System/img/<%=dto.getStudent_pic()%>" />
							</tr>
							<tr>
								<td>가입날짜 :</td>
								<td><%=dto.getReg_date()%></td>
							</tr>

				</table>
				<input type="submit" value="정보수정" />

				<%
					// 관리자, 강사 라면 만 이부분 보임
					if (adminId != null || teacherId != null) {
				%>
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
							if (sessionId == null && request.getParameter("student_id") != null) {
								sessionId = request.getParameter("student_id");
							}
							String name = request.getParameter("name");
							ArrayList list = dao.StudentLecture(sessionId);
							//ArrayList list = dao.teacher();
							ArrayList lecture_name = new ArrayList<Lecture_InformationDTO>();
							if (list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									Lecture_InformationDTO sdto = (Lecture_InformationDTO) list.get(i);
					%>
					<tr>
						<td><%=sdto.getLecture_name()%></td>
						<td><%=sdto.getLecture_course()%></td>
						<td><%=sdto.getLecture_room()%></td>
						<td><%=sdto.getTeacher()%></td>
						<td><%=sdto.getStudent()%></td>
						<td><%=sdto.getLecture_code()%></td>
					</tr>
					<%
						}
							}
					%>
				</table>
				<%
					}
				%>
			
		</form>
	</div>

	<footer class="secondary_header footer">
		<div class="copyright">
			&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong>
		</div>
	</footer>
</body>

