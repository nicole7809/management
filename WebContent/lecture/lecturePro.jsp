<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.Lecture_InformationDTO"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<html>
<head>
<title>강의 등록</title>

<!-- css 파일 분리 -->
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />
<link href="../../css/mainTemplate.css" rel="stylesheet" type="text/css">
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
			
			
			<tr>
				<td id="title">수강생 이름</td>
				<td><%=dto.getStudent()%></td>
			</tr>
			
			<tr>
				<td id="title">강의 코드</td>
				<td><%=dto.getLecture_code()%></td>
			</tr>
		</table>
		<br>
		<button
			onclick="window.location='/Total.Management.System/management/courseList.jsp'">
			강의정보</button>
	</div>
	<footer class="secondary_header footer">
		    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
	 </footer>	
</body>
</html>
