drop table ea_point
drop sequence ea_point_seq

create table EA_POINT(
	EG_NUM   NUMBER(10) primary key,
	EG_ID   VARCHAR2(30) not null,
	EG_NAME   VARCHAR2(30) not null,
	EG_RECOIN   NUMBER(15) not null,
	EG_ORGCOIN   NUMBER(15) not null,
	EG_STATE   VARCHAR2(30) not null,
	EG_DATE   DATE not null,
	EG_APPLY VARCHAR2(30) not null,
	constraint EG_ID FOREIGN KEY(EG_ID)
	REFERENCES ea_member(em_id)
);

create sequence ea_point_seq
start with 1
increment by 1
nocache;

insert into ea_point
	values(ea_point_seq.nextval, 'admin', '관리자', 3000, 10000, '대기', sysdate, '반환')
	
select * from ea_point

select * from ea_point where eg_id = 'admin' and eg_state = '대기'


