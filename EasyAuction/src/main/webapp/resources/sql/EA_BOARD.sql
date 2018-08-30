select * from ( select rownum rnum, eb_itemnum, eb_boardnum, em_id, eb_pass, eb_kind, eb_state, eb_itemname, eb_cont, eb_drprice, eb_stprice, eb_laprice, eb_madein, eb_bidcount,ey_categorynum, eb_file, eb_original, eb_hit, eb_audate, eb_stdate, eb_attcount, eb_ladate from (select * from ea_board WHERE eb_kind = '일반' and eb_ladate > sysdate order by eb_boardnum desc )) 
		
drop table ea_board cascade constraints;
drop sequence board_seq;

create table ea_board(
   eb_itemnum varchar2(50) primary key, --물품 번호
   eb_boardnum number(10) not null, --글 번호
   em_id varchar2(30) references ea_member(em_id),
   eb_pass number(30) not null,
   eb_kind varchar2(30) not null,
   eb_state varchar2(30) not null,
   eb_itemname varchar2(300) not null,
   eb_cont varchar2 (4000) not null,
   eb_drprice number(20),			--즉시입찰가
   eb_stprice number(20),			--시작가
   eb_laprice number(20),		--판매가(최고가)
   eb_madein varchar2(50),		--원산지
   ey_categorynum number(4) references ea_category(ey_categorynum),	--카테고리
   eb_bidcount number(20),		--입찰수
   eb_attcount number(20),		--관심수
   eb_file varchar2(4000),		--첨부 파일
   eb_original varchar2(4000),	--원본 파일
   eb_hit number(20) not null,	--글 조회수
   eb_audate date,				--경매 오픈날짜&시간
   eb_stdate date not null,	--작성한 날짜
   eb_saledate date,	--판매된 날짜
   eb_ladate date,		--종료 날짜
   eb_choicedate date
);

update ea_board set eb_stdate = to_date('2018-04-05 10:13:15','YYYY-MM-DD HH24:MI:ss') where eb_boardnum = 73 and eb_kind = '일반';

select * from ea_board where substr(eb_audate, 1, 10) = substr(sysdate, 1, 10)

delete from ea_board where eb_itemnum = 'CP18081469';

update ea_board
    		set eb_laprice = 1600000
    		where eb_itemnum = 'SP18080830'
    	common20188940367433.jpg
    		update ea_board set eb_file = '\2018-8-9\common20188940367433.jpg' where eb_itemname = '기계식키보드'

    		<img alt="이미지" src="./resources/upload/2018-8-9/common20188940367433.jfif" width="60%" height="400px">
    		
update EA_BOARD
	set eb_state = '대기'
	where eb_kind = '특별'

select * from ea_board where eb_kind = '특별' and eb_state = '금일오픈'

select * from ea_board where eb_kind = '일반';

	select * from 
		(select rownum rnum, eb_itemnum, eb_boardnum, em_id, eb_state, 
			eb_itemname, eb_cont, eb_drprice, eb_stprice, eb_laprice, eb_madein,
			ey_categorynum, eb_bidcount, eb_attcount, eb_file, eb_original, eb_hit, 
			eb_audate, eb_stdate, eb_saledate, eb_ladate, eb_choicedate from 
			(select * from ea_board where substr(eb_itemnum, 1, 2) = 'SP' 
				order by eb_ladate desc)) 
	where rnum between 1 and 4

select * from 
	(select rownum rnum, eb_itemnum, eb_boardnum, em_id, eb_state, 
		eb_itemname, eb_cont, eb_drprice, eb_stprice, eb_laprice, eb_madein,
		ey_categorynum, eb_bidcount, eb_attcount, eb_file, eb_original, eb_hit, 
		eb_audate, eb_stdate, eb_saledate, eb_ladate, eb_choicedate from 
		(select * from ea_board order by eb_ladate desc)) 
where rnum between 1 and 4

select * from 
	(select rownum rnum, eb_itemnum, eb_boardnum, em_id, eb_state, 
		eb_itemname, eb_cont, eb_drprice, eb_stprice, eb_laprice, eb_madein,
		ey_categorynum, eb_bidcount, eb_attcount, eb_file, eb_original, eb_hit, 
		eb_audate, eb_stdate, eb_saledate, eb_ladate, eb_choicedate from 
		(select * from ea_board order by eb_attcount desc)) 
where rnum between 1 and 4

select * from 
			(select rownum rnum, eb_itemnum, eb_boardnum, em_id, eb_state, 
				eb_itemname, eb_cont, eb_drprice, eb_stprice, eb_laprice, eb_madein,
				ey_categorynum, eb_bidcount, eb_attcount, eb_file, eb_original, eb_hit, 
				eb_audate, eb_stdate, eb_saledate, eb_ladate, eb_choicedate from 
				(select * from ea_board where substr(eb_itemnum, 1, 2) = 'SP' 
						and substr(eb_audate, 1, 10) = substr(sysdate, 1, 10)
						and (eb_state = '금일오픈' or eb_state = '오픈')
					order by eb_audate)) 

create sequence board_seq
	start with 1
	increment by 1
	
select month, count(month) as count from
    		(select substr(eb_stdate, 4, 2) as month from ea_board
    			where substr(eb_itemnum, 1, 2) = 'CP')
    			group by month order by month  	
    			
select category, count(num) as count from
(select ea_category.ey_bigcategory as category, ea_board.ey_categorynum as num 
	from ea_board full outer join ea_category on ea_board.ey_categorynum = ea_category.ey_categorynum
	where substr(eb_itemnum, 1, 2) = 'CP')
	group by category order by category
	
	
