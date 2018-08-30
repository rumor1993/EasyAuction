drop table ea_member cascade constraints

create table ea_member(
  	em_id varchar2(20) 	 	primary key, /*회원아이디*/
  	em_pass varchar2(20)	not null, /*회원 비밀번호*/
  	em_name varchar2(50) 	not null, /*회원이름*/
  	em_resid1 number(10)   	not null, /*주민번호 앞자리*/
  	em_resid2 number(10)   	not null, /*주민번호 뒷자리*/
  	em_gender varchar2(10) 	not null, /*회원 성별*/
  	em_phone varchar2(20) 	not null, /*핸드폰 번호*/
  	em_email varchar2(20)	not null, /*회원이메일*/
  	em_post varchar2(30) 	not null, /*우편번호*/ 
  	em_address1 varchar2(100) not null,/*주소*/
  	em_address2 varchar2(100) not null,/*상세주소*/
  	em_intro varchar2(200), 		  /*자기소개*/
  	em_point number(10), 	/*포인트*/
  	em_account varchar2(20) not null, /*환불계좌*/
  	em_bank	varchar2(10) not null,	/*환불은헹*/
  	em_date	 date 			not null, /*가입날짜*/
  	em_state number(10),	/*가입회원 1, 탈퇴회원 2 */
  	em_count number(10) 	/*경고 횟수*/
 );

/***** join_member 테이블의 join_code 시퀀스 생성 *****/
create sequence ea_member_joincode_seq 
increment by 1 start with 1 nocache;

drop sequence ea_member_joincode_seq; 

select * from ea_member order by em_date desc

update ea_member set em_point = 10000 where em_id = 'wisdom'

select month, count(month) as count from 
	(select substr(em_date, 4, 2) as month from ea_member )
		group by month order by month;
		
update ea_member set em_date = to_date('2018-08-05 10:13:15','YYYY-MM-DD HH24:MI:ss') where em_id = 'wisdom';

update ea_member set em_point = em_point + 1000 where em_id = 'admin';

select month, count(month) from
	(select substr(VDATE, 4, 2) as month from vt_member)
		group by month order by month;

delete from ea_member
		
insert into ea_member 
(em_id, em_pass, em_name, em_resid1, em_resid2, em_gender, em_phone, em_email, em_post, em_address1, em_address2, em_intro, em_point, em_account, em_bank, em_date, em_state, em_count) 
values
('admin', '1111', '이성희', 123456, 1234567, '남자', '010-1234-5678', 'admin@naver.com', '02725', '서울 성북구 길음로 2', '상세주소', 'ㅋㅋㅋ', 0, '10025550398701', '우리', sysdate, 1, 0)
