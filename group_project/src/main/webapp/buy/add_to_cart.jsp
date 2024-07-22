<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<%
    int memberNum = Integer.parseInt(request.getParameter("memberNum"));
    int book_id = Integer.parseInt(request.getParameter("book_id"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    int price = Integer.parseInt(request.getParameter("price"));
    int totalPrice = price * quantity;
    try {
        // 데이터베이스 연결
        conn = JDBCUtil.getConnection();
        
        // SQL 쿼리 준비
        String sql = "INSERT INTO Cart (memberNum, book_id, quantity, price) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, memberNum);
        pstmt.setInt(2, book_id);
        pstmt.setInt(3, quantity);
        pstmt.setInt(4, totalPrice);
        pstmt.executeUpdate();
        
        // 성공 메시지 반환
        response.getWriter().write("success");
    } catch (Exception e) {
        // 예외 처리 및 오류 메시지 반환
        e.printStackTrace();
        response.getWriter().write("error");
    } finally {
        // 자원 해제
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
