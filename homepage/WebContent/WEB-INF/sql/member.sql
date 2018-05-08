drop table member purge;

create table member(
	id			varchar(10)		not null,
	passwd		varchar(20)		not null,
	mname		varchar(20)		not null,
	tel			varchar(14)		not null,
	email		varchar(50)		not null unique, --unique는 중복x
	zipcode		varchar(7)		null,
	address1	varchar(150)	null,
	address2	varchar(50)		null,
	job			varchar(20)		not null,
	mdate		date			not null,
	fname		varchar(50)		default 'member.jpg',
	grade		char(1)			default 'H', --일반회원:H, 정지:Y, 손님:Z
	primary key(id)
)

select *from member

--create
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade)
values('user1','1234','개발자1','123-1234','email1@mail.com','123-123','인천시','남동구','A01',sysdate,'daniel.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade)
values('user2','1234','개발자2','123-1234','email2@mail.com','123-123','광명시','남동구','A01',sysdate,'man.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade)
values('admin','1234','관리자','123-1234','admin@mail.com','123-123','용인시','남동구','A01',sysdate,'krystal.jpg','A');

--아이디 중복 검사
select count(id) 
from member
where id='user1';

--이메일 중복 검사
select count(email) as cnt 
from member
where email='email1@mail.com';

--read
select id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade
from member
where id='user1';

--update(이미지 수정)
update member
set fname=''
where id='user1';

--update(패스워드 변경)
update member
set passwd='1234'
where id='';

--update(회원정보 수정)
update member
set passwd	=	'test',
	tel		=	'123-123',
	email	=	'email10',
	zipcode	=	'test',
	address1=	'수원',
	address2=	'팔달구',
	job		=	'test'
where id='user3';

--delete
delete from member
where id='user3';

--로그인 sql
select count(id) as cnt
from member
where id='user1' and passwd='1234';

--list
select id, mname, tel, email, zipcode, address1, address2, fname, r
from(
	select id, mname, tel, email, zipcode, address1, address2, fname, rownum r
	from(
		select id, mname, tel, email, zipcode, address1, address2, fname
		from member
		where mname like '%홍%'
		order by mdate desc
	)
)
where r>=1 and r<=5

delete from MEMBER
where id='111'

select *from member where id='user2'

update member
set fname=default
where id='54528'