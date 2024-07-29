CREATE SCHEMA baskin;
USE baskin;

CREATE TABLE IF NOT EXISTS member(
memberNum INT PRIMARY KEY AUTO_INCREMENT,		-- 회원 번호
memberName VARCHAR(50)NOT NULL,					-- 회원 이름
memberId VARCHAR(50) NOT NULL UNIQUE,			-- 회원 아이디
memberEmail VARCHAR(250)UNIQUE NOT NULL,		-- 이메일
memberPassword VARCHAR(250) NOT NUll,			-- 비밀번호
memberPhone VARCHAR(20)NOT NULL UNIQUE,			-- 휴대폰 번호
memberBirth VARCHAR(20),
memberaddr VARCHAR(250),				-- 생년월일
memberAddr1 VARCHAR(250)NOT NULL,				-- 우편 번호
memberAddr2 VARCHAR(250)NOT NULL,				-- 도로명
memberAddr3 VARCHAR(250)NOT NULL,				-- 상세 주소
memberGender VARCHAR(5)NOT NULL,				-- 성별
money INT DEFAULT 0,						-- 포인트
memberJoin TIMESTAMP NOT NULL DEFAULT now(),	-- 가입일
memberVisit TIMESTAMP NOT NULL DEFAULT now(),	-- 최종 방문일
memberType INT,									-- 관리자 판매 일반 계정 구분 (0: 일반 / 1: 판매자 / 2: 관리자)
memberWithdraw char(1) DEFAULT 'n'				-- 탈퇴 (회원 정보 숨김) n/y
);

SELECT * from books;

CREATE TABLE books (
book_no INT PRIMARY KEY AUTO_INCREMENT,				-- 제품 등록 번호
book_id VARCHAR(200) NOT NULL UNIQUE,				-- 제품 등록 ID 
title VARCHAR(255) NOT NULL,						-- 책 이름
author VARCHAR(100) NOT NULL,						-- 저자  
publisher VARCHAR(100) NOT NULL, 					-- 출판사 
book_memo TEXT,										-- 한줄 소개
new_old_ebook VARCHAR(50) NOT NULL,					-- 신품,중고,ebook
price INT NOT NULL,									-- 제품 가격 
stock INT NOT NULL,
seller_id INT,									-- 입고 수량
category_overseas VARCHAR(50) NOT NULL, 			-- 국내/외 구분
category_age VARCHAR(50),							-- 연령대 구분
category_all 	VARCHAR(50) NOT NULL,		        -- 대분류
insert_day TIMESTAMP NOT NULL DEFAULT now(),		-- 최초 등록한 날짜
book_fileName  VARCHAR(300)	NULL,				-- 책이미지파일이름
FOREIGN KEY (seller_id) REFERENCES member(memberNum) ON DELETE SET NULL
);

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT, -- 고유 식별자
    memberNum INT, -- 사용자 식별자 (외래키)
    book_no INT, -- 책 식별자 (외래키)
    quantity INT, -- 수량 (기본값 1)
    price int,
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE, -- 회원 테이블과의 관계
    FOREIGN KEY (book_no) REFERENCES Books(book_no) ON DELETE CASCADE -- 책 테이블과의 관계
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    memberNum INT,
    buyer_name VARCHAR(50),
    buyer_addr VARCHAR(250),
    buyer_tel varchar(250),
    book_no INT,
    quantity INT,
    total_price int,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_group_id INT, 
    status ENUM('배송준비중', '배송 중', '배송 완료') NOT NULL,
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE,
    FOREIGN KEY (book_no) REFERENCES Books(book_no) ON DELETE CASCADE
);


CREATE TABLE book_requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT, -- 신청 ID (고유 식별자, 자동 증가)
    memberId VARCHAR(255) NOT NULL,                 -- 회원 번호 (외래키)
    title VARCHAR(255) NOT NULL,               -- 신청 도서 제목
    author VARCHAR(100) NOT NULL,                      -- 신청 도서 저자
    publisher VARCHAR(50) NOT NULL,
    year VARCHAR(50),
    status VARCHAR(50) DEFAULT '신청', -- 신청 상태 (기본값: '신청')
    FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE -- 외래키 제약 조건 (회원 탈퇴 시 신청 정보 삭제)
);
SELECT * FROM book_requests;