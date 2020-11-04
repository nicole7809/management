<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "team.elite.management.ControlDAO" %>
<%@ page import = "team.elite.management.QNADTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>



<%
	String bodyback_c="#e0ffff";
	String back_c="#8fbc8f";
	String title_c="#5f9ea0";
	String value_c="#b0e0e6";
	String bar="#778899";
%>


<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
	   ControlDAO dbPro = ControlDAO.getInstance();
	   QNADTO article =  dbPro.getArticle(num);
  
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
<body bgcolor="<%=bodyback_c%>">  
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
    <td align="center" width="125" align="center">
	     <%=article.getNum()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>" >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="<%=value_c%>" align="right" > 
	  <%
	  	String memId = (String)session.getAttribute("memId");
	  	if(memId != null){
	  		if(memId.equals(article.getWriter())){
	  %>
		  <input type="button" value="글수정" 
	       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="글삭제" 
	       onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		   <%}
		   if(memId.equals("admin")){
		   %>
		   	  <input type="button" value="관리자 글삭제" 
		       onclick="document.location.href='deleteAdminPro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
		      <input type="button" value="답글쓰기" 
		       onclick="document.location.href='QNAWriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
		   <%}
		   }%>
	   
       <input type="button" value="글목록" 
       onclick="document.location.href='QNAlist.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>      
</body>
</html>  