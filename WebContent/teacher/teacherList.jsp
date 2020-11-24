<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.*"%>
<%@ page import="java.util.ArrayList"%>


<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>
<body>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 정보 리스트</title>

</head>
<body>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String adminId = (String)session.getAttribute("admin_id");
		String teacherId = (String)session.getAttribute("teacher_id");
		if(adminId == null && teacherId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}

		//행정정보를 꺼낼수 있는 메서드를 DAO 에 생성하고 목록이름부분에 행정이 올수 있게 하자
		ControlDAO dao = ControlDAO.getInstance();
	%>

	<jsp:include page="../left.jsp" />
	<div class="content">
		<form action="/Total.Management.System/lecture/lecturePro.jsp"method="post">
<!-- 			<div class="content"> -->
				<table width="60%" border="1" cellpadding="0" cellspacing="0" align="center">
					<tr align="center" height="50">
						<td width="300" colspan="2">강사 리스트</td>
					
					</tr>
					<%
						
						ArrayList list = dao.teacherAll(); 
						if (list.size() > 0) { 
							for (int i = 0; i < list.size(); i++) {
								Teacher_MembersDTO dto = (Teacher_MembersDTO) list.get(i);
					%>
					
					<tr>
						<td>
							<a href="/Total.Management.System/teacher/teacherInfo.jsp?teacher_id=<%=dto.getTeacher_id()%>"><%=dto.getTeacher_name()%></a>
						</td>
						<td width="50"><input type="button" value="탈퇴" onclick="window.location='tcDelete.jsp?teacher_id=<%=dto.getTeacher_id()%>&stateNum=1'" />
						<input type="button" value="재직" onclick="window.location='tcStart.jsp?teacher_id=<%=dto.getTeacher_id()%>&stateNum=0'" />
											
					</tr>
					<%
						} 
					%>
					<%
						} 
					%>
				</table></form>
			</div>
	<footer class="text-center">
      <div>
        <div>
          <div class="col-12">
            <p class="secondary_header">Ⓒ 2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</p>
          </div>
        </div>
      </div>
    </footer>			
</body>
</html>