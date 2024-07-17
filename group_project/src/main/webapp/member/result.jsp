<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 가입 결과</title>
</head>
<body>
    <h1>회원 가입 결과</h1>
    <p>회원 정보가 정상적으로 등록되었습니다:</p>
    <ul>
        <li>이름: ${member.name}</li>
        <li>아이디: ${member.id}</li>
        <li>이메일: ${member.email}</li>
        <li>전화번호: ${member.phone}</li>
        <li>주소: ${member.addr}</li>
        <li>성별: ${member.gender}</li>
        <li>판매자 여부: ${member.seller == 1 ? '예' : '아니오'}</li>
    </ul>
</body>
</html>