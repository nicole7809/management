<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	//색깔보임
	String bodyback_c="#FFFFFF";//배경화이트<글내용볼때배경>
	String back_c="#F6F6F6";//화이트
	String title_c="#5CD1E5";//제목 파란색
	String value_c="#D5D5D5";//연한그레이
	String bar_c="#5D5D5D";//연한그레이
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
