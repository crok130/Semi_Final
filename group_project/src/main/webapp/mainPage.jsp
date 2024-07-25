<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="servlet.*, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("memberId")){
					String memberId = c.getValue();
					
					InitialContext init = new InitialContext();
					DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
					Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(
						"SELECT * FROM member WHERE memberId = ?"
					);
					pstmt.setString(1, memberId);
					
					ResultSet rs = pstmt.executeQuery();
					if(rs.next()){
						MemberVO member = new MemberVO();
						member.setNum(rs.getInt("memberNum"));
						member.setId(rs.getString("memberId"));
						member.setEmail(rs.getString("memberEmail"));
						member.setPassword(rs.getString("memberPassword"));
						member.setPhone(rs.getString("memberPhone"));
						member.setBirth(rs.getString("memberBirth"));
						member.setAddr1(rs.getString("memberAddr1"));
						member.setAddr2(rs.getString("memberAddr2"));
						member.setAddr3(rs.getString("memberAddr3"));
						member.setGender(rs.getString("memberGender"));
						member.setPoint(rs.getInt("memberPoint"));
						member.setJoinDate(rs.getTimestamp("memberJoin"));
						member.setVisitDate(rs.getTimestamp("memberVisit"));
						member.setType(rs.getInt("memberType"));
						member.setWithdraw(rs.getString("memberWithdraw"));
						// session 에 추가
						session.setAttribute("member", member);
					}
				} // check u_id cookie
			} // end for cookies
		}
%>
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
	        <% if (2 == type) { %>
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