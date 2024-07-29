<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*, utils.JDBCUtil, servlet.*, javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>중고서적 상세보기</title>
    <style>
        .book-detail {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 600px;
            margin: auto;
        }
        .book-detail img {
            max-width: 100%;
            height: auto;
        }
        .book-detail h1 {
            font-size: 24px;
            margin: 0 0 10px;
        }
        .book-detail p {
            font-size: 16px;
            margin: 5px 0;
        }
        .book-detail a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
        }
        .book-detail a:hover {
            background-color: #0056b3;
        }
        .navigation-links {
            margin-top: 20px;
        }
        .navigation-links a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<%
		String userID = (String) session.getAttribute("userId");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = JDBCUtil.getConnection();
		try{
			String sql = "select * from member WHERE memberId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				int memberNum = rs.getInt("memberNum");
				session.setAttribute("memberNum", memberNum);
			}

		} catch (Exception e) {
        e.printStackTrace();
    	} finally {
        	if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        	if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        	if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    	}
	
	%>
	<!-- 위애는 수빈  -->
	
    <% 
	    String userId = (String) session.getAttribute("userId");
	    if (userId != null) { 
	        MemberDAO memberDAO = new MemberDAO();
	        MemberVO member = memberDAO.getMember(userId); // 회원 정보를 가져옵니다.
	        int type = member.getType(); // 회원 유형을 가져옵니다.
    %>
	        <p>환영합니다, <%= userId %> 님</p>
	        <% 
			System.out.println(member); 
			%>
	        <a href="${pageContext.request.contextPath}/LogoutServlet">로그아웃</a>
	        <% if (2 == type) { %>
	        	<!-- 관리자일 경우 -->
	            	<a href="member/adminPage.jsp">관리자 대시보드</a>
		    <% } else { %> 
		            <a href="member/check_before_myPage.jsp?user=<%= userId %>">MY PAGE</a>
		            <a href="member/changePW.jsp?user=<%= userId %>">비밀번호 변경</a>
		            <a href="member/check_before_secede.jsp?user=<%= userId %>">회원 탈퇴</a>
		            
		    <% } %>
    <% } else { %>
        <a href="member/join.jsp">회원가입</a> <br />
        <a href="member/login.jsp">로그인</a>
    <% } %>
    <h1>중고서적 상세보기</h1>

    <!-- 책 세부정보 조회 -->
    <sql:query var="bookDetail" dataSource="jdbc/MySQLDB">
        SELECT *
        FROM books
        WHERE book_id = ?
        <sql:param value="${param.bookId}" />
    </sql:query>

    <c:choose>
        <c:when test="${not empty bookDetail.rows}">
            <c:set var="book" value="${bookDetail.rows[0]}" />
            <div class="book-detail">
                <img src="${book.image_path != null ? book.image_path : 'default_image.jpg'}" alt="${book.title}">
                <h1>${book.title}</h1>
                <p>저자: ${book.author}</p>
                <p>출판사: ${book.publisher}</p>
                <p>가격: ${book.price}원</p>
                <p>상태: ${book.new_old_ebook}</p>
                <p>카테고리: ${book.category_all}</p>
                <p>재고: ${book.stock}권</p>
                <p>${book.description}</p>
                <div class="navigation-links">
                    <a href="${param.referer}">목록으로 돌아가기</a>
                </div>
                <%
               	 	int memberNum = (Integer) session.getAttribute("memberNum");
                %>
                 <div class="count-wrap_count">
                    수량 
                    <button type="button" class="minus">-</button>
                    <input type="text" class="inp" value="1" />
                    <button type="button" class="plus">+</button>
                </div>
                <input type="hidden" class="quantity" name="quantity" value="1">
                <input type="hidden" id="stock" value="${book.stock}">
               	<div class="navigation-links">
                    <button type="button" class="salebutton" onclick="buyNow('${book.book_no}', '${book.title}', '${book.price}')">바로구매</button>
                </div>
          		<div class="navigation-links">          
					<button type="button" class="salebutton2" onclick="addToCart('${book.book_no}', $('.quantity').val(), '${book.title}', '${book.price}')">장바구니</button>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p>책 정보를 찾을 수 없습니다.</p>
            <div class="navigation-links">
                <a href="${param.referer}">목록으로 돌아가기</a>
            </div>
        </c:otherwise>
    </c:choose>
    
    <script>
    function buyNow(book_id, title, price) {
        var quantity = $('.quantity').val();
        addToCart(book_id, quantity, title, price, true);
    }

    /* 로그인된 회원 번호가 세션에 없을때 add_to_cart.jsp 에서 오류  */
    function addToCart(book_no, quantity, title, price, isBuyNow = false) {
        var stock = parseInt($('#stock').val());
        if (quantity > stock) {
            Swal.fire({
                icon: 'error',
                title: '재고 부족!',
                text: '선택하신 수량이 재고량을 초과하였습니다. 현재 재고: ' + stock,
                showConfirmButton: true
            });
            return;
        }

        $.post('../buy/add_to_cart.jsp', { book_no: book_no, quantity: quantity, title: title, price: price }, function(data) {
            if (data.trim() === "success") {
                if (isBuyNow) {
                    window.location.href = '../buy/payment.jsp';
                } else {
                    var totalPrice = price * quantity;
                    Swal.fire({
                        icon: 'success',
                        title: '장바구니에 추가되었습니다!',
                        text: title + " " + quantity + "개, 총 " + totalPrice + "원에 장바구니에 추가되었습니다!",
                        showConfirmButton: false,
                        timer: 2000
                    });
                }
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '장바구니 추가 실패!',
                    text: '다시 시도해주세요.',
                    showConfirmButton: true
                });
            }
        });
    }

$(document).ready(function() {
    $('.plus').click(function() {
        var input = $(this).siblings('.inp');
        var currentValue = parseInt(input.val());
        input.val(currentValue + 1);
        $('.quantity').val(currentValue + 1);
    });

    $('.minus').click(function() {
        var input = $(this).siblings('.inp');
        var currentValue = parseInt(input.val());
        if (currentValue > 1) {
            input.val(currentValue - 1);
            $('.quantity').val(currentValue - 1);
        }
    });
});
    </script>
</body>
</html>
