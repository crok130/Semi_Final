<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%
    // 로그인 여부 확인
    String userId = (String) session.getAttribute("userId");
%>

<s:query var="result" dataSource="jdbc/MySQLDB">
	SELECT * FROM book_requests WHERE status = '신청' ORDER BY request_id DESC
</s:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 신청 목록</title>
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/requestBook/bookBoard.css">
</head>
<body>
    <header>
        <h1>도서 신청 목록</h1>
        <form action="requestBook/reBookSearch.jsp" method="get" class="search-form">
            <input type="text" name="search" placeholder="도서 검색">
            <button type="submit">검색</button>
        </form>
    </header>
    
    <div class="container">
        <nav>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="bookApplying.jsp">승인</a></li>
                <li><a href="bookComplete.jsp">완료</a></li>
            </ul>
        </nav>
        
        <main class="content">
            <a href="<c:choose>
                        <c:when test="${sessionScope.userId != null}">
                            reBook.jsp
                        </c:when>
                        <c:otherwise>
                            login.jsp
                        </c:otherwise>
                     </c:choose>"><button class="request-button top">도서 신청</button></a>
            <table class="board-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>도서 제목</th>
                        <th>저자</th>
                        <th>출판사</th>
                        <th>출판 연도</th>
                    </tr>
                </thead>
                <tbody>
                   <c:choose>
                   	<c:when test="${result.rowCount > 0}">
                   		<c:forEach var="b" items="${result.rows}">
                   			<tr>
                   				<td>${b.request_id}</td>
                   				<td>${b.title}</td>
                   				<td>${b.author}</td>
                   				<td>${b.publisher}</td>
                   				<td>${b.year}</td>
                   			</tr>
                   		</c:forEach>
                   	</c:when>
                   	<c:otherwise>
                   		<tr>
                   			<td colspan="5">등록된 정보가 없습니다.</td>
                   		</tr>
                   	</c:otherwise>
                   </c:choose>
                </tbody>
            </table>
        </main>
    </div>
    
    <footer>
        <p>&copy; 베스킨라빈스31.2</p>
    </footer>
</body>
</html>
