<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	//색깔보임
	String bodyback_c = "#FFFFFF";//배경화이트<글내용볼때배경>
	String back_c = "#F6F6F6";//화이트
	String title_c = "#5CD1E5";//제목 파란색
	String value_c = "#D5D5D5";//연한그레이
	String bar_c = "#5D5D5D";//연한그레이
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
			    <td  width="70"  bgcolor="<%=value_c%>" align="center" >제 목</td>
			    <td  width="330">
			    <%if(request.getParameter("num")==null){%>
			       <input type="text" size="40" maxlength="50" name="subject"></td>
				<%}else{%>
				   <input type="text" size="40" maxlength="50" name="subject" value="[답변]"></td>
				<%}%>
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