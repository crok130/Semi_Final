SELECT * FROM book_requests ORDER BY request_id DESC;

INSERT INTO book_requests VALUES(null, null, "여여", "야야", "요요", "827", null);
INSERT INTO book_requests VALUES(null, null, "호호", "유유", "개어", "827", null);
INSERT INTO book_requests VALUES(null, null, "여강", "후야", "해구", "827", null);
INSERT INTO book_requests VALUES(null, null, "여규", "요야", "개아", "827", null);
INSERT INTO book_requests VALUES(null, null, "여해", "야유", "베우", "827", null);


SELECT count(*) AS count FROM book_requests  WHERE (title LIKE '%나%' OR author LIKE '%나%' OR publisher LIKE '%나%')
ORDER BY request_id DESC