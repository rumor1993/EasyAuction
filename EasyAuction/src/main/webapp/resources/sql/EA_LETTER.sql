
drop table ea_letter;
drop sequence ea_letter_seq

create table EA_LETTER(
	el_num NUMBER PRIMARY KEY,
	eb_itemnum varchar2(50) references ea_board(eb_itemnum),
	el_request VARCHAR2(30) NOT NULL,
	el_response VARCHAR2(30) NOT NULL,
	el_confirm VARCHAR2(20),
	el_date DATE not null
)

create sequence ea_letter_seq
start with 1
increment by 1
nocache;

insert into EA_LETTER
	values(ea_letter_seq.nextval, 'CP18073016', 'asdf', 'admin', null, sysdate)
	
insert into EA_LETTER
	values(ea_letter_seq.nextval, 'CP18073015', 'asdf', 'admin', null, sysdate)
	
insert into EA_LETTER
	values(ea_letter_seq.nextval, 'CP18073020', 'asdf', 'admin', null, sysdate)

create table ea_ghouse (
	gh_num NUMBER(10) PRIMARY KEY,
	eb_boardnum NUMBER(10) NOT NULL,
	eb_itemnum VARCHAR2(50) references ea_board(eb_itemnum),
	gh_buyer VARCHAR2(50) NOT NULL,
	gh_bidprice NUMBER(20),
	gh_biddate DATE
	)
	
	select * from ea_ghouse
	
create sequence ghouse_seq
	start with 1
	increment by 1


select g.* from ea_board b full outer join ea_ghouse g
	on b.eb_itemnum = g.eb_itemnum
	where b.eb_itemnum = g.eb_itemnum
		and b.eb_laprice = g.gh_bidprice
	

insert into ea_ghouse
	values(ea_letter_seq.nextval, 7, 'CP18073018', 'asdf', 300000, sysdate)