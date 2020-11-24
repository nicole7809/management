
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/intro.css" />
<head>
<title>500에러 페이지</title>
</head>
<body>
<section>
	<h2><span class="en">서비스 사용에 불편을 끼쳐드려서 대단히 죄송합니다.</br>500 ERROR</span></h2>
        <p class="sub_text">빠른시간내에 문제를 처리하겠습니다.</p>
  	<div class="button_wrap">
            <div class="portal_link">
                <a class="old" href="../main.jsp"><img src="../img/old_icon.svg" alt>GO! MAIN</a>
            </div>

        </div>
</section>
	<footer>
        <p>Ⓒ 2020 EAGLE FIVE. All Rights Reserved.</p>
    </footer>

    <div class="wave-bg">
        <div class="wave-wrapper bg-top"><div class="wave wave-top"></div></div>
        <div class="wave-wrapper bg-mid"><div class="wave wave-mid"></div></div>
        <div class="wave-wrapper bg-bt"><div class="wave wave-bt"></div></div>
    </div>  
</body>
</html>
