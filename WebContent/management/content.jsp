<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
	//색깔보임
	String bodyback_c = "#CEECF5";
	String back_c = "#BDBDBD";
	String title_c = "#E6E6E6";
	String value_c = "#848484";
	String bar_c = "#F7819F";
%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		ControlDAO dbPro = ControlDAO.getInstance();
		QNADTO article = dbPro.getArticle(num);

		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글내용 보기</b> <br>
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
					<td align="center" width="125" align="center"><%=article.getNum()%></td>
					<td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
					<td align="center" width="125" align="center"><%=article.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
					<td align="center" width="125" align="center"><%=article.getWriter()%></td>
					<td align="center" width="125" bgcolor="<%=value_c%>">작성일</td>
					<td align="center" width="125" align="center"><%=sdf.format(article.getReg_date())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=article.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
				</tr>
			<tr height="30">
					<td colspan="4" bgcolor="<%=value_c%>" align="right">
						<%-- <%
							String adminId = (String) session.getAttribute("adminId");
								if (adminId != null) {
									if (adminId.equals(article.getWriter())) {
						%> --%>
						 <%-- <input type="button" value="글수정"onclick="document.location.href='QNAUpdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글삭제" onclick="document.location.href='QNADeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; --%> <%-- <%
 	}
 			if (adminId.equals("admin")) {
 %> --%> <input type="button" value="관리자 글삭제"
						onclick="document.location.href='QNADeleteAdminPro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
						onclick="document.location.href='QNAWriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>'">
						&nbsp;&nbsp;&nbsp;&nbsp;<%--  <%
 	}
 		}
 %> --%> <input type="button" value="글목록"
						onclick="document.location.href='QNAList.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr> 
			
			</table>
			<%
				} catch (Exception e) {
				}
			%>
		</form>
<!-- 		 <input type="button" value="답글" onclick="goJoinForm()" />

		<input type="button" value="삭제" onclick="window.location.href='QNADeleteAdminPro.jsp';" />  -->
</body>
</html>
