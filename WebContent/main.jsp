<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>5조 프로젝트 사이트</title>
<link href="css/mainTemplate.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="container">
  <header>
    <div class="primary_header">
      <h1 class="title">학사관리시스템</h1>
    </div>
    <nav class="secondary_header" id="menu">
      <ul class="title">
        <li><a href="mgtLoginForm.jsp">STAFF</a></li>
        <li><a href="tcLoginForm.jsp">TEACHER</a></li>
        <li><a href="stLoginForm.jsp">STUDENT</a></li>
      </ul>
    </nav>
  </header>
  <div class="row">
    <div class="columns">
      <a href="mgtLoginForm.jsp"><p class="thumbnail_align"> <img src="img/bkg_01.jpg" alt="" class="thumbnail"/> </p>
      <h4>STAFF</h4>
      <p>학원스텝은 학원스텝아이디로 로그인합니다.</p></a>
    </div>
    <div class="columns">
      <a href=tcLoginForm.jsp><p class="thumbnail_align"> <img src="img/bkg_02.jpg" alt="" class="thumbnail"/> </p>
      <h4>TEACHER</h4>
      <p>강사는 강사 아이디로 로그인합니다.</p></a>
    </div>
    <div class="columns">
     <a href="stLoginForm.jsp"><p class="thumbnail_align"> <img src="img/bkg_03.jpg" alt="" class="thumbnail"/> </p>
      <h4>STUDENT</h4>
      <p>학생은 학생으로 로그인합니다.</p></a>
    </div>
  </div>
  <footer class="secondary_header footer">
    <div class="copyright">&copy;2020 - <strong>5조 프로젝트 - 학사관리시스템 사이트</strong></div>
  </footer>
</div>
</body>
</html>
