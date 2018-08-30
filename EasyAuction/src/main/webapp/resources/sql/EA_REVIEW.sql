drop table ea_reply;
drop sequence ea_reply_seq

create table ea_reply(
	er_num	number(10) primary key, 
	em_id	varchar2(30) references ea_member(em_id),	
	er_pass	number not null,
	er_kind	varchar2(50),	
	er_itemnum	varchar2(50) references ea_board(eb_itemnum), 
	er_itemname varchar2(300),
	er_sub		varchar2(300) not null,
	er_cont		varchar2(4000) not null,
	er_hit		number(20),
	er_file		varchar2(4000),
	er_original	varchar2(4000),
	er_date		date
);
 select * from ea_reply

delete from ea_reply where er_num = 3

select * from
	(select rownum rnum, er_num, em_id, er_pass, er_kind,
		er_itemnum, er_itemname, er_sub, er_cont, er_hit,
		er_file, er_original, er_date from 
			(select * from ea_reply order by er_date desc))
where rnum between 1 and 4

update ea_reply set er_file = '/2018-7-25/review201872560823601.jpg', er_original = 'abc.jpg'
	where em_id = 'admin2'

insert into ea_reply
values (ea_reply_seq.nextval, 'admin2', '1234', '일반', 'SP18073018', '자전거',
	'자전거 경매 받았어요', '상당히 깨끗하고 좋네요.', 14,
	'/2018-7-25/review201872560823602.jpg', 'apple.jpg', sysdate)
	
insert into ea_reply
values (ea_reply_seq.nextval, 'admin2', '1234', '일반', 'SP18073019', '컴퓨터',
	'컴퓨터 경매 받았어요', '상당히 깨끗하고 좋네요.', 26,
	'/2018-7-25/review201872560823602.jpg', 'apple.jpg', sysdate)
	
insert into ea_reply
values (ea_reply_seq.nextval, 'admin2', '1234', '특별', 'SP18073020', '인형',
	'인형 경매 받았어요', '상당히 깨끗하고 좋네요.', 23,
	'/2018-7-25/review201872560823601.jpg', 'abc.jpg', sysdate)
	
insert into ea_reply
values (ea_reply_seq.nextval, 'admin2', '1234', '특별', 'SP18073016', '컴퓨터',
	'컴퓨터 경매 받았어요', '상당히 깨끗하고 좋네요.', 10,
	'/2018-7-25/review201872560823601.jpg', 'abc.jpg', sysdate)

select sysdate from dual;

create sequence ea_reply_seq
start with 1
increment by 1
nocache;

drop sequence ea_reply_seq;

select * from ea_reply;

select * from ea_reply; 
select ea_reply_seq.currval from dual;
select ea_reply_seq.nextval from dual;
select * from user_sequences;
 
select * 
		from 
		 (select rownum rnum, er_num,er_itemnum, 
		         er_itemname,er_sub,
		         em_id,er_date,
		         er_hit

	 	  from  
	  	   (select * from  ea_reply))
	
	    where  rnum >= ((10-1) * 10 + 1)  
	       and rnum <= (10 * 10)
	       
	       
	       
	       select count(er_num) from ea_reply
				where em_id like '%m%'