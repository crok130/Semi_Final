<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="servlet.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="../css/adminPage.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="wrapper">
        <div class="upperBox">
            <!-- 검색? -->
            <div>
            
            
                <p>전체 회원 수 : <%=  %> </p>
                
            </div>
            <div>
            	<input type="search">
            </div>
        </div>

        <div class="lowerBox">
            <table>
                <!-- 상단 고정 -->
                <thead>
                	<tr>
	                    <td>회원 번호</td>
	                    <td>이름</td>
	                    <td>아이디</td>
	                    <td>이메일</td>
	                    <td>휴대폰 번호</td>
	                    <td>생년월일</td>
	                    <td>주소</td>
	                    <td>성별</td>
	                    <td>포인트</td>
	                    <td>판매자</td>
	                    <td>최근 접속 시간</td>
	                    <td>수정</td>
                    </tr>
                </thead>

                <!-- 고객 데이터 서머리 -->
                <tbody>
                <%
                    Connection conn = DBUtil.getConnection();
                
                	String sql = "SELECT memberNum, memberName, memberId, memberEmail, memberPhone, memberBirth, memberAddr1, memberAddr2, memberAddr3, memberGender, memberPoint, memberType, memberVisit FROM member";
                	PreparedStatement pstmt = conn.prepareStatement(sql);
                	ResultSet rs = pstmt.executeQuery(sql);
                	
                	while (rs.next()) {
                		int num = rs.getInt("memberNum");
                		String name = rs.getString("memberName");
                		String id = rs.getString("memberId");
                		String email = rs.getString("memberEmail");
                		String phone = rs.getString("memberPhone");
                		String birth = rs.getString("memberBirth");
                		String addr1 = rs.getString("memberAddr1");
                		String addr2 = rs.getString("memberAddr2");
                		String addr3 = rs.getString("memberAddr3");
                		String addr = addr1 + " " + addr2 + " " + addr3;
                		String gender = rs.getString("memberGender");
                		int point = rs.getInt("memberPoint");
                		String type = rs.getString("memberType");
                		Timestamp visit = rs.getTimestamp("memberVisit");
                %>
                    <tr>
                        <!-- 회원 번호 -->
                        <td><%= num %></td>

                        <!-- 이름 -->
                        <td><%= name %></td>

                        <!-- 아이디 -->
                        <td><%= id %></td>

                        <!-- 이메일 -->
                        <td><%= email %></td>

                        <!-- 휴대폰 번호 -->
                        <td><%= phone %></td>

                        <!-- 생년월일 -->
                        <td><%= birth %></td>

                        <!-- 주소 -->
                        <td><%= addr %></td>

                        <!-- 성별 -->
                        <td><%= gender %></td>

                        <!-- 포인트 -->
                        <td><%= point %></td>

                        <!-- 판매자 여부 -->
                        <td><%= type %></td>

                        <!-- 최근 접속 시간 -->
                        <td><%= visit %></td>

                        <!-- 수정 버튼 -->
                        <td><a href="myPage_Admin.jsp?memberNum=<%= num %>">수정</a></td>
                    </tr>
                 <% } DBUtil.close(conn, pstmt, rs); %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>