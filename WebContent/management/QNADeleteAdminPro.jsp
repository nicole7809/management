<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	//색깔보임
	String bodyback_c="#CEECF5";
	String back_c="#BDBDBD";
	String title_c="#E6E6E6";
	String value_c="#848484";
	String bar_c="#F7819F";
%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

  ControlDAO dbPro = ControlDAO.getInstance();
  int check = dbPro.deleteArticle(num);

  if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=QNAList.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
       <script language="JavaScript">      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
      </script>
<%
    }
 %>
