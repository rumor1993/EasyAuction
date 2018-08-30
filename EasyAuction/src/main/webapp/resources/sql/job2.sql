select ey_smallcategory from ea_category where ey_bigcategory = #{cate}

CREATE SEQUENCE JOB_TEST_SEQ;
DROP SEQUENCE JOB_TEST_SEQ;

CREATE TABLE JOB_TEST01(NO NUMBER, NAME VARCHAR2(10));
DROP TABLE JOB_TEST01;

CREATE OR REPLACE PROCEDURE INSERT_JOB_TEST01
IS
DECLARE
    
BEGIN
	INSERT INTO JOB_TEST01 VALUES(JOB_TEST_SEQ.NEXTVAL,
		DBMS_RANDOM.STRING('A', 3));
END ;

DROP PROCEDURE INSERT_JOB_TEST02;


DECLARE
	JNO NUMBER;
BEGIN
	DBMS_JOB.SUBMIT(JNO, 
			'INSERT_JOB_TEST02;',
			sysdate,
			'SYSDATE+1/1440',
			FALSE);
END;
SELECT * FROM USER_JOBS
SELECT * FROM EA_PLIST
select * from bid

SELECT * FROM INSERT_JOB_TEST02
delete ea_plist2


COMMIT

DECLARE
BEGIN
	DBMS_JOB.REMOVE(8);
	COMMIT;
END;

-----------------------1분마다 반복-----------------------
DECLARE
	PRO_ITEMNO EA_BOARD.EB_ITEMNUM%TYPE;
BEGIN
			EXECUTE IMMEDIATE 'SELECT EB_ITEMNUM FROM EA_BOARD WHERE EB_ITEMNAME = ''슬램덩크'' '
			INTO PRO_ITEMNO;
			
			DBMS_OUTPUT.PUT_LINE( 'PRO_ITEMNO : '   || PRO_ITEMNO );
END;

SELECT * FROM EA_GHOUSE
SELECT * FROM EA_BOARD


SELECT * FROM (SELECT EA_BOARD.EB_ITEMNUM, EA_BOARD.EB_STATE,EA_GHOUSE.GH_BUYER,EA_BOARD.EM_ID,
								EA_BOARD.EB_BOARDNUM, EA_BOARD.EB_ITEMNAME, EA_BOARD.EB_FILE, EA_BOARD.EB_LAPRICE 
								FROM EA_BOARD 
								INNER JOIN EA_GHOUSE
								ON EA_BOARD.EB_ITEMNUM = EA_GHOUSE.EB_ITEMNUM
	 							WHERE eb_ladate + 1/(24*60) between sysdate and sysdate + 1/(24*60) 
	 							ORDER BY EB_LAPRICE DESC)WHERE ROWNUM = 1





--------------------- 경매 종료된 게시물 가져오기 (그중에서 가장 최신으로 종료된 순서대로)
	 							
	 							
select * from ea_category
select * from ea_board inner join ea_category on ea_board.ey_categorynum = ea_category.ey_categorynum where ey_bigcategory = '생활가전'