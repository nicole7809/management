<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//색깔보임
	String bodyback_c="#FFFFFF";//배경화이트<글내용볼때배경>
	String back_c="#F6F6F6";//화이트
	String title_c="#5CD1E5";//제목 파란색
	String value_c="#D5D5D5";//연한그레이
	String bar_c="#5D5D5D";//연한그레이
%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/left.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!--
	function deleteSave() {
		if (document.delForm.passwd.value == '') {
			alert("비밀번호를 입력하십시요.");
			document.delForm.passwd.focus();
			return false;
		}
	}
// -->
</script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<jsp:include page="../left.jsp"/>
	<div class="content">
	<center>
		<b>글삭제</b> <br>
		<form method="POST" name="delForm"
			action="deletePro.jsp?pageNum=<%=pageNum%>"
			onsubmit="return deleteSave()">
			<table border="1" align="center" cellspacing="0" cellpadding="0"
				width="360">
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>"><b>비밀번호를 입력해 주세요.</b></td>
				</tr> 
				<tr height="30">
					<td align=center>비밀번호 : <input type="password" name="passwd"
						size="8" maxlength="12"> <input type="hidden" name="num"
						value="<%=num%>"></td>
				</tr>
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>"><input type="submit"
						value="글삭제"> <input type="button" value="글목록"
						onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
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
