<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 글쓰기</title>
		<link href="../css/left.css" rel="stylesheet" type="text/css">
	</head>
	<body>

		<%
			// 세션 확인 후 글쓰기 가능.
			String adminId = (String)session.getAttribute("admin_id");
			if(adminId == null)  { %>
			<script>
				alert("로그인 후 사용해주세요.");
				window.location='/Total.Management.System/main.jsp';
			</script>
		<%	}
			int num = 0; 				%>
		<jsp:include page="../left.jsp"/>
		<div class="content">
			<form action = "noticeWritePro.jsp" name = "noticeWriteForm" method="post" onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>" />
				<table border="1" cellpadding="0" cellspacing="0" widht="500" align="center">
					<tr>
						<td align="right" colspan="2"> 
							<a href="/Total.Management.System/board/notice.jsp" >목록</a></td>
					</tr>
					<tr>
						<td align="center" > 작성자 </td>
						<td> <input type="text" name = "writer" /> </td>
					</tr>
					<tr>
						<td> 제목 </td>
						<td> <input type="text" name="subject" size="50" maxlength="50" />
							 <input type="checkbox" name="important" value="1"/> 중요 공지글 </td>
					</tr>
					<tr>
						<td> 내용 </td>
						<td> <textarea name="content" rows="30" cols="60" > </textarea> </td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="submit" value="글쓰기" />
							<input type="reset" value="다시쓰기"/>
							<input type="button" value="목록" onclick="window.location='notice.jsp'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div>
		<footer class="secondary_header footer">
			    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
		 </footer>
		</div>
	</body>
</html>