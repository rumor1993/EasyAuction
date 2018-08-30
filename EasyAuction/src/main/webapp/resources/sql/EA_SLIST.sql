CREATE TABLE EA_SLIST(
	ES_NUM NUMBER(10) NOT NULL PRIMARY KEY,
	ES_KIND VARCHAR2(30) NOT NULL,
	ES_USER VARCHAR2(30) NOT NULL,
	ES_BUYER VARCHAR2(30) NOT NULL,
	EB_BOARDNUM NUMBER(10) NOT NULL,
	EB_ITEMNUM VARCHAR2(50) references ea_board(eb_itemnum),
	EB_ITEMNAME VARCHAR2(300) NOT NULL,
	EB_FILE VARCHAR2(500) NOT NULL,
	ES_PRICE NUMBER(20) NOT NULL,
	ES_DATE DATE NOT NULL
)

drop table ea_slist cascade constraints
drop sequence slist_seq


create table ea_plist (
	EP_NUM NUMBER(10) NOT NULL PRIMARY KEY,
	EP_KIND VARCHAR2(30) NOT NULL,
	EP_USER VARCHAR2(30) NOT NULL,
	EP_SELLER VARCHAR2(30) NOT NULL,
	EB_BOARDNUM NUMBER(10) NOT NULL,
	EB_ITEMNUM VARCHAR2(50) references ea_board(eb_itemnum),
	EB_ITEMNAME VARCHAR2(300) NOT NULL,
	EB_FILE VARCHAR2(500) NOT NULL,
	EP_PRICE NUMBER(20) NOT NULL,
	EP_DATE DATE NOT NULL,
	EP_RESULT VARCHAR(20) NOT NULL
	
)

drop table ea_plist cascade constraints
drop sequence plist_seq


delete from ea_plist


alter table EA_PLIST add constraint epitemnum foreign key(eb_itemnum)
	references EA_BOARD(eb_itemnum) on delete cascade 

select * from ea_plist
create sequence plist_seq
	start with 1
	increment by 1
	
	create sequence slist_seq
	start with 1
	increment by 1
	
drop sequence slist_seq
drop sequence plist_seq

select * from ea_plist where ep_user = 'qwer'

select * from ea_cancel c full outer join ea_plist p 
    		on c.eb_itemnum = p.eb_itemnum
    		where p.ep_user = 'qwer' and p.ep_result = '취소대기'