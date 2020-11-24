<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "team.elite.management.ControlDAO" %>
<%@ page import="team.elite.management.Student_MembersDTO" %>

<html>
<body>

<%
	//post타입 인코딩하기
	request.setCharacterEncoding("UTF-8");


%>									
	<jsp:useBean id="dto" class="team.elite.management.Student_MembersDTO" />
	<jsp:setProperty property= "*" name = "dto" />
	
<%
		String auto = request.getParameter("auto");	
		

		String student_id = null, password = null; auto = null;		//기본 값 
		Cookie [] cookies = request.getCookies();
		if(cookies != null) {		//자동로그인이 안된 상태면 null.
			for(Cookie c : cookies) {
				if(c.getName().equals("cid")) {
					student_id = c.getValue();
					dto.setStudent_id(student_id);
				}
				if(c.getName().equals("cpw")) {
					password = c.getValue();
					dto.setPassword(password);
				}
				if(c.getName().equals("cauto")) {
					auto = c.getValue();
					dto.setAuto(auto);
				}
			}
		}
		
		
		//dao 만들어서  = dao.getInstance();하고 id/pw확인하기
		ControlDAO dao = ControlDAO.getInstance();	
		int state = dao.studentState(dto);
		int check = dao.studentCheck(dto);
		if(state == 5){		// 탈퇴처리 된 상태라면 
		System.out.println("dd");
		%>
		<script>
			alert("탈퇴아이디 입니다.");
			history.go(-1);
		</script>
		<%return;		// 강제 탈출의미.
		}
		if(check == 1) {	// 아이디 있다면
			session.setAttribute("student_id", dto.getStudent_id()); 	//세션 생성
			if(dto.getAuto() != null && dto.getAuto().equals("1")) {	//자동로그인에 체크되어있다면.
				Cookie cid = new Cookie("cid", dto.getStudent_id());
				Cookie cpw = new Cookie("cpw", dto.getPassword());
				Cookie cauto = new Cookie("cauto", dto.getAuto());
				cid.setMaxAge(60*60);
				cpw.setMaxAge(60*60);
				cauto.setMaxAge(60*60);
				response.addCookie(cid);
				response.addCookie(cpw);
				response.addCookie(cauto);
			}
			response.sendRedirect("studentMain.jsp");	//---------- 쿠키로 로그인 되어 teacherMain.으로 이동
		}else if( check == 0) {								//---------- 비밀번호 불일치	%>
			<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);									//---------- 전 페이지로 이동.
		</script>	
		<%}else if( check == -1) {											//---------- 아이디 검색 안됨. %>
		<script>
			alert("아이디가 맞지 않습니다.");
			history.go(-1);
		</script>
		<%}%>
</body>
</html>
