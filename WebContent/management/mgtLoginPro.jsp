<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "team.elite.management.ControlDAO" %>

<%
	// post타입 인코딩
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id = "dto" class = "team.elite.management.Admin_MembersDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
<%
	// 쿠키 확인
	String auto = request.getParameter("auto");
	
	String admin_id = null, password = null; auto = null;
	Cookie [] cookies = request.getCookies();
	if(cookies != null ) {
		for(Cookie c : cookies) {
			if(c.getName().equals("cid")) {
				admin_id = c.getValue();
				dto.setAdmin_id(admin_id);
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
	
	//id, pw 확인
	ControlDAO dao = ControlDAO.getInstance();		// 메서드 다시
	int check = dao.adminCheck(dto);
	if(check == 1) {	// 아이디 있다면
		session.setAttribute("admin_id", dto.getAdmin_id()); 	//세션 생성
		if(dto.getAuto() != null && dto.getAuto().equals("1")) {	//자동로그인에 체크되어있다면.
			Cookie cid = new Cookie("cid", dto.getAdmin_id());
			Cookie cpw = new Cookie("cpw", dto.getPassword());
			Cookie cauto = new Cookie("cauto", dto.getAuto());
			cid.setMaxAge(60*60);
			cpw.setMaxAge(60*60);
			cauto.setMaxAge(60*60);
			response.addCookie(cid);
			response.addCookie(cpw);
			response.addCookie(cauto);
		}
		response.sendRedirect("managementMain.jsp");	//---------- 쿠키로 로그인 되어 manageMentMain.으로 이동
	}else if( check == 0) {								//---------- 비밀번호 불일치	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);									//---------- 전 페이지로 이동.
	</script>	
	<%}else {											//---------- 아이디 검색 안됨. %>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%}%>