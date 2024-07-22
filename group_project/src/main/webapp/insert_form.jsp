<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .inbox_c {
        	padding-left: 19px;
        }
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
					<li><a href="book_update_form.jsp">☛ 재고관리 page (수정/삭제) </a></li>
					<li><a href="회원관리.jsp">☛ 회원관리 page </a></li>
					<li><a href="main.jsp">☛ 판매 main page </a></li>
				</ul>
			</div>
		</header>
     <section>
       <form action="../upload" method="POST" enctype="multipart/form-data">
            <table border="1" class="inserttable">
                <tr>
                    <td class="inbox_2">title (책이름)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="title" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">author (저자)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="author" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">publisher (출판사)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="publisher" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">price (가격)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="price" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">stock (재고수량)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="stock" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">description (간략소개)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="description" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">category (카테고리)</td>
                    <td class="inbox">
                        <input class="inbox_1" type="text" name="category" required />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">seller_id (판매자 ID)</td>
                    <td class="inbox">
                        <!-- 이 필드는 서버에서 기본값으로 설정되므로 HTML에서 제거하거나 비워둡니다. -->
                        <input type="hidden" name="seller_id" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">status (상태)</td>
                    <td class="inbox">
                        <!-- 이 필드는 서버에서 기본값으로 설정되므로 HTML에서 제거하거나 비워둡니다. -->
                        <input type="hidden" name="status" value="신책" />
                    </td>
                </tr>
                <tr>
                    <td class="inbox_2">이미지파일첨부</td>
                    <td class="inbox">
                        <input type="file" name="book_Image" accept="image/*" required />
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button class="button" type="submit">등록하기</button>
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