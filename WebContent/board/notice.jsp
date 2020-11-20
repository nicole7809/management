<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "team.elite.management.ControlDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "team.elite.management.NoticeDTO" %>

<style>
	a{text-decoration:none;}
</style>
<link href="../css/left.css" rel="stylesheet" type="text/css">
<%!
	int pageSize = 10;
	SimpleDateFormat sdf =
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%

	String adminId = (String)session.getAttribute("admin_id");
	String teacherId = (String)session.getAttribute("teacher_id");
	String studentId = (String)session.getAttribute("student_id");
	if(adminId ==null && teacherId ==null && studentId == null) {	// 로그인 유효성검사
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
	String pageNum = request.getParameter("pageNum");
	if (pageNum== null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;	//한페이지에서 보여지는 목록첫번호
	int endRow = currentPage * pageSize;				// 		"	목록 마지막번호
	int count = 0;
	int number=0;
	int important = 0;
	
	List noticeList = null; 
	List importantNotice = null;
    ControlDAO dbPro = ControlDAO.getInstance();
    count = dbPro.getNoticeCount();  				// 전체목록 수 확인
    if (count > 0) {
    	important = 0;
    	noticeList = dbPro.getNotice(startRow, endRow, important);
    }
    if (count > 0) {	
    	important = 1;
    	importantNotice = dbPro.getImportantNotice(startRow, endRow, important);	// 중요공지글리스트
    }

	number=count-(currentPage-1)*pageSize;			// 제목의 번호.
	   
	%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="../left.jsp"/>
	<div class="content">
		<center><b>글목록(전체 글:<%=count%>)</b> 
		<table width="700">
		<tr>
			<% 
			if(adminId != null ) {		// 세션 확인 후 행정인 경우만 글쓰기 가능. %>
		    <td align="right">        
		    	<a href="noticeWriteForm.jsp">글쓰기</a>
		    </td>	
		    <%} %>
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
		    <tr height="30" bgcolor="#f1f1f1"> 
		      <td align="center"  width="50"  >번 호</td> 
		      <td align="center"  width="250" >제   목</td> 
		      <td align="center"  width="100" >작성자</td>
		      <td align="center"  width="150" >작성일</td> 
		      <td align="center"  width="50" >조 회</td> 
		      <td align="center"  width="100" >IP</td>    
		    </tr>   
		<%  // 중요 공지글 맨위에 보여주는것...(고정하고 싶음..)
			if(importantNotice != null) {
				for (int im = 0; im <importantNotice.size() ; im++) {
					NoticeDTO notice = (NoticeDTO)importantNotice.get(im);	%>
					<tr height="30" bgcolor="958ac2">
					<td align="center"  width="50" > <%=number--%></td>
					<td  width="250" align="center" >  
						<a href="content.jsp?num=<%=notice.getNum()%>&pageNum=<%=currentPage%>">
			          <%=notice.getSubject()%></a> 
			    	</td>
			    	<td align="center"  width="100"> 
			       <%=notice.getWriter()%></td>
				    <td align="center" width="150"><%=sdf.format(notice.getReg_date())%></td>
				    <td align="center" width="150"><%=notice.getReadcount()%> </td>
				    <td align="center" width="100" ><%=notice.getIp()%></td>
			  	</tr>
				<%}
			}	
			// if 로 null이 아닌경우 for문 실행하게 하자
			if(noticeList != null){
				for (int i = 0 ; i < noticeList.size() ; i++) {
			    	NoticeDTO notice = (NoticeDTO)noticeList.get(i);
			%>
				<tr height="30">
					<td align="center"  width="50" > <%=number--%></td>
					<td  width="250" align="center" >  
						<a href="content.jsp?num=<%=notice.getNum()%>&pageNum=<%=currentPage%>">
			          <%=notice.getSubject()%></a> 
			    	</td>
			    	<td align="center"  width="100"> 
			       <%=notice.getWriter()%></td>
				    <td align="center" width="150"><%=sdf.format(notice.getReg_date())%></td>
				    <td align="center" width="150"><%=notice.getReadcount()%> </td>
				    <td align="center" width="100" ><%=notice.getIp()%></td>
			  	</tr>
			     <%}
		    }%>
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
		        <a href="notice.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
		<%      }
		        for (int i = startPage ; i <= endPage ; i++) {  %>
		        <a href="notice.jsp?pageNum=<%= i %>">[<%= i %>]</a>
		<%
		        }
		        if (endPage < pageCount) {  %>
		        <a href="notice.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
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

