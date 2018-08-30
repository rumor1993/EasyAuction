drop table ea_category cascade constraints

delete from ea_category cascade constraints

create table ea_category(
   ey_categorynum number(4) primary key,
   ey_bigcategory varchar2(100) not null, --대분류
   ey_smallcategory varchar2(100) not null --소분류
   
);


select distinct(ey_bigcategory) from ea_category

select * from ea_board b, ea_category c
		where b.eb_state = '특별오픈' and
		b.ey_categorynum = c.ey_categorynum and
		c.ey_bigcategory = '식품'


select * from ea_category

insert into ea_category
values(1, '패션의류', '여성의류');

insert into ea_category
values(2, '패션의류', '남성의류');

insert into ea_category
values(3, '패션의류', '여성언더웨어/잠옷');

insert into ea_category
values(4, '패션의류', '남성언더웨어/잠옷');
--------------------------------------------------
insert into ea_category
values(101, '패션잡화', '남성신발');

insert into ea_category
values(102, '패션잡화', '여성신발');

insert into ea_category
values(103, '패션잡화', '남성가방/잡화');

insert into ea_category
values(104, '패션잡화', '남성가방/잡화');

insert into ea_category
values(105, '패션잡화', '쥬얼리/시계/선글라스');

insert into ea_category
values(106, '패션잡화', '수입명품');
---------------------------------------------------
insert into ea_category
values(201, '유아용품', '기저귀/분유/유아식');

insert into ea_category
values(202, '유아용품', '임부복/출산/유아용품');

insert into ea_category
values(203, '유아용품', '장난감/인형/교육완구');

insert into ea_category
values(204, '유아용품', '유아동의류');

insert into ea_category
values(205, '유아용품', '유아동신발/잡화/가방');
----------------------------------------------------
insert into ea_category
values(301, '가구생활', '가구/DIY');

insert into ea_category
values(302, '가구생활', '조명/인테리어');

insert into ea_category
values(303, '가구생활', '침구/커튼');

insert into ea_category
values(304, '가구생활', '생활/욕실/수납용품');

insert into ea_category
values(305, '가구생활', '주방용품');

insert into ea_category
values(306, '가구생활', '화장지/물티슈/생리대');

insert into ea_category
values(307, '가구생활', '세제/구강');
-------------------------------------------------

insert into ea_category
values(401, '식품', '쌀/과일/농수축산물');

insert into ea_category
values(402, '식품', '건강식품/다이어트');

insert into ea_category
values(403, '식품', '커피/음료');

insert into ea_category
values(404, '식품', '즉석/간식/가공식품');
-------------------------------------------------------
insert into ea_category
values(501, '취미', '건강/의료용품');

insert into ea_category
values(502, '취미', '반려동물용품');

insert into ea_category
values(503, '취미', '악기/취미/키덜트');

insert into ea_category
values(504, '취미', '디자인/문구/사무용품');

insert into ea_category
values(505, '취미', '꽃/이벤트용품');
-------------------------------------------------------
insert into ea_category
values(601, '디지털컴퓨터', '카메라');

insert into ea_category
values(602, '디지털컴퓨터', '음향기기');

insert into ea_category
values(603, '디지털컴퓨터', '게임');

insert into ea_category
values(604, '디지털컴퓨터', '휴대폰');

insert into ea_category
values(605, '디지털컴퓨터', '태블릿');

insert into ea_category
values(606, '디지털컴퓨터', '노트북/PC');

insert into ea_category
values(607, '디지털컴퓨터', '모니터/프린터');

insert into ea_category
values(608, '디지털컴퓨터', 'PC주변기기');

insert into ea_category
values(609, '디지털컴퓨터', '저장장치');
----------------------------------------------------
insert into ea_category
values(701, '스포츠레저', '휘트니스/수영');

insert into ea_category
values(702, '스포츠레저', '스포츠의류/운동화');

insert into ea_category
values(703, '스포츠레저', '골프클럽/의류/용품');

insert into ea_category
values(704, '스포츠레저', '등산/아웃도어');

insert into ea_category
values(705, '스포츠레저', '캠핑/낚시');

insert into ea_category
values(706, '스포츠레저', '구기/라켓');

insert into ea_category
values(707, '스포츠레저', '자전거/보드');
----------------------------------------------------
insert into ea_category
values(801, '뷰티', '스킨케어');

insert into ea_category
values(802, '뷰티', '메이크업');

insert into ea_category
values(803, '뷰티', '향수');

insert into ea_category
values(804, '뷰티', '바디/헤어');

insert into ea_category
values(805, '뷰티', '기타화장품');
----------------------------------------------------
insert into ea_category
values(901, '생활가전', '대형가전');

insert into ea_category
values(902, '생활가전', '계절가전');

insert into ea_category
values(903, '생활가전', '주방가전');

insert into ea_category
values(904, '생활가전', '생활/미용가전');
-------------------------------------------------------
insert into ea_category
values(1001, '자동차공구', '자동차용품/블랙박스');

insert into ea_category
values(1002, '자동차공구', '타이어/오일/부품');

insert into ea_category
values(1003, '자동차공구', '공구/안전/산업용품');
-------------------------------------------------------
insert into ea_category
values(1101, '도서기타', '도서/교육/음반');

insert into ea_category
values(1102, '도서기타', '백화점/제화상품권');

insert into ea_category
values(1103, '도서기타', '여행/항공권');

insert into ea_category
values(1104, '도서기타', 'e쿠폰/모바일상품권');