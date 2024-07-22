<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>

<%
    String buyerName = request.getParameter("buyer_name");
    String buyerTel = request.getParameter("buyer_tel");
    String buyerAddr = request.getParameter("buyer_addr");
    int amount = Integer.parseInt(request.getParameter("amount"));

    int memberNum = 1; // 수정할 회원의 memberNum을 설정합니다.

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = JDBCUtil.getConnection();
        String sql = "UPDATE member SET money = money + ? WHERE memberNum = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, amount);
        pstmt.setInt(2, memberNum);
        int result = pstmt.executeUpdate();


    } catch (Exception e) {
        e.printStackTrace();
        out.print("결제 처리 중 오류가 발생했습니다.");
    } finally {
        JDBCUtil.close(pstmt, conn);
    }
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
        <a href="../index," class="btn btn-primary btn-block">다시 쇼핑하기</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>