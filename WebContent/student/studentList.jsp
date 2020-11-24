<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.*" %>    
<%@ page import= "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 정보 리스트</title>
		<style>
			a{text-decoration:none;}
		</style>
		<link href="../css/left.css" rel="stylesheet" type="text/css">
		<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String adminId = (String)session.getAttribute("admin_id");
		String teacherId = (String)session.getAttribute("teacher_id");
		if(adminId == null && teacherId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
//		행정정보를 꺼낼수 있는 메서드를 DAO 에 생성하고 목록이름부분에 행정이 올수 있게 하자
		ControlDAO dao = ControlDAO.getInstance();
		

	%>
		<jsp:include page="../left.jsp"/>
		<div class="content">
			<table width="60%" border="1" cellpadding="0" cellspacing="0" align="center">

				<tr>
					<td colspan="3" align="center" bgcolor="#f1f1f1" height="30"> 전체 학생 리스트 </td>
				</tr>		
				<%
					//for문으로 학생리스트 반복
					// list로  학생리스트를 만들어 게시판처럼 꺼내면 됨.
					ArrayList list = dao.studentAll();		// 아직 메서드 없음
					if(list.size() > 0 ) {		//학생리스트에 아무것도 없을 수 있기에 먼저 0하고 비교.
						for(int i = 0; i <list.size(); i++) { 
							Student_MembersDTO sdto = (Student_MembersDTO)list.get(i);  %>
				<tr>
					<%
							if(adminId !=null) { %>	
					<td colspan="2" align="center" height="20" width="200">	
							<a href="/Total.Management.System/student/studentInfo.jsp?student_id=<%=sdto.getStudent_id()%>"> <%=sdto.getStudent_name()%></a>
					</td>
					<td>
								<button onclick="window.location='stDelete.jsp?student_id=<%=sdto.getStudent_id()%>&state=5'" class="button">탈퇴</button>
								<button onclick="window.location='stStart.jsp?student_id=<%=sdto.getStudent_id()%>&state=1'" class="button">수강중</button>
					</td>	
							<%}else { %>
					<td colspan="3" align="center" height="20" width="200">	
							<a href="/Total.Management.System/student/studentInfo.jsp?student_id=<%=sdto.getStudent_id()%>"> <%=sdto.getStudent_name()%></a>
					</td>
						<%}
						}						// 페이지 값을 학생 아이디로 넘겨줌.%>													
					<%} 						// 이렇게 하면 DB에 저장된 학생 수 만큼 반복.		%>
				</tr>
			</table>
		</div>
		<div>
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