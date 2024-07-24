<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 - BASKINROBBINS 31.2</title>
<link rel="stylesheet" href="../css/check.css" type="text/css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/CheckPwServlet" method="POST">
		<div id=wrapper>
			<div id="upperbox">
                <p>회원탈퇴</p>
                <span>탈퇴시에 주의사항을 꼭! 확인해주시기 바랍니다.</span>
			</div>
            <hr />
            <div id="lowerbox">
                <div id="innerbox1">
                    <p>고객님의 개인정보 보호를 위해 본인확인을 진행합니다.</p>
                    <p><span>비밀번호</span>를 입력해주세요.</p>
                </div>
                <div id="innerbox2">
                    <p>비밀번호 확인</p>
                    <input type="password" name="password" required>
                    <input type="hidden" name="action" value="secede"> <!-- 회원 탈퇴 액션 추가 -->
                    <input type="button" value="확인">
                </div>
            </div>
		</div>
	</form>
</body>
</html>