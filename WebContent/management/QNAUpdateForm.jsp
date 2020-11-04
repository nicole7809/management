<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>


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
<script type="text/javascript">
	function writeSave() {

		if (document.writeform.writer.value == "") {
			alert("�ۼ��ڸ� �Է��Ͻʽÿ�.");
			document.writeform.writer.focus();
			return false;
		}
		if (document.writeform.subject.value == "") {
			alert("������ �Է��Ͻʽÿ�.");
			document.writeform.subject.focus();
			return false;
		}

		if (document.writeform.content.value == "") {
			alert("������ �Է��Ͻʽÿ�.");
			document.writeform.content.focus();
			return false;
		}

		if (document.writeform.passwd.value == "") {
			alert(" ��й�ȣ�� �Է��Ͻʽÿ�.");
			document.writeform.passwd.focus();
			return false;
		}
	}
</script>


<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		ControlDAO dbPro = ControlDAO.getInstance();
		QNADTO article = dbPro.updateGetArticle(num);
%>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글수정</b> <br>
		<form method="post" name="writeform"
			action="QNAUpdatePro.jsp?pageNum=<%=pageNum%>"
			onsubmit="return writeSave()">
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td align="left" width="330"><input type="text" size="10"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
						<input type="hidden" name="num" value="<%=article.getNum()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td align="left" width="330"><textarea name="content"
							rows="13" cols="40"><%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td align="left" width="330"><input type="password" size="8"
						maxlength="12" name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
						type="submit" value="글수정"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						onclick="document.location.href='QNAList.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
		<%
			} catch (Exception e) {
			}
		%>
	
</body>
</html>
