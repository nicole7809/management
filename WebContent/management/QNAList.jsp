<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
	//색깔보임
	String bodyback_c="#CEECF5";
	String back_c="#BDBDBD";
	String title_c="#E6E6E6";
	String value_c="#848484";
	String bar_c="#F7819F";
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
	
	String memId = (String)session.getAttribute("memId");
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
<tr>
    <a href="QNAWriteForm.jsp">글쓰기</a>
  <%--   <td align="right" bgcolor="<%=value_c%>">
    <%if(memId != null){ %>
    	<a href="writeForm.jsp">글쓰기</a>
    <%}else{%>
    	<a href="/web/member/main.jsp">로그인</a>
    <%}%> --%>
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
      <td align="center"  width="50" >조 회</td> 
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
    <td align="center"  width="50"><%=article.getReadcount()%></td>
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
        <a href="QNAList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="QNAList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="QNAList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>