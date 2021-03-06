<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<head>
<title>강의 등록</title>
<head>
<link href="../css/left.css" rel="stylesheet" type="text/css">
<link href="../css/mainTemplate.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		var userinput = eval("document.userinput");
		if (!document.userInfo.id.value) {
			alert("강의명 입력하세요.");
			return false;
		}
</script>
</head>
<jsp:include page="../left.jsp" />

<div class="container"> 
	<br> <br> <b><font size="6" color="gray">강의 정보 등록</font></b> <br>
	<br> <br>
	<center>

		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="lecturePro.jsp" name="userInfo"
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">강의명</td>
					<td><input type="text" size="50" name="lecture_name" /></td>
				</tr>
				<tr>
					<td id="title">강의 기간</td>
					<td><input type="text" size="50" name="lecture_course" /></td>
				</tr>
				<tr>
					<td id="title">강의 실</td>
					<td><input type="text" size="50" name="lecture_room" /></td>
				</tr>
				<tr>
					<td id="title">강사</td>
					<td><input type="text" size="50" name="teacher" /></td>
				</tr>
				<tr>
					<td id="title">수강생 이름</td>
					<td><input type="text" size="50" name="student" /></td>
				</tr>
				<tr>
					<td id="title">강의 코드</td>
					<td><input type="text" size="50" name="lecture_code" /></td>
				</tr>
			</table>
			<div><input type="submit" value="등록" class="button"/> 
				 <input type="reset" name="reset" value="다시입력" class="button"/>
				 </div>
		</form></center>
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
</html>