<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 로그인</title>
<link href="/Total.Management.System/css/mainTemplate.css" rel="stylesheet" type="text/css">
<div class="wrapper">

    <div id="web_bg" style="background-image: url(/Total.Management.System/img/MainDesktop.png);"></div>
  
</div>

</head>
		<%
			//자동로그인상태라면 login되야하기에 먼저 쿠키확인하기 -> 조건 맞으면 pro로 이동.
			
			String student_id = null, password= null, auto= null;		// 기본값
			Cookie [] cookies = request.getCookies();
			if(cookies != null) { 						// 자동 로그인 안된 상태면 null이라 form(로그인) 화면 뜸.
				for(Cookie c : cookies) {
					if(c.getName().equals("cid"))
						student_id = c.getValue();				// 하나의 명령만 있을땐 {} 생략 가능
					if(c.getName().equals("cpw"))
	    				password = c.getValue();
	    			if(c.getName().equals("cauto"))
	    				auto = c.getValue();
				}
			}
			if(auto != null && student_id != null && password != null) {
				response.sendRedirect("stLoginPro.jsp");
			}
		%>	


<body>
	<div class="container">
	
		<header>
			<div class="primary_header">
				<h1 class="title">학사관리시스템</h1>
			</div>
		</header>
		
		
		<br/><br/><br/>
		<div class="row">
			
				<a href="/Total.Management.System/student/stLoginForm.jsp"><p class="thumbnail_align">
						<img src="/Total.Management.System/img/student.png" alt="" class="thumbnail" />
					</p></a>
					<h2 class="title">학생 로그인</h2>
					<!-- <p>학생은 학생으로 로그인합니다.</p> -->
			</div>

		<form action= "stLoginPro.jsp" method="post" > 
			
				
				<table border="1" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td> 아이디 :  </td>
						<td> <input type="text" name ="student_id" /> </td>
					</tr>
					<tr>
						<td> 비밀번호 : </td>
						<td> <input type="password" name="password" /> </td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="checkbox" name="auto" value="1" /> 자동로그인  <br><br>
							<input type="submit" value="로그인" />
							<input type="button" value="메인" onclick="window.location='../main.jsp'" />
						</td>
					</tr>
				</table>
		</form>
	
</div>
		<br/><br/><br/><br/><br/><br/>
		
		<footer class="secondary_header footer">
			<div class="copyright">
				&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong>
			</div>
		</footer>
	</div>
</body>
</html>				
					

