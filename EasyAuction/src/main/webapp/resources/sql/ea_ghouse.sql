drop table ea_ghouse
drop sequence ghouse_seq

create table ea_ghouse (
	gh_num NUMBER(10) NOT NULL PRIMARY KEY,
	eb_boardnum NUMBER(10) NOT NULL,
	eb_itemnum VARCHAR2(50) NOT NULL,
	gh_buyer VARCHAR2(50) NOT NULL,
	gh_bidprice NUMBER(20),
	gh_biddate DATE
	)
	
	select * from ea_ghouse
	
create sequence ghouse_seq
	start with 1
	increment by 1
	
		select * from ea_ghouse order by gh_bidprice desc where eb_itemnum = #{eb_itemnum}