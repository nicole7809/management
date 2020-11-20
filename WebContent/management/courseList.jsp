<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
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
					ArrayList list = dao.lectureAll();
					if (list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							Lecture_InformationDTO dto = (Lecture_InformationDTO) list.get(i);
							String le = URLEncoder.encode(dto.getLecture_name(), "UTF-8"); // 링크 한글화 가능 처리
							String tc = URLEncoder.encode(dto.getTeacher(), "UTF-8");
							String lc = URLEncoder.encode(dto.getLecture_code(), "UTF-8");
				%>
				<tr>
					<td><a href="../management/lectureDetail.jsp?name=<%=le%>"><%=dto.getLecture_name()%></a></td>
					<td><%=dto.getLecture_course()%></td>
					<td><%=dto.getLecture_room()%></td>
					<td><a href="../management/lectureContent.jsp?name=<%=tc%>"><%=dto.getTeacher()%></a></td>
					<td><%=dto.getStudent()%></td>
					<td><a href="../management/lecture.jsp?name=<%=lc%>"><%=dto.getLecture_code()%></a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
</body>
</html>