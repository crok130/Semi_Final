<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>

<%
    if(request.getMethod().equalsIgnoreCase("POST")){
        
        String impUid = request.getParameter("imp_uid");
        String merchantUid = request.getParameter("merchant_uid");
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        String applyNum = request.getParameter("apply_num");
        String buyerName = request.getParameter("buyer_name");
        String buyerTel = request.getParameter("buyer_tel");
        String buyerAddr = request.getParameter("buyer_addr");
        
         // 수정할 회원의 memberNum을 설정합니다.
        int memberNum = 1; // 실제로는 세션이나 쿠키에서 가져옴
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtil.getConnection();
            String Cartsql = "SELECT * FROM Cart WHERE memberNum = ?";
            pstmt = conn.prepareStatement(Cartsql);
            pstmt.setInt(1, memberNum);
            rs = pstmt.executeQuery(Cartsql);
            
            while(rs.next()){
            	int book_id = rs.getInt("book_id");
            	int quantity = rs.getInt("quantity");
            	int price = rs.getInt("price");
	            String sql = "INSERT INTO Orders (memberNum, buyer_name, buyer_addr, buyer_tel, total_price, book_id, quantity, status) VALUES (?, ?, ?, ?, ?, ?, ?, '결제 완료')";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, memberNum);
	            pstmt.setString(2, buyerName);
	            pstmt.setString(3, buyerAddr);
	            pstmt.setString(4, buyerTel);
	            pstmt.setInt(5, price);
	            pstmt.setInt(6, book_id);
	            pstmt.setInt(7, quantity);
	            pstmt.executeUpdate();
            }
            // 카트 정보를 삭제하는 코드 추가
            String deleteCartSql = "DELETE FROM Cart WHERE memberNum = ?";
            pstmt = conn.prepareStatement(deleteCartSql);
            pstmt.setInt(1, memberNum);
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
            out.print("결제 처리 중 오류가 발생했습니다.");
        } finally {
            JDBCUtil.close(pstmt, conn);
        }
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
        <a href="../index.jsp" class="btn btn-primary btn-block">다시 쇼핑하기</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>