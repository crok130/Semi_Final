<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
	
	String title = request.getParameter("title");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		conn = ds.getConnection();
		
		String sql = "SELET * FROM book_requests WHERE title LIKE '%?%'";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		
		result = pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null){
			pstmt.close();
		}
		
		if(conn != null){
			conn.close();
		}
	}

%>

