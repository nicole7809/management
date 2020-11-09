<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="team.elite.management.QNADTO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<title>QNA</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	//색깔보임
	String bodyback_c="#FFFFFF";//배경화이트<글내용볼때배경>
	String back_c="#F6F6F6";//화이트
	String title_c="#5CD1E5";//제목 파란색
	String value_c="#D5D5D5";//연한그레이
	String bar_c="#5D5D5D";//연한그레이
%>

<script type="text/javascript">
	function writeSave() {

		if (document.writeform.writer.value == "") {
			alert("작성자를 입력하십시요.");
			document.writeform.writer.focus();
			return false;
		}
		if (document.writeform.subject.value == "") {
			alert("제목을 입력하십시요.");
			document.writeform.subject.focus();
			return false;
		}

		if (document.writeform.content.value == "") {
			alert("내용을 입력하십시요.");
			document.writeform.content.focus();
			return false;
		}

		if (document.writeform.password.value == "") {
			alert(" 비밀번호를 입력하십시요.");
			document.writeform.passwd.focus();
			return false;
		}
	}
</script>


<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
	  ControlDAO dbPro = ControlDAO.getInstance();
	  QNADTO article =  dbPro.updateGetArticle(num);

%>

<body bgcolor="<%=bodyback_c%>">  
<center><b>글수정</b>
<br>
<form method="post" name="QNAWriteForm" action="QNAUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>">
	   <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=article.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="passwd">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
<%
}catch(Exception e){}%>      
      
</body>
</html>      
   