<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.elite.management.Admin_MembersDTO"%>
<%@ page import="team.elite.management.ControlDAO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<head>
	<link href="../css/left.css" rel="stylesheet" type="text/css">
    <link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
	//세션꺼내기 /확인!!! 
	String sessionId = (String) session.getAttribute("admin_id");
	if (sessionId == null) {
		response.sendRedirect("mgtLoginForm.jsp");

	}
	ControlDAO dao = ControlDAO.getInstance();
	Admin_MembersDTO dto = dao.managementInfo(sessionId);
%>

<jsp:include page="../left.jsp"/>
	<div class="content">
<form action="maupdatePro.jsp" method="post" enctype="multipart/form-data">
<center>
	<body>
		<table border=2 width="50%" height="70" bordercolor="skyblue">
 			<p class="primary_header">관리자 개인 정보 수정</p>
			<tr>
				<td>관리자 아이디 :</td>
				<td><%=dto.getAdmin_id()%></td>
				<input type="hidden" name="admin_id" value="<%=dto.getAdmin_id()%>" />
			</tr>
			<tr>
				<td>관리자 이름 :</td>
				<td><%=dto.getAdmin_name()%></td>
				<input type="hidden" name="admin_name" value="<%=dto.getAdmin_name()%>" />
			</tr>

			<tr>
				<td>관리자 PW :</td>
				<td><input type="password" name="password"
					value="<%=dto.getPassword()%>" /></td>
			</tr>

			<tr>
				<td>Email :</td>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>" /></td>
			</tr>

			<tr>
				<td>Phone :</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>" /></td>
			</tr>


			<tr>
				<td>사진 :</td>
				<td>
				<input type="file" name="Admin_pic"/><br />
	    		<input type="hidden" name="sysImg" value="<%=dto.getAdmin_pic() %>" />
	    		<img src="/Total.Management.System/img/<%=dto.getAdmin_pic() %>" />
				
				
				</td>
				
			</tr>

			<tr>
				<td>가입날짜 :</td>
				<td><%=dto.getReg_date()%></td>
			</tr>


		</table>
	</body>
	<input type="submit" value="정보수정" class="button"/>

<center/>

</form>
</div>
	<div>
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
