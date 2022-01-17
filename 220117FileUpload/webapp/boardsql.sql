CREATE TABLE board(
	num NUMBER(10) PRIMARY KEY,
	pass VARCHAR2(30),
	userid VARCHAR2(30),
	email VARCHAR2(30),
	title VARCHAR2(30),
	content VARCHAR2(1000),
	readcount NUMBER(5) DEFAULT 0,
	writedate DATE DEFAULT sysdate
);

CREATE sequence board_seq START WITH 1 INCREMENT BY 1;

SELECT * FROM member;
ALTER TABLE member SET pwd='1234' WHERE userid='naggo';
UPDATE member SET pwd='1234' WHERE userid='naggo';
SELECT * FROM board;

INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'rose', '1234', 'noline@naver.com', '데뷔 전', '댄스 아카데미, 중소 기획사 등 여러 기획사에서 연습생 생활만 4년 7개월을 거쳤다고 한다');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'song', '1234', 'song@naver.com', '비주얼', '저 안 졸려요, 그렇게 생겼어요. 다 속았지?');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'chang', '1234', 'lee@naver.com', '향기', '처음에는 로우톤 혹은 허스키한 말할 때의 목소리가 어릴 때부터 콤플렉스여서 일부러 목소리를 바꾸어 냈더니 목이 쉬기도 했다.');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'naggo', '1234', 'nanaggo@naver.com', '비 오는 날', '웃을 땐 상당히 귀여운 인상이지만, 무표정할 때는 상당히 도도하고 냉미녀같은 인상을 준다.');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'honey', '1234', 'back@naver.com', '침대', '손가락이 길고 예쁘다. 그래서 작은 얼굴 옆에 두면 상당히 고급져 보인다.');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'nana', '1234', 'woo_nana@naver.com', '컬러렌즈', '밝고 유쾌한 모습 못지않게 여린 모습도 많은 편. 혼자 속상할 때가 많은 듯 하다.');
INSERT INTO board(num, userid, pass, email, title, content)
	VALUES(board_seq.nextVal, 'arin', '1234', 'omg_arin@naver.com', '킬포장인', '멤버들 중에 게임을 제일 잘 하는 편이고 승부나 내기도 잘 한다고 한다.');

SELECT * FROM member;

SELECT board_seq.nextVal FROM dual;
SELECT board_seq.currVal FROM dual;


CREATE TABLE reply(
	replynum NUMBER(10) PRIMARY KEY,
	boardnum NUMBER(10),
	userid VARCHAR2(20),
	writedate DATE DEFAULT sysdate,
	reply 	VARCHAR2(1000)
); 

CREATE sequence reply_seq START WITH 1 INCREMENT BY 1;

SELECT * FROM reply;




ALTER TABLE board ADD imgfilename VARCHAR2(50);
SELECT * FROM board;
















