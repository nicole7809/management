<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="java.util.ArrayList"%>

<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
<html>
<head>
<meta charset="UTF-8">
<title>같은 강의면 정보</title>
<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
	<style>
a {
	text-decoration: none;
}
</style>
</head>
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
					String name = request.getParameter("name");

					ArrayList list = dao.lectureDetail(name);
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
				%>
				<%
					}
				%>


			</table>
		</div>
</body>
</html>