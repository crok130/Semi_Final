<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리 page (수정/삭제)</title>
</head>
<style>
        /* 스타일 코드 생략 */
</style>
<body>
    <div class="wrap">
        <ul class="mlogo">
            <a href=""><img class="logo" src="img/31.png" title="31"/></a>
            <a href=""><div class="logotext">재고관리 page (수정/삭제)</div></a>
            <a href=""><img class="logo" src="img/31.png" title="31"/></a>
        </ul>
        <header>
            <div class="headermenu">
                <ul>
                    <li><a href="insert_form.jsp">☛ 재고등록 page </a></li>
                    <li><a href="회원관리.jsp">☛ 회원관리 page </a></li>
                    <li><a href="main.jsp">☛ 판매 main page </a></li>
                </ul>
            </div>
        </header>
        <div class="con">
            <nav class="top-bar__menu-box-1">
                <!-- 네비게이션 코드 생략 -->
            </nav>
        </div>
        <div class="container">
            <div class="row" align="center">
            <%
                // 데이터베이스 연결 설정
                String url = "jdbc:mysql://localhost:3306/baskin";
                String user = "root";
                String password = "1234";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM Books WHERE status = '신책'";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                    	int book_id = rs.getInt("book_id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String publisher = rs.getString("publisher");
                        String category = rs.getString("category");
                        int price = rs.getInt("price");
                        String imagePath = rs.getString("image_path");
            %>
                <div class="book_update">
                    <form action="book_update_sql.jsp" method="POST">
                    <table border="1">
                        <tr>
                            <td rowspan="13" style="width:210px;">
                                <img src="img/<%=rs.getString("image_path")%>" class="bimg" onerror="this.onerror=null; this.src='img/noimages.png';" />
                            </td>
                            <td class="m_menu">제목(title)</td>
                            <td class="r_menu"><%=rs.getString("title")%></td>
                            <td>
                                <input type="text" class="update_menu" name="title" value="<%=rs.getString("title")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">책번호(book_id)</td>
                            <td class="r_menu"><%=rs.getString("book_id")%></td>
                            <td class="update_menu">
                                <input type="text" class="update_menu_not" name="book_id" value="<%=rs.getString("book_id")%>" readonly />
                                <del style="color: red;"><small> 수정불가항목</small></del>
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">저자(author)</td>
                            <td class="r_menu"><%=rs.getString("author")%></td>
                            <td>
                                <input type="text" class="update_menu" name="author" value="<%=rs.getString("author")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">출판사(publisher)</td>
                            <td class="r_menu"><%=rs.getString("publisher")%></td>
                            <td>
                                <input type="text" class="update_menu" name="publisher" value="<%=rs.getString("publisher")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">가격(price)</td>
                            <td class="r_menu"><%=rs.getString("price")%> 원</td>
                            <td>
                                <input type="text" class="update_menu" name="price" value="<%=rs.getInt("price")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">재고수량(stock)</td>
                            <td class="r_menu"><%=rs.getInt("stock")%> 개</td>
                            <td>
                                <input type="text" class="update_menu" name="stock" value="<%=rs.getInt("stock")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">설명(description)</td>
                            <td class="r_menu"><%=rs.getString("description")%></td>
                            <td>
                                <input type="text" class="update_menu" name="description" value="<%=rs.getString("description")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">카테고리(category)</td>
                            <td class="r_menu"><%=rs.getString("category")%></td>
                            <td>
                                <input type="text" class="update_menu" name="category" value="<%=rs.getString("category")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="m_menu">책이미지파일이름(image_path)</td>
                            <td class="r_menu"><%=rs.getString("image_path")%></td>
                            <td>
                                <input type="text" class="update_menu" name="image_path" value="<%=rs.getString("image_path")%>" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <input class="inform" type="submit" value="수정하기" />
                                <a href="book_delete.jsp?book_id=<%=rs.getString("book_id")%>">
                                <input class="inform1" type="button" value="삭제하기" /></a>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                <%
                    }
				}catch (Exception e) {
                    e.printStackTrace();
				}finally{
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}
                %>
            </div>
        </div>
        <footer>
            <p>Copyright © 베스킨라빈스31.2 Corp. All Rights Reserved.</p>
            <p>고객센터 0000-0000 (유료) 365일 09:00 ~ 18:00 </p>
        </footer>
    </div>
</body>
</html>
