<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "team.elite.management.*" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 학생 메인</title>
		<link href="/Total.Management.System//css/mainTemplate.css" rel="stylesheet" type="text/css">
		<style>
			.menu{background-color:#B3B3B3; width:20%; padding-top:15px; padding-bottom:15px; text-align:center;}
		</style>
	</head>
	<%
		// 로그인 유효성 검사	( sessionId에 student_id 가 있을때 실행 아니면 메인페이지로 이동.)
		String sessionId = (String)session.getAttribute("student_id");
		if(sessionId == null) {
			response.sendRedirect("/Total.Management.System/main.jsp");		
		}
		
	%>
	<body>
		<table border ="0" cellpadding="0" cellspacing="0" width="100%" align="center">
			<tr>
				<td class="menu"> <a href ="/Total.Management.System/studentInfo.jsp"> <%=sessionId %> </a></td>
				<td align= "center" rowspan="6" bgcolor="#E4F7BA">
					페이지 선택 시 실행 될 곳... 어떻게 하지?<br>
					이렇게 include하면 되는 거아닌가 왜 안되지? jsp:include page="/Total.Management.System/board/notice.jsp"/>
				</td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/courseList.jsp"> 내 강의</a> </td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/schdule.jsp"> 일정</a> </td>
			</tr>
			<tr>
				<td class="menu" > <a href ="/Total.Management.System/memo.jsp"> 메모</a> </td>
			</tr>
			<tr>
				<td class="menu"> <a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </td>
			</tr>
			<tr>
				<td class="menu"><a href ="/Total.Management.System/board/message.jsp"> Q & A </a> </td>
			</tr>

		</table>
		<%-- 	얜 모르겟음
		<style>
		.container{}
			.left{float:left;}
			.left ul{ color:#FFFFFF; font-style:normal;  padding-bottom:50px; margin-top: 10%;}
			.left ul li{text-align:center; list-style: none; padding-top:15px; padding-bottom:15px; }
			.center{ text-align:center; }
		</style>
		<div class = "container">
			<div class = "left" >
				<ul>
					<li><a href ="/Total.Management.System/studentInfo.jsp"> student </a> </li>
					<li><a href ="/Total.Management.System/courseList.jsp"> 내 강의</a> </li>
					<li><a href ="/Total.Management.System/schdule.jsp"> 일정</a> </li>
					<li><a href ="/Total.Management.System/memo.jsp"> 메모</a> </li>
					<li><a href ="/Total.Management.System/board/notice.jsp"> 공지사항 </a> </li>
					<li><a href ="/Total.Management.System/massage.jsp"> Q & A </a> </li>
				</ul>
			</div>
			<div class = "center">
				<p> 여기엔 뭐가 있어야 할까요? <br>
					각 페이지를 만들어서 이부분에 include 하면 되는 걸까요? 
				</p>
			</div>
				
--%>
			<footer class="secondary_header footer">
   				 <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
 			</footer>
	</body>
</html>


		
				
				
				