<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "team.elite.management.ControlDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="team.elite.management.NoticeDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	article.setReg_ip(request.getRemoteAddr());

	ControlDAO dbPro = ControlDAO.getInstance();
    dbPro.insertArticle(article);

    response.sendRedirect("notice.jsp");
%>




