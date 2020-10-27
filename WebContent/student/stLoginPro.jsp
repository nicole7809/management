<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= "team.elite.management.ControlDAO" %>

<%
	//post타입 인코딩하기
	request.setCharacterEncoding("UTF-8");

//	String id = request.getParameter("STUDENT_ID");
//	String pw = request.getParameter("PASSWORD");
%>
	<jsp:useBean id = "dto" class = "team.elite.management.Student_MembersDTO"/>
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
					dto.setStudent_id(password);
				}
				if(c.getName().equals("cauto")) {
					auto = c.getValue();
					dto.setAuto(auto);
				}
			}
		}
		
		
		//dao 만들어서  = dao.getInstance();하고 id/pw확인하기
		ControlDAO dao = ControlDAO.getInstance();		// 메서드 다시
		int check = dao.studentCheck(student_id, password);
		if(check == 1) {							// id 가 확인 되었다면
			session.setAttribute("student_id", dto.getStudent_id()); // 세션 생성
			if(dto.getAuto() != null && dto.getAuto().equals("1")) {	// 자동로그인이 비어있지 않고 값이 1과 같다면
				Cookie cid = new Cookie("cid", dto.getStudent_id());	// 쿠키생성.
				Cookie cpw = new Cookie("cpw", dto.getPassword());
				Cookie cauto = new Cookie("cauto", dto.getAuto());
				cid.setMaxAge(60*60);
				cpw.setMaxAge(60*60);
				cauto.setMaxAge(60*60);								//자동로그인 유효시간 1시간.
			}
			response.sendRedirect("studentMain.jsp");		//---------- 쿠키로 로그인 되어 studentMain.으로 이동
		}else if (check == 1) { 							//---------- 아이디,비번 일치.  
			session.setAttribute("student_id", student_id);
			response.sendRedirect("studentMain.jsp");
		} else if( check == 0) {							//---------- 비밀번호 불일치.	%>
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
