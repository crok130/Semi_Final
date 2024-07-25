<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<!-- DB 연결이 필요한 페이지에 include -->
<%-- <%@ include file="dbconn.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리 page (수정/삭제)</title>
</head>
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
        	padding-left: 100px;
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
        /* header */
        /* header */
        /* header */
        /* 검색창 */
        /* 검색창 */
        /* 검색창 */
        /* 2차 이상의 메뉴만 none 값을 주기 */
        .top-bar__menu-box-1 > ul ul {
            display: none;
        }
        /* 가운데 정렬 */
        .con {
            margin-left: 170px;
        }
        /* 실질적으로 메뉴에 사용할 너비 설정 */
        .top-bar > .con {
            width: 800px;
            height: 50px;
            float: right;
        }
        /* 실질적으로 메뉴에 사용할 너비 설정 */
        .top-bar__menu-box-1 > ul > li {
            display: inline-block;
        }
        /* 문자열 가운데 정렬 */
        .top-bar__menu-box-1 {
            text-align: center;
            margin-top: 20px;
        }
        /* 모든 메뉴 박스의 배경을 검은색으로 하고 글자를 하얀색으로 꾸며보자 */
        .top-bar__menu-box-1 ul {
            background-color:  white;
            color: black;
        }
        /* 모든 메뉴 크기 조절 */
        .top-bar__menu-box-1 ul > li > a {
            display: block;
            font-size: 0.9rem;
            padding: 2px 2px;
            border: 1px solid gainsboro ;
            width: 90px;
        }
        /* 모든 메뉴를 마우스 인식 시 배경색을 변경 */
        .top-bar__menu-box-1 ul > li:hover > a {
            background-color: rgba(80, 147, 236, 0.352);
            opacity: 0.8;
        }
        /* 2차 메뉴가 보이도록 만들어 보자 */
        .top-bar__menu-box-1 > ul > li:hover > ul {
            display: block;
        }
        /* 1차 메뉴를 제한 구역으로 설정 */
        .top-bar__menu-box-1 > ul > li {
            position: relative;
        }
        /* 2차 메뉴에 absolute 값을 주기 */
        .top-bar__menu-box-1 > ul > li > ul {
            position: absolute;
            top: 100%;		/* 2차 메뉴를 1차 메뉴의 아래에 위치시킨다 */
            left: 0;		/* 2차 메뉴를 1차 메뉴의 왼쪽 벽에 붙인다 */
            width: 100%;		/* 부모의 너비를 그대로 받아온다 */
        }        
        /* footer  */
        /* footer  */
        /* footer  */
		.book_update {
			padding-top: 30px;
			padding-right: 130px;
		}
		.bimg {
			width: 250px;
			padding-left: 10px;
			padding-right: 10px;
		}
		.inform {
			margin-left: 35px;
			margin-top: 25px;
			margin-bottom: 10px;
			width: 80px;
			height: 40px;
			
		}
		.m_menu {
			padding-left: 10px;
			width: 270px;
			height: 35px;
		}
		.r_menu {
			padding-left: 10px;
			width: 400px;
			height: 35px;
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
            <a href=""><div class="logotext">재고관리 page (수정/삭제)</div></a>
            <a href=""><img class="logo" src="img/31.png" title="31"/></a>
        </ul>
		<header>
			<div class="headermenu">
				<ul>
					<li><a href="insert_form.jsp">☛ 재고등록 page </a></li>
					<li><a href="회원관리.jsp">☛ 회원관리 page </a></li>
					<li><a href="main.jsp">☛ 판매 main page </a></li>
				</ul>
			</div>
		</header>
		<div class="con">
              <nav class="top-bar__menu-box-1">
                <ul>
                    <li>
                        <form class="search-box" action="검색페이지로이동" method="get">
                            <input class="search-txt" type="text" placeholder="검색어를 입력하세요." />
                            <button class="search-btn" type="submit ">수정할 책 찾기</button>
                        </form>
                    </li>
                    <li>
                        <a href="#">성별</a>
                        <ul>
                            <li><a href="#">여성</a></li>
                            <li><a href="#">남성</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">연령별</a>
                        <ul>
                            <li><a href="#">10대</a></li>
                            <li><a href="#">20대</a></li>
                            <li><a href="#">30대</a></li>
                            <li><a href="#">40대</a></li>
                            <li><a href="#">50대</a></li>
                            <li><a href="#">60대 이상</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">품절유무</a>
                        <ul>
                            <li><a href="#">품절포함</a></li>
                            <li><a href="#">품절제외</a></li>
                        </ul>
                    </li>
                    <li id="seemenu">
                        <a href="#">메뉴수량설정</a>
                        <ul>
                            <li><a href="#">12개씩 보기</a></li>
                            <li><a href="#">36개씩 보기</a></li>
                            <li><a href="#">72개씩 보기</a></li>
                            <li><a href="#">144개씩 보기</a></li>
                        </ul>
                    </li>
                </ul>
              </nav>
        </div>
		<div class="container">
	    	<div class="row" align="center">
	    		<!-- SQL 사용해 DB에서 상품 정보 가져오기 -->
	    		<%
	                // 데이터베이스에 SQL문을 전달하는 PreparedStatement 객체
	    			PreparedStatement pstmt = null;
	                // 데이터베이스로부터 결과값을 전달받는 ResultSet 객체 
	    			ResultSet rs = null;
	                // SQL문 작성하고 실행하기
	    			String sql = "select * from books";
	    			Connection conn = JDBCUtil.getConnection();
	    			pstmt = conn.prepareStatement(sql);
	    			rs = pstmt.executeQuery();
	    			
	                // 실행한 결과값 rs(product 테이블의 모든 레코드) 하나씩 출력
	    			while (rs.next()) {
	    		%>
	    	<div class="book_update">
			    <table border="1">
			        <tr>
			            <td rowspan="12" style="width:210px;">
			            	<img src="img/<%= rs.getString("book_fileName") %>" class="bimg" onerror="this.onerror=null; this.src='img/noimages.png';" />
							<!-- 수정 -->
			            	<a href="book_update_form.jsp"><input class="inform" type="button" value="수정하기" /></a>
		                	<!-- 삭제 -->
		                	<a href="book_delete.jsp?book_no=<%= rs.getString("book_no") %>">
		                		<input class="inform" type="button" value="삭제하기" />
		                	</a>
			            </td>
			            <td class="m_menu">제목(title)</td>
			            <td class="r_menu"><%= rs.getString("title") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">책번호(book_id)</td>
			            <td class="r_menu"><%= rs.getString("book_id") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">책 고유ID(book_id)</td>
			            <td class="r_menu"><%= rs.getString("book_id") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">저자(author)</td>
			            <td class="r_menu"><%= rs.getString("author") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">출판사(publisher)</td>
			            <td class="r_menu"><%= rs.getString("publisher") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">가격(price)</td>
			            <td class="r_menu"><%= rs.getString("price") %> 원</td>
			        </tr>
			        <tr>
			            <td class="m_menu">재고수량(stock)</td>
			            <td class="r_menu"><%= rs.getString("stock") %> 개</td>
			        </tr>
			        <tr>
			            <td class="m_menu">최초 등록한 날짜(insert_day)</td>
			            <td class="r_menu"><%= rs.getString("insert_day") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">간략 소개(book_memo)</td>
			            <td class="r_menu"><%= rs.getString("book_memo") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">연령(category_age)</td>
			            <td class="r_menu"><%= rs.getString("category_age") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">국내/해외(category_overseas)</td>
			            <td class="r_menu"><%= rs.getString("category_overseas") %></td>
			        </tr>
			        <tr>
			            <td class="m_menu">책이미지파일이름(book_fileName)</td>
			            <td class="r_menu"><%= rs.getString("book_fileName") %></td>
			        </tr>
			    </table>
		    </div>
	    		<%
	    			}
	    		%>
	    	</div>
		</div>
		<footer>
            <p>Copyright © 베스킨라빈스31.2 Corp. All Rights Reserved.</p>
            <p>고객센터 0000-0000 (유료) 365일 09:00 ~ 18:00 </p>
        </footer>   
	</div>
</body>
</html>







