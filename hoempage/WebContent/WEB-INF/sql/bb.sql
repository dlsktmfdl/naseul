DROP TABLE bbs PURGE;

CREATE TABLE bbs ( 
  bbsno   NUMBER(7)     NOT NULL, 
  wname   VARCHAR(20)   NOT NULL,  
  title   VARCHAR(100)  NOT NULL, 
  content VARCHAR(4000) NOT NULL,  
  passwd  VARCHAR(15)   NOT NULL, 
  viewcnt NUMBER(5)     DEFAULT 0, 
  wdate   DATE          NOT NULL, 
  grpno   NUMBER(7)     DEFAULT 0, --부모글 번호
  indent  NUMBER(2)     DEFAULT 0, --답변여부
  ansnum  NUMBER(5)     DEFAULT 0, --답변순서 
  PRIMARY KEY (bbsno)  
); 

alter table bbs
add(refnum  number  default 0);

alter table bbs
add(filename varchar(30), 
	filesize number default 0);


select * from BBS;

delete from bbs 
where indent > 0

select count(refnum) from bbs
where refnum = 1;


--레코ㅓ드 개수
select count(*) from bbs
where wname like '%아%'



--create
--일련변호
select NVL(Max(bbsno),0)+1 as bbsno From bbs;

insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'왕눈이','제목','내용','123',sysdate);

insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'아로미','제목','내용','123',sysdate);

insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'투투','제목','내용','123',sysdate);

--read
select * from BBS
where bbsno =1;

--update
update bbs
set wname ='왕눈이', title='비오느날' ,content='개구리 연못'
where bbsno =1;

--delete
delete from bbs
where bbsno =1;


--list(paging)
SELECT bbsno, wname, title, content, viewcnt, wdate, grpno, indent, ansnum, 
	 r
from(
	SELECT bbsno, wname, title, content, viewcnt, wdate, grpno, indent, ansnum, 
	rownum r
	from(
		SELECT bbsno, wname, title, content, viewcnt, wdate, grpno, indent, ansnum
		from bbs
		--검색(if)
		order by grpno desc, ansnum
	)
)
where r >= 1 and r <= 10

--순서가 오름차순이나 내림차순으로 엉망일때 그곳으로부터 rownum을 사용하기위해 r로 지정해주고 그곳으로 부터 r을 순서대로 정렬
--무조건 1부터 


--조회수 증가
update bbs
set viewcnt = viewcnt +1
where bbsno=2;


--패스워드 검증
select count(bbsno)as cnt
from BBS
where bbsno=2 and passwd='123';

--답변 
DELETE FROM bbs; 
 
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----   -----    ----- ------ ------ 
     1  부모글1     1      0      0 
 
      
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     2  부모글2      2      0      0 
     1  부모글1      1      0      0 
 
      
 BBSNO  TITLE            GRPNO INDENT ANSNUM 
 -----  -----            ----- ------ ------ 
 	 1  부모글1              1     0      0
 	 4     답변2             1     1      1
 	 5      답변(1)          1     2      2
 	 3     답변1             1     1      3
     2  부모글2              2     0      0
     
     
--부모글 생성
insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
'투투','제목3','내용3','123',sysdate,
(select nvl(max(grpno),0) + 1 from bbs)
);

delete from bbs
where indent>0
     