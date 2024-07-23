<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<s:query var="rs" dataSource="jdbc/MySQLDB">
	SELECT title, author, publisher, year, status FROM book_requests 
	WHERE request_id = ${param.request_id}
</s:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 페이지</h1>
	<div class="container">
        <div class="content">
            <h2>신규 도서 신청</h2>
            <form action="adminBodSubmit.jsp" method="post">
                <table>
                	<tr>
                		<td>제목</td>
                		<td>${rs.rows[0].title}</td>
                	</tr>
                	<tr>
                		<td>저자</td>
                		<td>${rs.rows[0].author}</td>
                	</tr>
                	<tr>
                		<td>출판사</td>
                		<td>${rs.rows[0].publisher}</td>
                	</tr>
                	<tr>
                		<td>출판 년도</td>
                		<td>${rs.rows[0].year}</td>
                	</tr>
                	<tr>
                		<td>상태</td>
                		<td>
                			<input type="radio" name="s" value="신청" checked/> 신청
                			<input type="radio" name="s" value="승인" /> 승인
                			<input type="radio" name="s" value="완료" /> 완료
                		</td>
                	</tr>
                	<button>수정완료</button>
                </table>
            </form>
        </div>
    </div>
    <footer class="footer">
        <p>&copy; 배스킨라빈스31.2</p>
    </footer>
</body>
</html>