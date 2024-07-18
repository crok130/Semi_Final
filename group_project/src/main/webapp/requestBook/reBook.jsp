<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 도서 신청</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/requestBook/bookRe.css">
</head>
<body>
    <header>
        <h1>도서 신청</h1>
    </header>
    <div class="container">
        <div class="content">
            <h2>신규 도서 신청</h2>
            <form action="reBookSql.jsp" method="post">
                <label for="title">도서 제목</label>
                <input type="text" id="title" name="title" required>
                
                <label for="author">저자</label>
                <input type="text" id="author" name="author" required>
                
                <label for="publisher">출판사</label>
                <input type="text" id="publisher" name="publisher" required>
                
                <label for="year">출판 연도</label>
                <input type="number" id="year" name="year" required>
                
                <button type="submit">신청하기</button>
            </form>
        </div>
    </div>
    <footer class="footer">
        <p>&copy; 배스킨라빈스31.2</p>
    </footer>
</body>
</html>
