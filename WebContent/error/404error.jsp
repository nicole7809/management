<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/intro.css" />
<head>
<title>404에러 페이지</title>
</head>
<body>
<section>
	<h2><span class="en">요청하신 페이지는 존재하지 않습니다.</br>404 ERROR / 我是404</span></h2>
        <p class="sub_text">학생아이디 발급시스템은 "행정모드 로그인" 후 이용 가능합니다.</p>
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
	