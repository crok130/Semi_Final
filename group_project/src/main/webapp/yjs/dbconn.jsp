



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<% 
// DB와 jsp를 연결하는 객체 
Connection conn = null;

String url = "jdbc:mysql://localhost:3306/digital_jsp";
String user = "root";
String password = "1234";

try {
	// 드라이버 파일 로드해오기
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
} catch(SQLException e) {
	out.println("데이터베이스 연결에 실패했습니다.<br>");
	out.println("SQLException : "+e.getMessage());
}

%>
 --%>




