CREATE SCHEMA baskin;
USE baskin;


SELECT * FROM books;


CREATE TABLE member (
    memberNum INT PRIMARY KEY AUTO_INCREMENT,
    memberId VARCHAR(50) NOT NULL UNIQUE,
    memberPassword VARCHAR(250) NOT NULL,
    memberName VARCHAR(50) NOT NULL,
    memberEmail VARCHAR(250) UNIQUE NOT NULL,
    memberGender VARCHAR(5) NOT NULL,
    memberaddr VARCHAR(250) NOT NULL,
    memberPhone VARCHAR(20) NOT NULL UNIQUE,
    memberType INT, -- 관리자(0), 판매자(1), 일반 사용자(2) 구분
    money INT
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(100),
    publisher VARCHAR(100),
    price INT NOT NULL,
    description TEXT,
    category VARCHAR(50),
    stock INT NOT NULL,
    seller_id INT,
    image_path varchar(250) not null,
    status ENUM('신책', '중고책') NOT NULL,
	FOREIGN KEY (seller_id) REFERENCES member(memberNum) ON DELETE SET NULL
);
SELECT * FROM cart;


CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT, -- 고유 식별자
    memberNum INT, -- 사용자 식별자 (외래키)
    book_id INT, -- 책 식별자 (외래키)
    quantity INT, -- 수량 (기본값 1)
    price int,
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE, -- 회원 테이블과의 관계
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE -- 책 테이블과의 관계
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    memberNum INT NOT NULL,
    buyer_name VARCHAR(50),
    buyer_addr VARCHAR(250),
    buyer_tel varchar(250),
    total_price int,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('결제 완료', '배송 중', '배송 완료') NOT NULL,
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE
);

CREATE TABLE Order_Details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

CREATE TABLE Book_Requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    memberNum INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    status ENUM('신청', '승인', '거절') DEFAULT '신청',
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE
);

CREATE TABLE Used_Books (
    used_book_id INT PRIMARY KEY AUTO_INCREMENT,
    memberNum INT NOT NULL,
    book_id INT NOT NULL,
    price INT NOT NULL,
    status ENUM('최상', '상', '중', '하') NOT NULL,
    description TEXT,
    FOREIGN KEY (memberNum) REFERENCES member(memberNum) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
