create table ea_attent (
   ea_num NUMBER(10) NOT NULL PRIMARY KEY,
   ea_kind VARCHAR2(30) NOT NULL,
   ea_user VARCHAR2(30) NOT NULL,
   eb_itemnum VARCHAR2(50) NOT NULL,
   ea_date DATE NOT NULL
   )
   
select * from EA_ATTENT 
   
drop table ea_attent
create sequence basket_seq
   start with 1
   increment by 1
   
insert into ea_attent values(
       basket_seq.nextval, '일반', 'admin',
             'CP18072526', sysdate )
             
             select * from ea_board;
create table ea_board(
   eb_itemnum VARCHAR2(50) NOT NULL PRIMARY KEY,
   eb_boardnum NUMBER(10) NOT NULL,
   em_id VARCHAR2(30) NOT NULL,
   eb_pass NUMBER(30) NOT NULL,
   eb_state VARCHAR2(30) NOT NULL,
   eb_itemname VARCHAR2(300) NOT NULL,
   eb_cont VARCHAR2(4000) NOT NULL,
   eb_drprice NUMBER(20) NOT NULL,
   eb_stprice NUMBER(20) NOT NULL,
   eb_laprice NUMBER(20),
   eb_madein VARCHAR2(50),
   eb_bidcount NUMBER(20),
   eb_attcount NUMBER(20),
   eb_file VARCHAR2(4000),
   eb_original VARCHAR2(4000),
   eb_hit NUMBER(20) NOT NULL,
   eb_stdate DATE NOT NULL,
   eb_saledate DATE,
   eb_ladate DATE,
   eb_regdate DATE
)

       insert into ea_board (
          eb_itemnum, eb_boardnum, em_id, eb_pass,
          eb_state, eb_itemname, eb_cont, eb_drprice,
          eb_stprice, eb_laprice, eb_madein, eb_bidcount,
          eb_file, eb_original, eb_hit, eb_regdate, eb_stdate, eb_attcount, eb_ladate
         )
       values(
          'CP18072526', board_seq.nextval, 'admin', '123',
          '일반경매','댕댕이','<p><img src="http://localhost:8088/auction/resources/photoUpload/201807251035499fc17b07-4b9d-4128-b7f8-1b7aa9536424.jpg" title="1658813E4E822D6B19.jpg"><br style="clear:both;">&nbsp;</p>',400,
          '1000', '6000', '한국', 0,
          'minion.png', 'minion.png', 0, sysdate , (sysdate+1), 0, (sysdate+7)
       )
select count(a.eb_itemnum) 
from ea_attent a
where ea_user='admin'
       
create table EA_SLIST(
ES_NUM number(10),
ES_KIND varchar2(30),
ES_USER varchar2(30),
ES_BUYER varchar2(30),
EB_BOARDNUM number,
EB_ITEMNUM,
EB_ITEMNAME,
EB_FILE,
ES_PRICE,
ES_DATE
);
