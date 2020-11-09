<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO" %>
<%@ page import="team.elite.management.NoteDTO" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noteList</title>
		<style>
			a{text-decoration:none;}
		</style>
	</head>
	<body>
	<%! int pageSize = 7;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	
			<%
			// 로그인 유효성검사
			String studentId = (String)session.getAttribute("student_id");
			if(studentId == null) {	
				response.sendRedirect("/Total.Management.System/main.jsp");
			}
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum== null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize +1;
			int endRow = currentPage * pageSize;
			int count = 0;	//-------------------------------글 갯수
			
			List noteList = null;
			ControlDAO dao = ControlDAO.getInstance();
			count = dao.getNoteCount(); 				// 메모 목록 수 확인
			if(count > 0)
				noteList = dao.getNote(startRow, endRow); 
				
			if(count == 0) {%>
				<table border="1" cellpadding="0" cellspacing="0" align="center">
					<tr bgcolor="#f1f1f1"> <td align="center"> 저장된 메모가 없습니다. </td> </tr>
				</table>
			<%}else { %>
				<table border="1" cellpadding="0" cellspacing="0" align="center" >
				<tr bgcolor="#f1f1f1"> <td align="center"><b>메모 (<%=count%>)</b></td></tr>
				<%
					for(int i = 0; i <noteList.size(); i++) {
						NoteDTO dto = (NoteDTO)noteList.get(i); %>
							<tr>
								<td><a href="noteContent.jsp?seqno=<%=dto.getSeqno()%>&pageNum=<%=currentPage%>">
									<%=dto.getSubject()%></a>
								</td>
							</tr>
						<%}
				}%>
			</table>          