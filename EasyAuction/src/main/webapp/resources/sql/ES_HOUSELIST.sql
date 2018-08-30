drop table ES_HOUSELIST;
drop sequence ES_HOUSELIST_SEQ;


create sequence ES_HOUSELIST_SEQ
increment by 1 start with 1 nocache;

select * from es_houselist;

insert into ES_HOUSELIST
	values(es_houselist_seq.nextval, 1, 34, 'sp123123', 'iphone9', 5000, 0, sysdate)

update ES_HOUSELIST
	set esl_count = 2
	where sh_bidnum = 1
	
delete from ES_HOUSELIST

create table ES_HOUSELIST(
	esl_num NUMBER(10) primary key,	-- 특별경매방 리스트에 배치된 임의 번호
	sh_bidnum NUMBER(10) not null, --방번호
	eb_itemnum VARCHAR2(50) references ea_board(eb_itemnum),	-- foreign key 특별경매게시판의 물품 번호
	EB_ITEMNAME VARCHAR2(300),
	EB_STPRICE NUMBER(30),
	ESL_COUNT NUMBER(10) not null, -- 경매장 입장수
	esl_date DATE not null -- 날짜
)



insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-06 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-06 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-06 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-06 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-06 19:00', 'RR-MM-DD HH24:MI'));
--------------------------------------------------------------------------------------------------------------------------------------------
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-07 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-07 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-07 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-07 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-07 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-08 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-08 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-08 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-08 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-08 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-09 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-09 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-09 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-09 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-09 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-10 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-10 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-10 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-10 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-10 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-11 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-11 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-11 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-11 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-11 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-12 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-12 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-12 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-12 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-12 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-13 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-13 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-13 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-13 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-13 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-14 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-14 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-14 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-14 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-14 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-15 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-15 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-15 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-15 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-15 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-16 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-16 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-16 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-16 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-16 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-17 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-17 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-17 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-17 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-17 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-18 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-18 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-18 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-18 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-18 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-19 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-19 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-19 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-19 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-19 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-20 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-20 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-20 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-20 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-20 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-21 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-21 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-21 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-21 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-21 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-22 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-22 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-22 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-22 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-22 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-23 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-23 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-23 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-23 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-23 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-24 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-24 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-24 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-24 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-24 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-25 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-25 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-25 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-25 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-25 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-26 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-26 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-26 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-26 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-26 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-27 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-27 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-27 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-27 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-27 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-28 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-28 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-28 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-28 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-28 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-29 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-29 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-29 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-29 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-29 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-30 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-30 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-30 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-30 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-30 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------

insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 1, '', 0, to_date('2018-08-31 11:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 2, '', 0, to_date('2018-08-31 13:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 3, '', 0, to_date('2018-08-31 15:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 4, '', 0, to_date('2018-08-31 17:00', 'RR-MM-DD HH24:MI'));
	
insert into ES_HOUSELIST(esl_num, sh_bidnum, eb_itemnum, esl_count, esl_date)
values(es_houselist_seq.nextval, 5, '', 0, to_date('2018-08-31 19:00', 'RR-MM-DD HH24:MI'));

---------------------------------------------------------------------------------------------------------