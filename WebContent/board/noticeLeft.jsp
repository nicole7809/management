<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	// �α��� ��ȿ�� �˻�
	String sessionId = (String)session.getAttribute("admin_id");
	if(sessionId == null) {
		response.sendRedirect("/Total.Management.System/main.jsp");
	}
		
%>
<div class="sidebar">
  <a class="active" href="/Total.Management.System/management/managementMain.jsp">Home</a>
  <a href ="managementInfo.jsp"><%=sessionId %> [��]</a>
  <a href="/Total.Management.System/management/courseList.jsp">���Ǹ���Ʈ</a>
  <a href="/Total.Management.System/student/studentList.jsp">�л�����Ʈ</a>
  <a href="/Total.Management.System/board/notice.jsp">��������</a>
  <a href="/Total.Management.System/management/QNAList.jsp">Q&A�Խ���</a>
  <a href="/Total.Management.System/management/logout.jsp">�α׾ƿ�</a>
</div>
</body>
</html>