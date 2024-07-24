<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*, util.Criteria, util.PageMaker" %>
<%@ page language="java" %>
<jsp:useBean id="criteria" class="util.Criteria" scope="page" />
<jsp:setProperty name="criteria" property="page" value="${param.page}" />
<jsp:setProperty name="criteria" property="perPageNum" value="${param.perPageNum}" />

<jsp:useBean id="pageMaker" class="util.PageMaker" scope="page" />
<jsp:setProperty name="pageMaker" property="cri" value="${criteria}" />
<jsp:setProperty name="pageMaker" property="displayPageNum" value="10" />
<!DOCTYPE html>
<html>
<head>
    <title>주문 내역</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">주문 내역</h2>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>구매자 이름</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>책 제목</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>총 가격</th>
                    <th>주문 날짜</th>
                    <th>배송 현황</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    List<Map<String, Object>> orderList = new ArrayList<>();
                    Map<String, Integer> totalPriceMap = new HashMap<>();
					int memberNum = 1;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/baskin";
                        String user = "root";
                        String password = "1234";
                        conn = DriverManager.getConnection(url, user, password);

                        // Total count query for memberNum 1
                        String countQuery = "SELECT COUNT(*) FROM Orders WHERE memberNum = 1";
                        pstmt = conn.prepareStatement(countQuery);
                        rs = pstmt.executeQuery();
                        if (rs.next()) {
                            pageMaker.setTotalCount(rs.getInt(1));
                        }
                        rs.close();
                        pstmt.close();

                        // Data query with LIMIT for memberNum 1
                        String query = "SELECT o.buyer_name, o.buyer_addr, o.buyer_tel, b.book_id, b.title, o.quantity, o.total_price, o.order_date, o.status " +
                                       "FROM Orders o " +
                                       "JOIN Books b ON o.book_id = b.book_id " +
                                       "WHERE o.memberNum = ? " +
                                       "ORDER BY o.order_date LIMIT ?, ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, memberNum);
                        pstmt.setInt(2, criteria.getStartRow());
                        pstmt.setInt(3, criteria.getPerPageNum());
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            Map<String, Object> order = new HashMap<>();
                            order.put("buyer_name", rs.getString("buyer_name"));
                            order.put("buyer_addr", rs.getString("buyer_addr"));
                            order.put("buyer_tel", rs.getString("buyer_tel"));
                            order.put("book_id", rs.getInt("book_id")); // 책 ID 추가
                            order.put("title", rs.getString("title"));
                            order.put("quantity", rs.getInt("quantity"));
                            order.put("total_price", rs.getInt("total_price"));
                            order.put("order_date", rs.getTimestamp("order_date"));
                            order.put("status", rs.getString("status"));
                            orderList.add(order);

                            String orderDateStr = rs.getTimestamp("order_date").toString();
                            totalPriceMap.put(orderDateStr, totalPriceMap.getOrDefault(orderDateStr, 0) + rs.getInt("total_price"));
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }

                    String previousOrderDate = "";
                    boolean firstRow = true;

                    for (Map<String, Object> order : orderList) {
                        String currentOrderDate = order.get("order_date").toString();
                        int totalPriceForDate = totalPriceMap.get(currentOrderDate);

                        if (!currentOrderDate.equals(previousOrderDate)) {
                            if (!firstRow) {
                %>
                                <tr><td colspan="9" class="bg-light"></td></tr>
                <%
                            }
                %>
                <tr>
                    <td><%= order.get("buyer_name") %></td>
                    <td><%= order.get("buyer_addr") %></td>
                    <td><%= order.get("buyer_tel") %></td>
                    <td><a href="../book_detail.jsp?book_id=<%= order.get("book_id") %>"><%= order.get("title") %></a></td> <!-- 책 제목에 링크 추가 -->
                    <td><%= order.get("quantity") %></td>
                    <td><%= order.get("total_price") %></td>
                    <td rowspan="<%= totalPriceMap.size() %>"><%= totalPriceForDate %></td>
                    <td><%= order.get("order_date") %></td>
                    <td><strong><%= order.get("status") %></strong></td>
                </tr>
                <%
                            previousOrderDate = currentOrderDate;
                            firstRow = false;
                        } else {
                %>
                <tr>
                    <td colspan="3"></td>
                    <td><a href="../book_detail.jsp?book_id=<%= order.get("book_id") %>"><%= order.get("title") %></a></td> <!-- 책 제목에 링크 추가 -->
                    <td><%= order.get("quantity") %></td>
                    <td><%= order.get("total_price") %></td>
                    <td colspan="3"></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <!-- 페이징 -->
        <nav>
            <ul class="pagination justify-content-center">
                <%
                    if (pageMaker.isPrev()) {
                %>
                    <li class="page-item">
                        <a class="page-link" href="?page=<%= pageMaker.getStartPage() - 1 %>&perPageNum=<%= criteria.getPerPageNum() %>">Previous</a>
                    </li>
                <%
                    }

                    for (int i = pageMaker.getStartPage(); i <= pageMaker.getEndPage(); i++) {
                %>
                    <li class="page-item <%= (i == criteria.getPage()) ? "active" : "" %>">
                        <a class="page-link" href="?page=<%= i %>&perPageNum=<%= criteria.getPerPageNum() %>"><%= i %></a>
                    </li>
                <%
                    }

                    if (pageMaker.isNext()) {
                %>
                    <li class="page-item">
                        <a class="page-link" href="?page=<%= pageMaker.getEndPage() + 1 %>&perPageNum=<%= criteria.getPerPageNum() %>">Next</a>
                    </li>
                <%
                    }
                %>
            </ul>
        </nav>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
