<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고등록 page</title>
</head>
<body>
<style>
        *{
            margin:0;
            padding:0;
        }    
        .wrap{
            width: 1300px;
            height:1700px;
            margin:50px auto;
        }
        footer, section {
            float:left;
            box-sizing: border-box;
        }
        /* logo */
        /* logo */
        /* logo */
        .mlogo {
            padding-left: 120px;
            padding-bottom: 30px;
        }
        .logo {
            width:60px;
            height:60px;
            border-radius:50%;
            display: inline-block;
            opacity: 0.6;
            padding-left: 10px;
            animation: logo 1.5s ease-in-out infinite;
        }
        @keyframes logo {
            0% {
                transform: scale(1);
            }
            25% {
                transform: scale(1.2);
            }
            50% {
                transform: scale(1);
            }
            75% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }  
        .logotext {
            width:750px;
            display: inline-block;
            font-size: 3.5rem;
            text-align: center;
            letter-spacing: -5px;
            word-spacing: 10px;
            text-shadow: -5px -5px 5px black;
            color: palevioletred;
            opacity: 0.7;
            padding-left: 10px;
        }    
        /* header menu */
        /* header menu */
        /* header menu */
        header {
        	width: 1200px;
        	border-top: 1px solid gainsboro;
        }
        .headermenu {
        	padding-left: 180px;
        	margin-top: 20px;
        	font-size: 1.2rem;
        	line-height: 170%;
        }
        a {
        	text-decoration-line: none;
        	color: blue;
        }
        ul {
        	list-style:none;
        }        
        /* section */
        /* section */
        /* section */
        .inserttable{
            width: 800px;
            height: 600px;
            font-size: 1.0rem;
            margin-left: 180px;
            margin-top: 10px;
            margin-bottom: 30px;
        }
        .inbox {
            width: 450px;
            text-align: center;
        }
        .inbox_1 {
            width: 410px;
            height: 30px;
            font-size: 1.0rem;
        }
        .inbox_2 {
            padding-left: 15px;
        }
        .button {
            width: 200px;
            height: 50px;
            background-color: gray;
            color: white;
            font-size: 1.5rem;
            border: none;
        }
        .checkId_1 {
        	height: 30px;
        	width: 280px;
        }
        .checkId {
        	height: 30px;
        	width: 75px;
        	margin-left: 10px;
        }
        .inbox_c {
        	padding-left: 19px;
        }
        /* footer  */
        /* footer  */
        /* footer  */
        footer {
            background:white;
            width: 1200px;
            height: 100px;
            text-align: center;
            padding-top: 40px;
            border-top: 1px solid gainsboro;
        }
</style>
<body>
    <div class="wrap">
        <ul class="mlogo">
            <a href=""><img class="logo" src="img/31.png" title="31"/></a>
            <a href=""><div class="logotext">관리자 재고 등록 페이지</div></a>
            <a href=""><img class="logo" src="img/31.png" title="31"/></a>
        </ul>
		<header>
			<div class="headermenu">
				<ul>
					<li><a href="list_update_delete.jsp">☛ 재고관리 page (수정/삭제) </a></li>
					<li><a href="회원관리.jsp">☛ 회원관리 page </a></li>
					<li><a href="main.jsp">☛ 판매 main page </a></li>
				</ul>
			</div>
		</header>
        <section>
            <form action="insert_sql.jsp" method="POST">
            <table border="1" class="inserttable">
                <tr>
                    <td class="inbox_2">book_id (책 고유ID)</td>
                    <td class="inbox_c">
                        <input class="checkId_1" type="text" name="book_id" id="book_id" autocomplete="off" placeholder="중복 확인 필수.." required />
                    	<button type="button" onclick="fn_dbCheckId()" name="dbCheckId" class="checkId" >
                    		중복 확인
                    	</button>
                    	<!-- 검증 결과를 출력할 박스모델 -->
						<div class="result"></div>
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">title (책이름)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="title" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">author (저자)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="author" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">publisher (출판사)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="publisher" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">price (가격)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="price" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">stock (재고수량)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="stock" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">book_memo (간략소개)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="book_memo" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">category_age (카테고리(연령))</td>
                    <td class="inbox">
                        <datalist id="age_list" >
                            <option value="10대"></option>
                            <option value="20대"></option>
                            <option value="30대"></option>
                            <option value="40대"></option>
                            <option value="50대"></option>
                            <option value="60대 이상"></option>
                        </datalist>
                        <input class="inbox_1" list="age_list" name="category_age" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">category_overseas (카테고리(국내/해외))</td>
                    <td class="inbox">
                        <datalist id="overseas_list" >
                            <option value="국내"></option>
                            <option value="해외"></option>
                        </datalist>
                        <input class="inbox_1" list="overseas_list" name="category_overseas" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">book_fileName (확장자까지넣으시오)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="book_fileName" autocomplete="off" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">이미지파일첨부</td>
                    <td class="inbox">
                        <input type="file" name="book_Image" accept="image/*" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button class="button">등록하기</button>
                    </th>
                </tr>
            </table>
            </form>
        </section>
        <footer>
            <p>Copyright © 베스킨라빈스31.2 Corp. All Rights Reserved.</p>
            <p>고객센터 0000-0000 (유료) 365일 09:00 ~ 18:00 </p>
        </footer>       
    </div>    
</body>
</html>

<script>
	//u_id 검증 완료 여부를 저장할 변수
	var boolUid = false;
	// 정규 표현식으로 동일한 페턴의 id (앞3자리는 국자표시 ex.. kor, usa, cha 등등) + (뒤5자리는 숫자 5자리)
	var regexBookId =/^([a-zA-Z]{3})-([0-9]{5})$/;
	
	document.querySelector("#book_id").onkeyup = function(){
		let tempVal = this.value;
		console.log(tempVal);
		let elP = this.parentNode.querySelector('.result');
		// 정규 표현식과 동일한 패턴의 문자열이면 true, 아니면 false
		if(regexBookId.test(tempVal)){
			elP.innerHTML = "<span style='color:green'>올바른 id 형식입니다.</span>";
		}else{
			elP.innerHTML = "<span style='color:red'>ex) kor-00123 , usa-00123 </span>";
		}
	}; // 중복id 체크 정규표현 span 태그 호출 종료
	
	function fn_dbCheckId(){
		if(document.querySelector("#book_id").value==""){
			alert("입력값이 비었습니다. 북id를 입력해주세요.");
		}else{
			let tempVal = document.querySelector("#book_id").value;
			location.href="check_book_id.jsp?book_id="+tempVal;
		}
	}; // 중복id 체크버튼 function
	
</script>











