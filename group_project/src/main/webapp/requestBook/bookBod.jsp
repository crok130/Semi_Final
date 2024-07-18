<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
        <form action="#" method="get" class="search-form">
            <input type="text" name="search" placeholder="도서 검색">
            <button type="submit">검색</button>
        </form>
    </header>
    
    <div class="container">
        <nav>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">신청 중</a></li>
                <li><a href="#">승인</a></li>
                <li><a href="#">완료</a></li>
            </ul>
        </nav>
        
        <main class="content">
            <a href="requestBook/reBook.jsp"><button class="request-button top">도서 신청</button></a>
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
                    <tr>
                        <td>1</td>
                        <td>도서 제목 1</td>
                        <td>저자 1</td>
                        <td>출판사 1</td>
                        <td>2023</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>도서 제목 2</td>
                        <td>저자 2</td>
                        <td>출판사 2</td>
                        <td>2022</td>
                    </tr>
                    <!-- 추가 도서 항목 -->
                </tbody>
            </table>
            <a href="requestBook/BookRequest.html"><button class="request-button bottom">도서 신청</button></a>
        </main>
    </div>
    
    <footer>
        <p>&copy; 베스킨라빈스31.2</p>
    </footer>
</body>
</html>
