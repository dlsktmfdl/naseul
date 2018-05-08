drop table bbs purge;

create table bbs(
	bbsno		number(7)		not null,
	wname		varchar(20)		not null,
	title		varchar(100)	not null,
	content		varchar(4000)	not null,
	passwd		varchar(15)		not null,
	viewcnt		number(5)		default 0,
	wdate		date			not null,
	grpno		number(7)		default 0,
	indent		number(2)		default 0,
	ansnum		number(5)		default 0,
	primary key(bbsno)
);

alter table bbs add (refnum	number	default 0)
alter table bbs add (filename  	varchar(30)	default '파일없음',
					 filesize	number 		default 0)


select * from bbs

delete from bbs
where indent>0

select count(refnum) from bbs
where refnum=0

--레코드 개수
select count(*) as cnt from bbs
where wname like '%나%'


-- create
select max(bbsno) as max from bbs;
select nvl(max(bbsno),0) as max from bbs;
select nvl(max(bbsno),0)+1 as bbsno from bbs;
-- ↑일련번호 생성

insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'왕눈이', '제목', '내용', '123', sysdate);
insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'아로미', '제목2', '내용2', '456', sysdate);
insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'투투', '제목3', '내용3', '789', sysdate);

-- read
select*from bbs
where bbsno=1;

-- update
update bbs
set wname	= '왕눈이',
	title	= '비오는날',
	content	= '개구리 연못'
where bbsno=1;

-- delete
delete from bbs
where bbsno=3;

-- list(paging)
select bbsno, wname, title, content, passwd, viewcnt, 
	   wdate, grpno, indent, ansnum, r
from(
	select bbsno, wname, title, content, passwd, viewcnt, 
		   wdate, grpno, indent, ansnum, rownum r
	from(
		select bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum
		from bbs
		
		order by grpno desc,ansnum
	)
)
where r>=5 and r<=10

--조회수 증가
update bbs
set viewcnt=viewcnt+1
where bbsno=2;

--패스워드 검증
select count(bbsno) as cnt
from bbs
where bbsno=2 and passwd='456';

--답변
DELETE FROM bbs where indent>0; 
 
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----   -----    ----- ------ ------ 
     1  부모글1     1      0      0 
 
      
 BBSNO  TITLE   	 	GRPNO INDENT ANSNUM 
 -----  -----    		----- ------ ------ 
     2  부모글2     	 		2      0      0 
     1  부모글1      			1      0      0 
     4    부모글1의 답변2		1	   1	  1
     5      부모글1의 답2답2	1	   2	  2
     3    부모글1의 답변1   	1	   1	  3
 
      
 BBSNO  TITLE            GRPNO INDENT ANSNUM 
 -----  -----            ----- ------ ------ 

 --부모글 생성
 insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'투투', '제목3', '내용3', '123', sysdate, 
(select nvl(max(grpno),0)+1 from bbs)
);
