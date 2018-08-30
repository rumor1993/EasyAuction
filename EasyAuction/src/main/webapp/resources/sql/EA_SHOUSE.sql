drop table EA_SHOUSE;
drop sequence EA_SHOUSE_SEQ;
create table EA_SHOUSE(
	SH_NUM NUMBER(10) primary key,	-- 입찰자가 입찰한 데이터와 관리자가 코멘트한 데이터의 총 번
	ESL_NUM NUMBER(10) not null,	-- foreign key 특별경매방 리스트에 배치된 임의 번호
	SH_BIDNUM  NUMBER(10) not null,	-- 특별경매방 리스트 번호
	EB_ITEMNUM VARCHAR2(50) references ea_board(eb_itemnum),	-- foreign key 특별경매 물품 번호
	EB_ITEMNAME VARCHAR2(300) not null,
	SH_BUYER varchar2(30) not null, -- 입찰자 또는 관리자
	SH_BIDPRICE number(20), -- 입찰가
	SH_ADKEY varchar2(50),	-- 관리자 코멘트에 해당하는 키워드
	SH_COMMENT varchar2(300),	-- 관리자 코멘트
	SH_BIDDATE date, -- 입찰 및 코멘트 날짜
	SH_BIDCOUNT	NUMBER(10) default 0 -- 입찰한 수
);

alter table EA_SHOUSE add constraint ebitemnum foreign key(eb_itemnum)
	references EA_BOARD(eb_itemnum) on delete cascade 

create sequence EA_SHOUSE_SEQ
increment by 1 start with 1 nocache

select  sysdate from dual;

date 072411462018

select * from EA_SHOUSE

delete from EA_SHOUSE

select * from EA_SHOUSE where sh_buyer = 'admin' order by sh_biddate desc

select * from(
select rownum rnum, sh_num, sh_bidnum, esl_num, eb_itemnum, eb_itemname,
				sh_buyer, sh_bidprice, sh_adkey, sh_comment, sh_biddate
	from EA_SHOUSE where sh_bidprice = (select max(sh_bidprice) from EA_SHOUSE
		where sh_buyer not in('admin')) and sh_buyer not in ('admin') and sh_bidnum = 1 and eb_itemnum = 'sp123123'
		order by sh_biddate asc)
	where rnum = 1



select rnum, sh_num, sh_bidnum from(
			select rownum rnum, sh_num, sh_bidnum, eb_itemnum, eb_itemname,
				sh_buyer, sh_bidprice, sh_adkey, sh_comment, sh_biddate
			from EA_SHOUSE where sh_bidprice = (select max(sh_bidprice) from EA_SHOUSE)
			order by sh_biddate asc) 

select * from EA_SHOUSE
    		where sh_bidnum = 1 and eb_itemnum = 'sp123123'
    			and sh_buyer = 'admin' and sh_bidprice = 3900
    			and sh_adkey not in ('입장', '미응찰')

  select * from EA_SHOUSE
    		where sh_bidnum = 1 and eb_itemnum = 'sp123123'
    			and sh_adkey = '미응찰'