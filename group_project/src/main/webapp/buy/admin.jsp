<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 결제 내역</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center">결제 내역</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>결제상품</th>
                    <th>총 가격</th>
                    <th>결제일시</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/test";
                    String user = "root";
                    String password = "1234";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);
                        stmt = conn.createStatement();
                        String query = "SELECT order_id, buyer_name, buyer_addr, buyer_tel, GROUP_CONCAT(product SEPARATOR ', ') AS products, SUM(price) AS total_price, purchase_date " +
                                       "FROM purchase GROUP BY order_id, buyer_name, buyer_addr, buyer_tel, purchase_date ORDER BY purchase_date DESC";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int orderId = rs.getInt("order_id");
                            String buyerName = rs.getString("buyer_name");
                            String buyerAddr = rs.getString("buyer_addr");
                            String buyerTel = rs.getString("buyer_tel");
                            String products = rs.getString("products");
                            int totalPrice = rs.getInt("total_price");
                            Timestamp purchaseDate = rs.getTimestamp("purchase_date");
                %>
                <tr>
                    <td><%= orderId %></td>
                    <td><%= buyerName %></td>
                    <td><%= buyerAddr %></td>
                    <td><%= buyerTel %></td>
                    <td><%= products %></td>
                    <td><%= totalPrice %> 원</td>
                    <td><%= purchaseDate %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
