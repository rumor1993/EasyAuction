delete from EA_POINT;
SELECT * FROM EA_POINT;
drop table EA_POINT;
drop sequence point_seq;
create table EA_POINT(
EG_NUM	NUMBER(10) primary key,
EG_ID	VARCHAR2(30) not null,
EG_NAME	VARCHAR2(30) not null,
EG_RECOIN	NUMBER(15) not null,
EG_ORGCOIN	NUMBER(15) not null,
EG_STATE	VARCHAR2(30) not null,
EG_DATE	DATE not null,
EG_APPLY VARCHAR2(30) not null,
constraint EG_ID FOREIGN KEY(EG_ID)
REFERENCES ea_member(em_id)
);
update EA_POINT set EG_STATE = '완료';

create sequence point_seq
increment by 1
start with 1
nocache;

select * 
      from (select 
      rownum EP_NUM, 
      p.EP_KIND,
      p.EP_USER, 
      p.EP_SELLER, 
      p.EB_BOARDNUM,
      p.EB_ITEMNUM,
      p.EB_ITEMNAME,
      p.EB_FILE, 
      p.EP_PRICE, 
      p.EP_DATE,
      p.EP_RESULT,
      d.ED_COMPANY,
      d.ED_DELINUM 
      from EA_PLIST p full outer join EA_DELIVERY d on p.EB_ITEMNUM = d.EB_ITEMNUM 
      	where ep_user='fuck' order by EP_DATE desc)
      where EP_NUM >= 1 and EP_NUM<4 


drop table ea_cancel;
delete from ea_cancel;
/*취소이유*/
create table ea_cancel(
EX_NUM number(10) not null,
EM_ID varchar2(30) references ea_member(em_id),
EB_ITEMNUM varchar2(30) not null,
EX_REASON varchar2(1000) not null,
EX_DETAIL varchar2(3000),
EX_DATE date not null
);

select * from ea_cancel

drop sequence cancel_seq
create sequence cancel_seq 
increment by 1 start with 1 nocache;

select * from EA_DELIVERY;
delete from EA_DELIVERY;
drop table EA_DELIVERY;
create table EA_DELIVERY(
ED_NUM	    NUMBER(10) primary key,
RECEIVE_ID	VARCHAR2(30) not null,
SEND_ID  	VARCHAR2(50) not null,
EB_ITEMNUM  VARCHAR2(50) not null,
ED_COMPANY	VARCHAR2(30),
ED_DELINUM	VARCHAR2(50),
constraint RECEIVE_ID FOREIGN KEY(RECEIVE_ID)
REFERENCES ea_member(em_id),
constraint SEND_ID FOREIGN KEY(SEND_ID)
REFERENCES ea_member(em_id)
);

drop sequence delivery_seq
create sequence delivery_seq
increment by 1 start with 1 nocache;