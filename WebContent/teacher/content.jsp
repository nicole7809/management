<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>게시판</title>
<link href="../css/left.css" rel="stylesheet" type="text/css">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>

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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		ControlDAO dbPro = ControlDAO.getInstance();
		QNADTO article = dbPro.getArticle(num);

		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
<body bgcolor="<%=bodyback_c%>">
	<jsp:include page="../left.jsp"/>
	<div class="content">
	<center>
		<b>글내용 보기</b> <br>
		<form>
			<table width="80%" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="center" width="100" bgcolor="<%=value_c%>">글번호</td>
					<td align="center"  width="375" colspan="3"><%=article.getNum()%></td>
					
				</tr>
				<tr>
					<td align="center" width="100" bgcolor="<%=value_c%>">작성자</td>
					<td align="center" width="100" align="center"><%=article.getWriter()%></td>
					<td align="center" width="100" bgcolor="<%=value_c%>">작성일</td>
					<td align="center" width="100" align="center"><%=sdf.format(article.getReg_date())%></td>
				</tr>
				<tr>
					<td align="center" width="100" bgcolor="<%=value_c%>">글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=article.getSubject()%></td>
				</tr>
				<tr height='300'>
					<td align="center" width="100" bgcolor="<%=value_c%>">글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
				</tr>
			<tr>
					<td colspan="4" bgcolor="<%=value_c%>" align="right">
					 <input type="button" value="강사 글삭제"
						onclick="document.location.href='tQNADeleteTeacherPro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
						onclick="document.location.href='tQNAWriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글목록" onclick="document.location.href='tQNAList.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr> 
			
			</table>
			<%
				} catch (Exception e) {
				}
			%>
		</form>
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
