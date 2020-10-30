<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<body>
	
		<h2> 학생 로그인 페이지 </h2>
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
 	
		<form action= "stLoginPro.jsp" method="post" > 
				<h3 align="center"> 학생 </h3>
				
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
							<input type="button" value="메인" onclik="window.location='main.jsp'" />
						</td>
					</tr>
				</table>
		</form>
	
	</body>
</html>					
					
					
<%--					
			<%	}else if (value==2) { %>
					<h3 align="center"> 강사</h3>
					
					<table border="1" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td> 아이디 :  </td>
							<td> <input type="text" name ="TEACHER_ID" /> </td>
						</tr>
						<tr>
							<td> 비밀번호 : </td>
							<td> <input type="password" name="PASSWORD" /> </td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="checkbox" name="auto" value="1" /> 자동로그인  <br><br>
								<input type="submit" value="로그인" />
								<input type="button" value="메인" onclik="window.location='메인으로 가게하면 됨'" />
							</td>
						</tr>
					</table>
			<%	}else{		%>		
				<h3 align="center"> 행정</h3>
			<%} %>
			<table border="1" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td> 아이디 :  </td>
							<td> <input type="text" name ="STUDENT_ID" /> </td>
						</tr>
						<tr>
							<td> 비밀번호 : </td>
							<td> <input type="password" name="PASSWORD" /> </td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="checkbox" name="auto" value="1" /> 자동로그인  <br><br>
								<input type="submit" value="로그인" />
								<input type="button" value="메인" onclik="window.location='메인으로 가게하면 됨'" />
							</td>
						</tr>
					</table>
		--%>
