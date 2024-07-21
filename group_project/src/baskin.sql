use baskin;

CREATE TABLE IF NOT EXISTS member(
memberNum INT PRIMARY KEY AUTO_INCREMENT,		-- 회원 번호
memberName VARCHAR(50)NOT NULL,					-- 회원 이름
memberId VARCHAR(50) NOT NULL UNIQUE,			-- 회원 아이디
memberEmail VARCHAR(250)UNIQUE NOT NULL,		-- 이메일
memberPassword VARCHAR(250) NOT NUll,			-- 비밀번호
memberPhone VARCHAR(20)NOT NULL UNIQUE,			-- 휴대폰 번호
memberBirth VARCHAR(20),						-- 생년월일
memberAddr1 VARCHAR(250)NOT NULL,				-- 우편 번호
memberAddr2 VARCHAR(250)NOT NULL,				-- 도로명
memberAddr3 VARCHAR(250)NOT NULL,				-- 상세 주소
memberGender VARCHAR(5)NOT NULL,				-- 성별
memberPoint INT DEFAULT 0,						-- 포인트
memberJoin TIMESTAMP NOT NULL DEFAULT now(),	-- 가입일
memberVisit TIMESTAMP NOT NULL DEFAULT now(),	-- 최종 방문일
memberType INT,									-- 관리자 판매 일반 계정 구분 (1: 일반 / 2: 판매자 / 3: 관리자)
memberWithdraw char(1) DEFAULT 'n'				-- 탈퇴 (회원 정보 숨김) n/y
);

select * from member;

INSERT INTO member
VALUES ("서석희", "seohi9301", "seohi9301@naver.com", "q1w2e3r4t5", "01072719301", "부산시 수영구", "남자", 1);

ALTER TABLE member
ADD COLUMN memberAddr1 VARCHAR(250)NOT NULL,
ADD COLUMN memberAddr2 VARCHAR(250)NOT NULL,
ADD COLUMN memberAddr3 VARCHAR(250)NOT NULL;

ALTER TABLE member
DROP COLUMN memberAddr;

UPDATE member
SET memberWithdraw = 'n'
WHERE memberName = "서석희";

DROP TABLE member;

