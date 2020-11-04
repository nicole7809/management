<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="java.sql.Timestamp"%>


<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="article" scope="page"
	class="team.elite.management.QNADTO">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");

	ControlDAO dbPro = ControlDAO.getInstance();
	int check = dbPro.updateArticle(article);

	if (check == 1) {
%>
<meta http-equiv="Refresh"
	content="0;url=QNAList.jsp?pageNum=<%=pageNum%>">
<%
	} else {
%>
<script language="JavaScript">
<!--
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
	-->
</script>
<%
	}
%>
