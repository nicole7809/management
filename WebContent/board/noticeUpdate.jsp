<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.ControlDAO" %> 
<%@ page import= "team.elite.management.NoticeDTO" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 글 수정</title>
	</head>
	<body>
	
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			try{
				ControlDAO dao = ControlDAO.getInstance();
				NoticeDTO notice = dao.updateGetNotice(num);
		%>
			<form action = "noticeUpdatePro.jsp" name = "noticeWriteForm" method="post" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=num%>" />
			<table border="1" cellpadding="0" cellspacing="0" widht="500" align="center">
				<tr>
					<td align="right" colspan="2"> 
						<a href="/Total.Management.System/board/notice.jsp" >목록</a></td>
				</tr>
				<tr>
					<td align="center" > 작성자 </td>
					<td> <input type="hidden" name = "writer" value="세션id"/> </td>
				</tr>
				<tr>
					<td> 제목 </td>
					<td> <input type="text" name="subject" size="50" maxlength="50" value="<%=notice.getSubject()%>" /> </td>
				</tr>
				<tr>
					<td> 내용 </td>
					<td> <textarea name="content" rows="30" cols="60" <%=notice.getContent()%> > </textarea> </td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="글수정" />
						<input type="reset" value="다시쓰기"/>
						<input type="button" value="삭제" onclick="window.location='noticeDeletePro.jsp'">
						<input type="button" value="목록" onclick="window.location='notice.jsp'" />
					</td>
				</tr>
			</table>
		</form>
		
			<%}catch(Exception e) {}	%>
	
	</body>
</html>