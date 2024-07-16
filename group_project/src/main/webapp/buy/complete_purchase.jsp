<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%
    String impUid = request.getParameter("imp_uid");
    String merchantUid = request.getParameter("merchant_uid");
    String paidAmount = request.getParameter("paid_amount");
    String applyNum = request.getParameter("apply_num");

    String buyerName = request.getParameter("buyer_name");
    String buyerTel = request.getParameter("buyer_tel");
    String buyerAddr = request.getParameter("buyer_addr");

    ArrayList<HashMap<String, String>> purchaseList = (ArrayList<HashMap<String, String>>) session.getAttribute("purchaseList");

    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root";
    String password = "1234";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int orderId = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // 새로운 order_id 생성
        String orderQuery = "SELECT IFNULL(MAX(order_id), 0) + 1 AS new_order_id FROM purchase";
        pstmt = conn.prepareStatement(orderQuery);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            orderId = rs.getInt("new_order_id");
        }

        // 구매 내역 저장
        String insertQuery = "INSERT INTO purchase (order_id, buyer_name, buyer_tel, buyer_addr, product, price) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);

        for (HashMap<String, String> item : purchaseList) {
            pstmt.setInt(1, orderId);
            pstmt.setString(2, buyerName);
            pstmt.setString(3, buyerTel);
            pstmt.setString(4, buyerAddr);
            pstmt.setString(5, item.get("product"));
            pstmt.setInt(6, Integer.parseInt(item.get("price")));
            pstmt.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    session.removeAttribute("cart");
    session.removeAttribute("purchaseList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 완료</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center">결제 완료</h1>
        <p class="text-center">결제가 완료되었습니다. 감사합니다!</p>
        <a href="products.jsp" class="btn btn-primary btn-block">다시 쇼핑하기</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
