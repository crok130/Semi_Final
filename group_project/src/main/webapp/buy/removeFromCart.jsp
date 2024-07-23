<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<%
    int book_id = Integer.parseInt(request.getParameter("book_id"));
    int memberNum = 1/* 여기에 로그인된 사용자 ID를 입력하세요 */;

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = JDBCUtil.getConnection();
        String sql = "DELETE FROM Cart WHERE book_id = ? AND memberNum = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, book_id);
        pstmt.setInt(2, memberNum);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        JDBCUtil.close(null, pstmt, conn);
    }

    response.sendRedirect("cart.jsp");
%>
