<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "logon.logonDAO" %>

<%
	// post타입 인코딩
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id = "dto" class = "logon.tcLogonDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
<%
	// 쿠키 확인
	String auto = request.getParameter("auto");
	
	String TEACHER_ID = null, PASSWORD = null; auto = null;
	Cookie [] cookies = request.getCookies();
	if(cookies != null ) {
		for(Cookie c : cookies) {
			if(c.getName().equals("cid")) {
				TEACHER_ID = c.getValue();
				dto.setTEACHER_ID(TEACHER_ID);
			}
			if(c.getName().equals("cpw")) {
				PASSWORD = c.getValue();
				dto.setPASSWORD(PASSWORD);
			}
			if(c.getName().equals("cauto")) {
				auto = c.getValue();
				dto.setAuto(auto);
			}
		}
	}
	
	//id, pw 확인
	logonDAO dao = logonDAO.getInstance();
	int check = dao.teacherCheck(TEACHER_ID, PASSWORD);
	if(check == 1) {	// 아이디 있다면
		session.setAttribute("TEACHER_ID", dto.getTEACHER_ID()); 	//세션 생성
		if(dto.getAuto() != null && dto.getAuto().equals("1")) {	//자동로그인에 체크되어있다면.
			Cookie cid = new Cookie("cid", dto.getTEACHER_ID());
			Cookie cpw = new Cookie("cpw", dto.getPASSWORD());
			Cookie cauto = new Cookie("cauto", dto.getAuto());
			cid.setMaxAge(60*60);
			cpw.setMaxAge(60*60);
			cauto.setMaxAge(60*60);
		}
		response.sendRedirect("teacherMain.jsp");
	}else if (check == 1) {											//아이디,비번 일치.
		session.setAttribute("TEACHER_ID", TEACHER_ID);
		response.sendRedirect("teacherMain.jsp");
	}else if( check == 0) {											// 비밀번호 불일치	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);												//전 페이지로 이동.
	</script>	
	<%}else {														//아이디 검색 안됨. %>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%}%>