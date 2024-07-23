<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
	<link href="../css/find.css" rel="stylesheet" type="text/css"/>
	
</head>
<body>
        <div class="wrapper">
            <div class="sign">
                <a href="findID.jsp" class="current" style="color: black;">아이디 찾기</a>
                <a href="findPW.jsp">비밀번호 찾기</a>
            </div>
            <div class="innerWrapper">
                <p>아이디 찾기 방법을 선택해 주세요.</p>
                <p>선택하신 수단으로 아이디 확인이 가능합니다.</p>
                
                <!-- 휴대폰 번호로 찾기 -->
                <div class="phone" onclick="drop()">등록된 휴대폰 번호로 찾기</div>
                <div class="input_info">
                    <input type="text" class="name" placeholder="이름" required>
                    <input type="text" class="phoneNum" placeholder="휴대폰 번호 ('-'없이 입력)" required minlength="10" maxlength="11">
                    <input type="button" class="send" value="인증번호 발송" required>
                    <input type="text" class="number" placeholder="인증번호 (6자리)" required>
                    <button type="submit" class="btn">확인</button>
                </div>
                
                <!-- 이메일로 찾기 -->
                <form action="success_findID.jsp" method="post">
                <div class="email" onclick="drop()">등록된 이메일 주소로 찾기</div>
                <div class="input_info">
                    <input type="text" class="name" id="name" name="name" placeholder="이름">
                    <input type="email" class="emailAddr" id="emailAddr" name="email" placeholder="이메일 주소">
                    <input type="button" class="send" id="sendMail" value="인증번호 발송" />
                    <input type="text" class="number" placeholder="인증번호 (6자리)" name="code" required>
                    <button type="submit" class="btn">확인</button>
                </div>
                </form>
            </div>
        </div>
    <footer>
        <div>
            <p>Copyright &copy; <span>BASKINROBBINS 31.2</span> All Rights Reserved.</p>
        </div>
    </footer>
    
    <script src="../js/drop.js"></script>
    <script>
    	var emailCode = "";
    
    	document.querySelector("#sendMail").onclick = function(){
			let name = document.querySelector("#name").value;
			let emailAddr = document.querySelector("#emailAddr").value;
			
			// AJAX => fetch
			fetch("verification_email.jsp",{
				method : "POST",
				body : new URLSearchParams({
					name : name,
					email : emailAddr
				})
			}).then(response => response.json())
			.then(data => {
				console.log(data);
				if(!data){
					alert('이름과 이메일주소가 일치하지 않습니다.');
				}else{
					alert("메일발송 완료 메일을 확인해 주세요.");
					emailCode = data;
				}
			})
			.catch(error => console.log(error));
		}
    </script>
</body>
</html>