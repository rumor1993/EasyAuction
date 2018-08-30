drop table EA_NOTICE;

DROP SEQUENCE EA_NOTICE_SEQ;

create table EA_NOTICE(
	EN_NUM		NUMBER(10)	not	null,	--글번호
	EN_ADMIN	VARCHAR2(30) not null,	--작성자
	EN_SUB 		VARCHAR2(300) not null,	--제목
	EN_CONT		VARCHAR2(4000) not null,--내용
	EN_HIT		NUMBER(20) not null,	--조회수
	EN_FILE		VARCHAR2(4000), 		--첨부 파일
	EN_ORIGINAL	VARCHAR2(4000),			--원본 파일
	EN_DATE		date,					--글 등록일
	PRIMARY KEY(EN_NUM)		
);

select * from (select substr(en_date, 1, 11) from ea_notice)

create sequence EA_NOTICE_SEQ
	increment by 1 start with 1 nocache;
	
select * from EA_NOTICE;

insert into EA_NOTICE
 values(EA_NOTICE_SEQ.nextval, 'hello', '1111', 'asdf', 'asdf', 0, File, ORGi, sysdate);
 					넘			네임		패스		제목	  	내용		조회 파일 오리지널 	데이ㅣ트