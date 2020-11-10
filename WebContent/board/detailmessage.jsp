<%@ page contentType = "text/html; charset=euc-kr" %>
<%@page import = "team.elite.management.ControlDAO" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%
	//������
	String bodyback_c="#CEECF5";
	String back_c="#BDBDBD";
	String title_c="#E6E6E6";
	String value_c="#848484";
	String bar_c="#F7819F";
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      ControlDAO dbPro = ControlDAO.getInstance(); 
      noticeDTO article =  dbPro.getArticle(num);
  
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
<body bgcolor="<%=bodyback_c%>">  
<center><b>�۳��� ����</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="">�۹�ȣ</td>
    <td align="center" width="125" align="center">
	     <%=article.getNotice_seqno()%></td>
    <td align="center" width="125" bgcolor="">��ȸ��</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="">�ۼ���</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125" bgcolor="" >�ۼ���</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="">������</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="">�۳���</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="" align="right" > 
    <%String memId = (String)session.getAttribute("memId");
    if(memId != null){
    	if(memId.equals(article.getWriter())){
    %>
	  <input type="button" value="�ۼ���" 
       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="�ۻ���" 
       onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%}
	   if(memId.equals("admin")){//�����ڸ� ������ ����!!
	   %>
	   <input type="button" value="������ �ۻ���" 
       onclick="document.location.href='deleteAdminpro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="��۾���" 
       onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%} 
	 }%>  
       <input type="button" value="�۸��" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>      
</body>
</html>      
