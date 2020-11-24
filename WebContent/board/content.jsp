<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team.elite.management.NoticeDTO" %>
<%@ page import = "team.elite.management.ControlDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/left.css" rel="stylesheet" type="text/css">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>

<%
	String adminId = (String)session.getAttribute("admin_id");
	String teacherId = (String)session.getAttribute("teacher_id");
	String studentId = (String)session.getAttribute("student_id");
	if(adminId ==null && teacherId ==null && studentId == null) {	// 로그인 유효성검사
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf  = 
		new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
	try{
		ControlDAO dbPro = ControlDAO.getInstance();
		NoticeDTO article = dbPro.getNotice(num);    
		
		
%>
<body>
<jsp:include page="../left.jsp"/>
<div class="content">
	<p class="primary_header">글내용 보기</p>
	<br>
	<form>
	<table width="80%" border="1" cellspacing="0" cellpadding="0"  bgcolor="" align="center">  
	  <tr height="30">
	    <td align="center" width="125" bgcolor="">글번호</td>
	    <td align="center" width="125" align="center">
		     <%=article.getNum()%></td>
	    <td align="center" width="125" bgcolor="">조회수</td>
	    <td align="center" width="125" align="center">
		     <%=article.getReadcount()%></td>
	  </tr>
	  <tr height="30">
	    <td align="center" width="125" bgcolor="">작성자</td>
	    <td align="center" width="125" align="center">
		     <%=article.getWriter()%></td>
	    <td align="center" width="125" bgcolor="" >작성일</td>
	    <td align="center" width="125" align="center">
		     <%= sdf.format(article.getReg_date())%></td>
	  </tr>
	  <tr height="30">
	    <td align="center" width="125" bgcolor="">글제목</td>
	    <td align="center" width="375" align="center" colspan="3">
		     <%=article.getSubject()%></td>
	  </tr>
	  <tr>
	    <td align="center" width="125" bgcolor="">글내용</td>
	    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
	  </tr>
	  <tr>      
	    <td colspan="4" bgcolor="" align="center" > 
	    <% if(adminId != null) {	%>
		  <input type="button" value="글수정" 
	       onclick="document.location.href='noticeUpdate.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'" class="button">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="글삭제" 
	       onclick="document.location.href='noticeDeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'" class="button">
		   &nbsp;&nbsp;&nbsp;&nbsp; 
		<%} %>
	       <input type="button" value="글목록" 
	       onclick="document.location.href='notice.jsp?pageNum=<%=pageNum%>'" class="button">
	    </td>
	  </tr>
	</table>    
	<%
	 }catch(Exception e){} 
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
