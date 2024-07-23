<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% 
	    String userId = (String) session.getAttribute("userId");
	    if (userId != null) { 
	        MemberDAO memberDAO = new MemberDAO();
	        MemberVO member = memberDAO.getMember(userId); // 회원 정보를 가져옵니다.
	        int type = member.getType(); // 회원 유형을 가져옵니다.
    %>
	        <h1>로그인 성공!</h1>
	        <p>환영합니다, <%= userId %> 님</p>
	        <a href="${pageContext.request.contextPath}/LogoutServlet">로그아웃</a>
	        <% if (3 == type) { %>
	        	<!-- 관리자일 경우 -->
	            	<a href="member/adminPage.jsp">관리자 대시보드</a>
		    <% } else { %> 
		    		<!-- 일반 회원 또는 판매자일 경우 -->
		            <a href="member/check_before_myPage.jsp?user=<%= userId %>">MY PAGE</a>
		            <a href="member/changePW.jsp?user=<%= userId %>">비밀번호 변경</a>
		            <a href="member/check_before_secede.jsp?user=<%= userId %>">회원 탈퇴</a>
		    <% } %>
    <% } else { %>
        <a href="member/join.jsp">회원가입</a> <br />
        <a href="member/login.jsp">로그인</a>
    <% } %>
</body>
</html>