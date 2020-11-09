<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
	/* 	String sessionId = (String)session.getAttribute("student_id");
	
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		} */
		
		int seqno=0;
		String writer="";
		if (request.getParameter("seqno")!= null) {
			seqno = Integer.parseInt(request.getParameter("seqno"));
			writer=request.getParameter("writer");
		}
	
	
	%>
	<form action="noteWritePro.jsp" onsubmit="return writeSave()" method="post" >
		<input type ="hidden" name="seqno" value="<%=seqno%>" />
		<input type="hidden" name="writer" value="<%=writer%>" />
    	<table  border="1" cellpadding="0" cellspacing="0" align="center">
    		<tr>
    			<td align="center"> 제목  <input type="text" size="20" maxlength="30" name="subject" /></td>
    		</tr>
    		<tr>
    			<td align="center" > <textarea name="content" rows="13" cols="30"> </textarea> </td>
    		</tr>
    		<tr>
    			<td align="center" >
    				<input type="submit" value="저장" >
    				<input type="reset" value="다시쓰기" >
    			</td>
    	</table>
    </form>
</body>
</html>