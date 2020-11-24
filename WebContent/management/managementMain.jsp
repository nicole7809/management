<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "team.elite.management.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "team.elite.management.NoticeDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 행정 메인</title>	
		<link href="../css/left.css" rel="stylesheet" type="text/css">
		<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
	</head>
	<%! int pageSize = 3;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("admin_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
		//중요공지사항 보기위한 작업.
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize +1;	// 한페이지에서 보여지는 목록 
		int endRow = currentPage * pageSize;
		int count = 0;
		int number= 0;
		int important  = 0;
		
		List importantNotice = null;
		ControlDAO dao = ControlDAO.getInstance();
		count = dao.getNoticeCount();					//  목록 수 확인
		if(count > 0) {
			important = 1;
			importantNotice = dao.getImportantNotice(startRow, endRow, important);	//중요 공지리스트
		}
		number = count-(currentPage-1)*pageSize;	//제목의 번호.
	%>
	<body>
	    
		<jsp:include page="../left.jsp"/>
		<div class="primary_header">
      	<h1 class="title"> 행정 모드</h1>
    	</div>
		<div class="content">
		<h2>중요공지글</h2>
		<%
			if(count == 0) {		%>
			<table width = "700" border="1" cellpadding="0" cellspacing="0" align="center">
				<tr><td align="center"> 중요공지가 없습니다. </td></tr>
			</table>
		<%}else { %>
		<a href = "/Total.Management.System/board/notice.jsp"> 더보기 </a>
		<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
		    <tr height="30" bgcolor="#f1f1f1"> 
		      <td align="center"  width="250" >제   목</td> 
		      <td align="center"  width="100" >작성자</td>
		      <td align="center"  width="150" >작성일</td> 
		      <td align="center"  width="50" >조 회</td> 
		      <td align="center"  width="100" >IP</td>    
		    </tr>
		<%	//중요공지글을 보여줌.
			if(importantNotice != null) {
				for(int im = 0; im < importantNotice.size(); im++) {
				NoticeDTO notice = (NoticeDTO)importantNotice.get(im);	%>
				<tr height="30" bgcolor="#d3ff33">
					<td  width="250" align="center" >  
						<a href="/Total.Management.System/board/content.jsp?num=<%=notice.getNum()%>&pageNum=<%=currentPage%>">
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
		}%>	
		</div>
	<div>
</div></table>
					
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


		
				
				
				