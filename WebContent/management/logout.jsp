<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>logout</title>
	</head>
	<body>
	
		<%
			// 로그아웃 - 세션 삭제
			session.invalidate();
			//쿠키도 삭제
			Cookie [] cookies = request.getCookies();
			if(cookies != null) {
				 for(Cookie c : cookies) {
					if(c.getName().equals("cid")) {
						c.setMaxAge(0);				// 쿠키유효시간을 0으로 하고
						response.addCookie(c);		// 그걸 쿠키에 추가해라 -> 즉 쿠키삭제시키는것.
						
					}		
					if(c.getName().equals("cpw")) {
						c.setMaxAge(0);
						response.addCookie(c);
						
					}					
					if(c.getName().equals("cauto")) {
						c.setMaxAge(0);
						response.addCookie(c);
						
					}
				}
			} // 쿠키 확인 {  %>
		
		<script>
			alert("로그아웃 되었습니다.");
			window.location="/Total.Management.System/main.jsp";
		</script>

	</body>
</html>