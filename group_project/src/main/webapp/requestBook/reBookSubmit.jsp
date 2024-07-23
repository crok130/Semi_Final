<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
	
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String year = request.getParameter("year");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		conn = ds.getConnection();
		
		String sql = "INSERT INTO book_requests VALUES(null, null, ?, ?, ?, ?, null)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		pstmt.setString(4, year);
		
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

<% 
	if(result == 1){
%>
	<script>
		alert('게시글 등록 성공');
		location.href="bookBod.jsp";
	</script>
<%
	} else{
%>
	<script>
		alert('게시글 등록 실패');
		histroy.back();
	</script>
<%
	}
%>





