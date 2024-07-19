<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<%
	// 전달될 파라미터가있다.
	String paramBookNo = request.getParameter("book_no");
	
	// 전달된 파라미터 일치확인위해 전달된 데이터베이스의 정보를 가져온다.
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	
	try{
		int bookId = Integer.parseInt(paramBookNo);
		// 둘다 일치해야 삭제하는 쿼리문
		String sql = "DELETE FROM books WHERE book_no = ? ";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bookId);

		int result = pstmt.executeUpdate();
		
		// 페이지 이동
		out.println("<script>");
		out.println("alert('삭제 완료 했습니다.');");
		out.println("location.href='list_update_delete.jsp';");
		out.println("</script>");
	
	}catch(Exception e){
		e.getMessage();
	} finally{
		// 가변형 인자열에 전달
		JDBCUtil.close(pstmt, conn);
	}
%>











