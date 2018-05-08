drop table img purge;

create table img(
	inum		NUMBER(7)		NOT NULL,
	mname		VARCHAR(20)		NOT NULL,
	title		VARCHAR(150)	NOT NULL,
	content		VARCHAR(2000)	NOT NULL,
	fname		VARCHAR(50)		not null,
	pw			VARCHAR(50)		NOT NULL,
	wdate		DATE			NOT NULL,
	viewcnt		NUMBER(5)		DEFAULT 0,
	filesize	NUMBER			DEFAULT 0,
	PRIMARY KEY(inum)
)

select*from img

--list
select inum, title, mname, fname, viewcnt, r
from(
	select inum, title, mname, fname, viewcnt, rownum r
	from(
		select inum, title, mname, fname, viewcnt
		from img
		order by inum desc
	)
)
where r>=1 and r<=5

--create
insert into img(inum, mname, title, content, fname, pw, wdate)
values((select nvl(max(inum),0)+1 as inum from img), 
		'가길동', '제목1', '내용1', 'myface.jpg', '1234', sysdate);
insert into img(inum, mname, title, content, fname, pw, wdate)
values((select nvl(max(inum),0)+1 as inum from img), 
		'나길동', '제목2', '내용2', 'member.jpg', '1234', sysdate);
insert into img(inum, mname, title, content, fname, pw, wdate)
values((select nvl(max(inum),0)+1 as inum from img), 
		'다길동', '제목3', '내용3', 'man.jpg', '1234', sysdate);
INSERT INTO img(inum, mname, title, content, fname, pw, wdate)  
VALUES((select nvl(max(inum),0)+1 as inum from img), 
'왕눈이', '제목', '내용', 'aaa1.jpg', '123', sysdate) ;

INSERT INTO img(inum, mname, title, content, fname, pw, wdate)  
VALUES((select nvl(max(inum),0)+1 as inum from img), 
'아로미', '제목', '내용', 'aaa2.jpg', '123', sysdate) ;

INSERT INTO img(inum, mname, title, content, fname, pw, wdate)  
VALUES((select nvl(max(inum),0)+1 as inum from img), 
'투투', '제목', '내용', 'aaa3.jpg', '123', sysdate) ;

INSERT INTO img(inum, mname, title, content, fname, pw, wdate)  
VALUES((select nvl(max(inum),0)+1 as inum from img), 
'김길동', '제목', '내용', 'aaa4.jpg', '123', sysdate) ;

INSERT INTO img(inum, mname, title, content, fname, pw, wdate)  
VALUES((select nvl(max(inum),0)+1 as inum from img), 
'홍길동', '제목', '내용', 'aaa5.jpg', '123', sysdate) ;
		
--read
select*from img
where inum=2

--update
update img
set title='제목이다',
	content='내용이네',
	fname='사진이군.jpg'
where inum=2

--delete
delete from img
where inum=1

--조회수 증가
update img
set viewcnt=viewcnt+1
where inum=2

--pwCheck
select count(inum) as cnt
from img
where inum=2 and pw='1234'

--total
