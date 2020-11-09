<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "team.elite.management.QNADTO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%
	//색깔보임
	String bodyback_c="#CEECF5";
	String back_c="#BDBDBD";
	String title_c="#E6E6E6";
	String value_c="#848484";
	String bar_c="#F7819F";
%>

<% //한페이지 글갯수+글에 년도 나타냄
	int pageSize = 10;
	SimpleDateFormat sdf = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<% //페이지!!!
	String pageNum = request.getParameter("pageNum");
	if(pageNum ==null){pageNum ="1";}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number=0;
	
	//List articleList = null;
	//BoardDBBean dbPro = BoardDBBean.getInstance();
	//count = dbPro.getArticlecount();
	//if (count>0){ articleList = dbPro.getArticles(startRow,endRow); }
	number = count-(currentPage-1)*pageSize;
	String memId = (String)session.getAttribute("memId");
%>
<% //리스트이미지 나오게 하기 %>
<h1>게시판</h1>
<html>

<head>
<title>QNA</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count %>)</b>
<table width="500">
<tr>
	<td align="right" bgcolor="<%=value_c%>">
	<%if(memId != null) {%>
	<a href="qnawriteForm.jsp">글쓰기</a>
	<%}%>
	</td>
</table>

<%
	if (count == 0) {
%>
<table width="500" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	게시판에 저장된 글이 없당!!
	</td>
</table>

<%	}else{ %>
<table border="1" width="500" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="<%=value_c%>">
	<td align="center"	width="50" >번호</td>
	<td align="center"  width="250">제목</td>
	<td align="center"  width="100">작성자</td>
	<td align="center"  width="100">날짜</td>
	</tr>
<%
	//for (int i = 0 ; i <articleList.size() ; i++){
		//BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
	<tr height="30">
	<td align="center" width="50"> <%=number--%></td>
	<td width ="250">
	<%
		int wid=0;
		if(article.getRe_level()>0){
		wid=5*(article.getRe_level());
	%>
	<img src="images/level.gif" width="<%=wid %>" height="16">
	<img src="images/re.gif">
	<%}else{%>
		<img src="images/level.gif" width="<%=wid %>" height="16">
		<%}%>
	<a href ="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
		<%=article.getSubject()%></a> 
          <% if(article.getReadcount()>=20){%>
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
	<td align="center"  width="100">
	 <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="100"><%= sdf.format(article.getReg_date())%></td>
</tr>
	<%}%>
</table>


<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>

       <%}}%>
     
    

</center>
</body>
</html>





 	  