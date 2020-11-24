<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
	//색깔보임
	String bodyback_c="#FFFFFF";//배경화이트<글내용볼때배경>
	String back_c="#F6F6F6";//화이트
	String title_c="#5CD1E5";//제목 파란색
	String value_c="#D5D5D5";//연한그레이
	String bar_c="#5D5D5D";//연한그레이
%>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);  // 2
    int startRow = (currentPage - 1) * pageSize + 1; // (2-1)*10+1
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List articleList = null;
    ControlDAO dbPro = ControlDAO.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize; //  11-(1-1)*10
	
	String adminId = (String)session.getAttribute("student_id");
%>
<html>
<head>
<title>Q&A 게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/left.css" rel="stylesheet" type="text/css">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<jsp:include page="../left.jsp"/>
	<div class="content">
		<center><b>Q&A 게시판(전체 글:<%=count%>)</b>
		<table width="700">
		<tr>
		<!--     <a href="QNAWriteForm.jsp">글쓰기</a> -->
		     <td align="right" bgcolor="<%=value_c%>">
		    <%if(adminId != null){ %>
		    	<a href="sQNAWriteForm.jsp">글쓰기</a>
		    <%}else{%>
		    	<a href="stLoginForm.jsp">로그인</a>
		    <%}%> 
		    </td>
		</table>
		
		<%
		    if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
		    <td align="center">
		    게시판에 저장된 글이 없습니다.
		    </td>
		</table>
		
		<%  } else {    %>
		<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
		    <tr height="30" bgcolor="<%=value_c%>"> 
		      <td align="center"  width="50"  >번 호</td> 
		      <td align="center"  width="250" >제   목</td> 
		      <td align="center"  width="100" >작성자</td>
		      <td align="center"  width="150" >작성일</td> 
		     <!--  <td align="center"  width="50" >조 회</td>  -->
		      <td align="center"  width="100" >IP</td>    
		    </tr>
		<%  
		        for (int i = 0 ; i < articleList.size() ; i++) {
		        	QNADTO article = (QNADTO)articleList.get(i);
		%>
		   <tr height="30">
		    <td align="center"  width="50" > <%=number--%></td>
		    <td  width="250" >
			<%
			      int wid=0; 
			      if(article.getRe_level()>0){
			        wid=5*(article.getRe_level());
			%>
			  <img src="images/level.gif" width="<%=wid%>" height="16">
			  <img src="images/re.gif">
			<%}else{%>
			  <img src="images/level.gif" width="<%=wid%>" height="16">
			<%}%> 
		           
		      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
		           <%=article.getSubject()%></a> 
		          <% if(article.getReadcount()>=20){%>
		         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
		    <td align="center"  width="100"> 
		       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
		    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
		   <%--  <td align="center"  width="50"><%=article.getReadcount()%></td> --%>
		    <td align="center" width="100" ><%=article.getIp()%></td>
		  </tr>
		     <%}%>
		</table>
		<%}%>
		
		<%
		    if (count > 0) {
		        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
				 
		        int startPage = (int)(currentPage/10)*10+1;
				int pageBlock=10;
		        int endPage = startPage + pageBlock-1;
		        if (endPage > pageCount) endPage = pageCount;
		        
		        if (startPage > 10) {    %>
		        <a href="sQNAList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
		<%      }
		        for (int i = startPage ; i <= endPage ; i++) {  %>
		        <a href="sQNAList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
		<%
		        }
		        if (endPage < pageCount) {  %>
		        <a href="sQNAList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
		<%
		        }
		    }
		%>
	</div>
	<div>
	<footer class="secondary_header footer">
		    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
	 </footer>
	</div>
</body>
</html>