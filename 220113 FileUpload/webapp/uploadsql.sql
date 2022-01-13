CREATE TABLE bookproduct(
	code NUMBER(5) PRIMARY KEY,
	name VARCHAR2(100),
	price NUMBER(8),
	pictureurl VARCHAR2(50),
	description VARCHAR2(1000)
);

CREATE SEQUENCE bookproduct_seq START WITH 1 INCREMENT BY 1;

INSERT INTO bookproduct
	VALUES(bookproduct_seq.nextVal, 'JQuery and JQuery mobile : 이해하기 쉽게 풀어쓴', 25000, 'jquery.jpg', '소스하나로 데스크탑과 모바일까지 HTML5와 함께 사용');
INSERT INTO bookproduct
	VALUES(bookproduct_seq.nextVal, '자바의 신', 30000, 'java.gif', '자바프로그래밍의 정석, 기초부터 실무까지');
INSERT INTO bookproduct
	VALUES(bookproduct_seq.nextVal, '오라클 데이터 베이스', 20000, '', '그림으로 공부하는 오라클 구조 개정판');
	
	

SELECT * FROM bookproduct;

UPDATE bookproduct SET price=30000 WHERE code=2;

DELETE FROM bookproduct WHERE name='아이폰';


INSERT INTO bookproduct
	VALUES(bookproduct_seq.nextVal, '아아아', 30000, 'iphone.jpg', '테스트');
	
	