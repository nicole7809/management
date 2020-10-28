<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.*" %>    
<%@ page import= "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 정보 리스트</title>
	</head>
	<body>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("admin_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
//		행정정보를 꺼낼수 있는 메서드를 DAO 에 생성하고 목록이름부분에 행정이 올수 있게 하자.<%=dto.get ..로	
		ControlDAO dao = ControlDAO.getInstance();
		Admin_MembersDTO adto = dao.getAdMember(sessionId);

	%>
		<table border ="0" cellpadding="0" cellspacing="0" width="100%" align="center">
			<tr>
				<td class="menu"> <a href ="/Total.Management.System/adminInfo.jsp"> <%=sessionId %> </a></td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/courseList.jsp"> 강의리스트</a> </td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/studentList.jsp"> 학생리스트</a> </td>
			</tr>
			<tr>
				<td class="menu"> <a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </td>
			</tr>
			<tr>
				<td class="menu"><a href ="/Total.Management.System/board/message.jsp"> Q & A </a> </td>
				<td align= "center" rowspan="6" bgcolor="#EAF6FF">
					<table>
						<h5> 학생리스트</h5>
						<tr>
							<td> 과정 명  </td>
							<td> 전 페이지에서 넘어오는 정보로.자동 해당되게</td>
							<td> 강사 </td>
							<td> 과정명과 동일 </td>
						</tr>
						<tr>
							<td> 학생 리스트 </td>
						</tr>
						<%
							//for문으로 학생리스트 반복
							// list로  학생리스트를 만들어 게시판처럼 꺼내면 됨.
							ArrayList list = dao.studentAll();		// 아직 메서드 없음
							if(list.size() > 0 ) {		//학생리스트에 아무것도 없을 수 있기에 먼저 0하고 비교.
								for(int i = 0; i <list.size(); i++) { 
								Student_MembersDTO sdto = (Student_MembersDTO)list.get(i);  %>
								<td> <a href="/Total.Management.System/studentInfo.jsp?student_id=<%=sdto.getStudent_id()%>"> <%=sdto.getStudent_name()%></a> 
								<%} 						// 페이지 값을 학생 아이디로 넘겨준다. 이게 되는 건가??%>
								</td>													
							<%} %>
					</table>
				</td>
			</tr>

		</table>
	
	</body>
</html>