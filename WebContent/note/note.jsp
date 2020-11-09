<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>5조 프로젝트 사이트</title>
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">



</head>
<body>
<div class="container">
  <header>
    <div class="primary_header">
      <h1 class="title">학사관리시스템</h1>
    </div>
  </header>
  <div class="row">
    <div class="columns1">
    <%
    	
    	int seqno=0;
		String writer="";
		if (request.getParameter("seqno")!= null) {
			seqno = Integer.parseInt(request.getParameter("seqno"));
			writer=request.getParameter("writer");
		} %>
		
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
    </div>
    <div class="columns2">
      
     <jsp:include page="noteList.jsp"></jsp:include>
     
    </div>
  </div>
  <footer class="secondary_header footer">
    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
  </footer>
</div>
</body>
</html>
