<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<head>
<title>강의 등록</title>

<!-- css 파일 분리 -->
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />

<style>
div {
	text-align: center
}
</style>

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
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">강의 등록</font></b> <br>
		<br> <br>


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="lecturePro.jsp" name="userInfo"
			onsubmit="return checkValue()">
			<table>
			
				<tr>
					<td id="title">강의명</td>
					<td><input type="text" size="50" name="lecture_name"/></td>
				</tr>

				

				<tr>
					<td id="title">강의 기간</td>
					<td><input type="text" size="50" name="lecture_course"/></td>
				</tr>
				
				<tr>
					<td id="title">강의 실</td>
					<td><input type="text" size="50" name="lecture_room" /></td>
				</tr>
				
				<tr>
					<td id="title">강사</td>
					<td><input type="text" size="50" name="teacher" /></td>
				</tr>
				
			</table>
			<br> 
			 <input type="submit" value="등록" />
			 <input type="reset" name="reset" value="다시입력" />
		</form>

	</div>
</body>
</html>