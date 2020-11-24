<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="UTF-8">
    <title>5조 학사관리사이트 인트로</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="5조 학사관리사이트 인트로"/>

    <link rel="canonical" href="/rfgdbfd/" />
    <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/intro.css" />
    <link rel="stylesheet" type="text/css" href="../css/mainTemplate.css" />
</head>
<body>
    <header>
        <h1 class="logo"><a href="/Total.Management.System/">5조 학사관리사이트</a></h1>
    </header>

    <section>
        <h2><span class="en"><br /><br /></span> </h2>

        <div>
<%
			//자동로그인상태라면 login되야하기에 먼저 쿠키확인하기 -> 조건 맞으면 pro로 이동.
			
			String admin_id = null, password= null, auto= null;		// 기본값
			Cookie [] cookies = request.getCookies();
			if(cookies != null) { 						// 자동 로그인 안된 상태면 null이라 form(로그인) 화면 뜸.
				for(Cookie c : cookies) {
					if(c.getName().equals("cid"))
						admin_id = c.getValue();				// 하나의 명령만 있을땐 {} 생략 가능
					if(c.getName().equals("cpw"))
	    				password = c.getValue();
	    			if(c.getName().equals("cauto"))
	    				auto = c.getValue();
				}
			}
			if(auto != null && admin_id != null && password != null) {
				response.sendRedirect("mgtLoginPro.jsp");
			}
		%>	
		
<body>
		<h1 class="title">행정로그인</h1>
		<div class="button_wrap">
		
		<form action= "mgtLoginPro.jsp" method="post" > 
			<table border="1" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td><h4 class="title"> 아이디 :  </h4></td>
						<td> <input type="text" name ="admin_id" /> </td>
					</tr>
					<tr>
						<td><h4 class="title"> 비밀번호 : </h4></td>
						<td> <input type="password" name="password" /> </td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="checkbox" name="auto" value="1" /><h class="title"> 자동로그인  </h><br><br>
							<input type="submit" value="로그인" class="button"/>
							<input type="button" value="메인" onclick="window.location='../main.jsp'" class="button"/>
						</td>
					</tr>
				</table>
		</form></div>
	</div></section>
        <footer>
        <p class="copyright">Ⓒ 2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</p>
    </footer>
</body>
</html>