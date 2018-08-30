drop table EA_FAQ;

drop sequence EA_FAQ_SEQ

create table EA_FAQ(
	EF_NUM		NUMBER(10)	not	null,	--글번호
	EF_CATE		VARCHAR2(30) not null,	--등록 카테고리
	EF_ADMIN	VARCHAR2(30) not null,	--작성자
	EF_SUB 		VARCHAR2(300) not null,	--제목
	EF_CONT		VARCHAR2(4000) not null,--내용
	EF_FILE		VARCHAR2(4000), 		--첨부 파일
	EF_ORIGINAL	VARCHAR2(4000),			--원본 파일
	EF_DATE		date,					--글 등록일
	PRIMARY KEY(EF_NUM)		
);

create sequence EA_FAQ_SEQ
	increment by 1 start with 1 nocache;

select * from EA_FAQ;

insert into EA_FAQ
 values('','',);
 
 
 select * from
			(select rownum rnum, ef_num, ef_cate, ef_admin, ef_sub, ef_cont,
		 			ef_file, ef_original, ef_date
		 		from (select * from ea_faq
		 	where ef_sub like '%dad%'
		 	order by ef_num desc))