update ea_board set eb_stdate = to_date('2018-01-05 10:13:15','YYYY-MM-DD HH24:MI:ss') where em_id = 'admin' and eb_itemnum='CP18073017';
	
insert into ea_board
	values('CP18073018', 7, 'admin', 1234, '일반', '자전거', '엄청 좋은 자전거입니다.', 300000, 100000, 300000, '한국', 303, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);

insert into ea_board
	values('CP18073019', 8, 'admin', 1234, '일반', '컴퓨터', '엄청 좋은 컴퓨터입니다.', 3000000, 1000000, 2000000, '한국', 403, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);
		
insert into ea_board
	values('CP18073020', 9, 'admin', 1234, '일반', '인형', '엄청 좋은 인형입니다.', 300000, 100000, 300000, '한국', 902, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);
		
insert into ea_board
	values('CP18073021', 10, 'admin', 1234, '일반', '인형', '엄청 좋은 인형입니다.', 300000, 100000, null, '한국', 902, 8, 9, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);
		

update ea_board set eb_stdate = to_date('2018-04-05 10:13:15','YYYY-MM-DD HH24:MI:ss') where em_id = 'admin2' and eb_itemnum='SP18073014';
		
insert into ea_board
	values('SP18073018', 7, 'admin2', 1234, '특별', '자전거', '엄청 좋은 자전거입니다.', 300000, 100000, 300000, '한국', 804, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);

insert into ea_board
	values('SP18073019', 8, 'admin2', 1234, '특별', '컴퓨터', '엄청 좋은 컴퓨터입니다.', 3000000, 1000000, 2000000, '한국', 1001, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);
		
insert into ea_board
	values('SP18073020', 9, 'admin2', 1234, '특별', '인형', '엄청 좋은 인형입니다.', 300000, 100000, 300000, '한국', 1103, 3, 5, '/2018-7-25/review201872560823601.jpg', 'abc.jpg', 
		10, null, sysdate, null, null, null);
		


ALTER TABLE ea_board
ADD(eb_choicedate date); 

select * from
user_cons_columns;

select * from ea_board

update ea_board
set eb_attcount = 0

update ea_board
    	set eb_attcount = eb_attcount+1
    	where eb_itemnum = '연필깍이'


update EA_BOARD
set eb_audate = to_date('2018-07-27 16:33','RR-MM-DDHH24:MI'),
	eb_state = '특별오픈준비'
where eb_boardnum in(1,2,3,4,5)

update EA_BOARD
set eb_audate = to_date('2018-08-12 09:12:02','RR-MM-DDHH24:MI:SS') +1,
	eb_ladate = to_date('2018-08-12 09:12:02','RR-MM-DDHH24:MI:SS') + 7
where eb_itemnum = 'CP18081215'


order by eb_hit desc

update ea_board
		set eb_hit = eb_hit+1
		where eb_itemnum = '야구공'
		
select count(*) from ea_board where em_id like 'easy' and eb_kind = '일반'

-----------------------------------------------------------

insert into ea_board
values('수정테이프', 1, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 1,
		0, '수정테이프.jpg', '', 0, '', sysdate, '', '');
		
insert into ea_board
values('신발', 2, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 2,
		0, '신발.jpg', '', 0, '', sysdate, '', '');
		
insert into ea_board
values('야구공', 3, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 3,
		0, '야구공.jpg', '', 0, '', sysdate, '', '');

insert into ea_board
values('연필깍이', 4, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 4,
		0, '연필깍이.jpg', '', 0, '', sysdate, '', '');
		
insert into ea_board
values('지갑', 5, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 1,
		0, '지갑.jpg', '', 0, '', sysdate, '', '');
insert into ea_board
values('차키', 6, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 2,
		0, '차키.jpg', '', 0, '', sysdate, '', '');
		
insert into ea_board
values('책', 7, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 101,
		0, '책.jpg', '', 0, '', sysdate, '', '');
		
insert into ea_board
values('카메라', 8, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 103,
		0, '카메라.jpg', '', 0, '', sysdate, '', '');

insert into ea_board
values('캠', 9, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 104,
		0, '캠.jpg', '', 0, '', sysdate, '', '');		
		
insert into ea_board
values('피아노', 10, 'koolhyo', 5214, '특별완료', '명품도자기', '좋아용', 0, 1000, 0, '', 201,
		0, '피아노.jpg', '', 0, '', sysdate, '', '');			
		
		
			select * from (
		select rownum rnum,
    		eb_itemnum, eb_boardnum, em_id, eb_pass, eb_kind,
    		eb_state, eb_itemname, eb_cont, eb_drprice,
    		eb_stprice, eb_laprice, eb_madein, eb_bidcount,ey_categorynum,
    		eb_file, eb_original, eb_hit, eb_audate, eb_stdate, eb_attcount, eb_ladate
		from (select * from ea_board 	)) where eb_kind = '일반' and eb_ladate < sysdate
		
					select * from (
		select rownum rnum,
    		eb_itemnum, eb_boardnum, em_id, eb_pass, eb_kind,
    		eb_state, eb_itemname, eb_cont, eb_drprice,
    		eb_stprice, eb_laprice, eb_madein, eb_bidcount,ey_categorynum,
    		eb_file, eb_original, eb_hit, eb_audate, eb_stdate, eb_attcount, eb_ladate
		from (select * from ea_board 	)where eb_kind = '일반' and eb_ladate < sysdate) 
		where rnum >= 1 and rnum <= 5 
		
