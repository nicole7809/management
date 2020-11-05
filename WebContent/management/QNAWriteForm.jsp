<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	String bodyback_c = "#e0ffff";
	String back_c = "#8fbc8f";
	String title_c = "#5f9ea0";
	String value_c = "#b0e0e6";
	String bar = "#778899";
%>




<%
	String adminId = (String)session.getAttribute("admin_id");
	String teacherId = (String)session.getAttribute("teacher_id");
	String studentId = (String)session.getAttribute("student_id");
	if(adminId ==null && teacherId ==null && studentId == null) {	// 로그인 유효성검사
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
	if (adminId == null && teacherId == null && studentId ==null) {
%>
	<script>
		alert("로그인후 글쓰기 가능합니다..!!");
		window.location = 'mgtLoginForm.jsp';
	</script>

<%
	}
%>
<%
	int num = 0, ref = 1, re_step = 0, re_level = 0;
	try {
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글쓰기</b> <br>
		<form method="post" name="QNAWriteForm" action="QNAWritePro.jsp"
			onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=num%>"> <input
				type="hidden" name="ref" value="<%=ref%>"> <input
				type="hidden" name="re_step" value="<%=re_step%>"> <input
				type="hidden" name="re_level" value="<%=re_level%>">

			<table width="400" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>"><a
						href="QNAList.jsp"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td width="330" value="로그인한 아이디로 하고 싶다" > <input type="hidden" name="writer"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330">
						<%
							if (request.getParameter("num") == null) {
						%> <input type="text" size="40" maxlength="50" name="subject">
					</td>
					<%
						} else {
					%>
					<input type="text" size="40" maxlength="50" name="subject"
						value="[답변]">
					</td>
					<%
						}
					%>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30"
						name="email"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330"><input type="password" size="8" maxlength="12"
						name="password"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
						type="submit" value="글쓰기"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						OnClick="window.location='QNAList.jsp'"></td>
				</tr>
			</table>
			<%
				} catch (Exception e) {
				}
			%>
		</form>
</body>
</html>
