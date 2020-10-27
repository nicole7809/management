<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= "logon.logonDAO" %>

<%
	//post타입 인코딩하기
	request.setCharacterEncoding("UTF-8");

//	String id = request.getParameter("STUDENT_ID");
//	String pw = request.getParameter("PASSWORD");
%>
	<jsp:useBean id = "dto" class = "logon.stLogonDTO"/>
	<jsp:setProperty property= "*" name = "dto" />
	
<%
		String auto = request.getParameter("auto");	
		

		String STUDENT_ID = null, PASSWORD = null; auto = null;		//기본 값 
		Cookie [] cookies = request.getCookies();
		if(cookies != null) {		//자동로그인이 안된 상태면 null.
			for(Cookie c : cookies) {
				if(c.getName().equals("cid")) {
					STUDENT_ID = c.getValue();
					dto.setSTUDENT_ID(STUDENT_ID);
				}
				if(c.getName().equals("cpw")) {
					PASSWORD = c.getValue();
					dto.setSTUDENT_ID(PASSWORD);
				}
				if(c.getName().equals("cauto")) {
					auto = c.getValue();
					dto.setAuto(auto);
				}
			}
		}
		
		
		//dao 만들어서  = dao.getInstance();하고 id/pw확인하기
		logonDAO dao = logonDAO.getInstance();
		int check = dao.studentCheck(STUDENT_ID, PASSWORD);
		if(check == 1) {							// id 가 확인 되었다면
			session.setAttribute("STUDENT_ID", dto.getSTUDENT_ID()); // 세션 생성
			if(dto.getAuto() != null && dto.getAuto().equals("1")) {	//자동로그인이 비어있지 않고 값이 1과 같다면
				Cookie cid = new Cookie("cid", dto.getSTUDENT_ID());			// 쿠키생성.
				Cookie cpw = new Cookie("cpw", dto.getPASSWORD());
				Cookie cauto = new Cookie("cauto", dto.getAuto());
				cid.setMaxAge(60*60);
				cpw.setMaxAge(60*60);
				cauto.setMaxAge(60*60);								//자동로그인 유효시간 1시간.
			}
			response.sendRedirect("studentMain.jsp");
		}else if (check == 1) { 									// 아이디,비번 일치.  
			session.setAttribute("STUDENT_ID", STUDENT_ID);
			response.sendRedirect("studentMain.jsp");
		} else if( check == 0) {									// 비밀번호 불일치.	%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1); // 전페이지로 이동하는것.
		</script>
	<%}else {	 	%>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%}%>
