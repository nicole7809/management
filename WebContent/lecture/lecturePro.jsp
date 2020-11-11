<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<html>
<head>
<title>회원가입 처리 JSP</title>

<!-- css 파일 분리 -->
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />

</head>
<body>
	<%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
	<%
		// 한글 깨짐을 방지하기 위한 인코딩 처리
		request.setCharacterEncoding("UTF-8");
	%>

	<%-- 자바빈 관련 액션태그 사용 --%>
	<jsp:useBean id="dto" class="team.elite.management.Lecture_InformationDTO" />
	<jsp:setProperty property="*" name="dto" />
	<%
		// MemberDAO 호출   필수 
		ControlDAO d = ControlDAO.getInstance();
		d.insert(dto);
	%>
	<div id="wrap">


		<%-- 자바빈에서 입력된 값을 추출한다. --%>
		<table>
			<tr>
				<td id="title">강의명</td>
				<td><%=dto.getLecture_name()%></td>
			</tr>

			<tr>
				<td id="title">강의 기간</td>
				<td><%=dto.getLecture_course()%></td>
			</tr>

			<tr>
				<td id="title">강의실</td>
				<td><%=dto.getLecture_room()%></td>
			</tr>

			<tr>
				<td id="title">강사</td>
				<td><%=dto.getTeacher()%></td>
			</tr>

		</table>

		<br>
		<button onclick="window.location='myInfo.jsp'">회원 정보 수정</button>
		<button onclick="window.location='deleteForm.jsp'">탈 퇴</button>
		<button onclick="window.location='Logout.jsp'">로그아웃</button>
	</div>

</body>
</html>
