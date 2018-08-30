create table ea_attent (
	ea_num NUMBER(10) NOT NULL PRIMARY KEY,
	ea_kind VARCHAR2(30) NOT NULL,
	ea_user VARCHAR2(30) references ea_member(em_id),
	eb_itemnum VARCHAR2(50) references ea_board(eb_itemnum),
	ea_date DATE NOT NULL
	)

drop table ea_attent

drop sequence basket_seq

select * from EA_ATTENT 
	

create sequence basket_seq
	start with 1
	increment by 1
	
insert into ea_attent values(
    	basket_seq.nextval, #{ea_kind}, #{ea_user},
   			 #{eb_itemnum}, sysdate )
   			 
   			 
 