DROP TABLE member;

select * from member; 

--테이블 생성

CREATE TABLE member(
	id VARCHAR(10) not null,   --아이디 중복x
	passwd varchar(20) not null, --패스워드 영문조합
	mname varchar(20) not null,
	tel varchar(14) null, --전번
	email varchar(50) not null unique, --전자우편 중복x
	zipcode varchar(7) null, --우편번호
	address1 varchar(150) null, --주소1
	address2 varchar(50) null, --주소2
	job varchar(20) not null, --직업
	mdate date not null, --가입일
	fname varchar(50) default 'member.jpg', --회원사진
	grade char(1) default 'h', --일반회원 :h 정지:y 손님:z
	primary key(id) --한번 등록된 id중복 안됨
);

--create

delete from member;

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user1','1234','개발자1','123-1234','email1@mail.com',
'123-123','인천시','남동구','A01',sysdate,'1.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('1','1','개발자1','123-1234','email123@mail.com',
'123-123','인천시','남동구','A01',sysdate,'1.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user2','1234','개발자2','123-1234','email2@mail.com',
'123-123','광명시','남동구','A01',sysdate,'13.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('슬기','1234','개발자3','123-1234','email3@mail.com',
'123-123','용인시','남동구','A01',sysdate,'3.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user4','1234','개발자3','123-1234','email233@mail.com',
'123-123','용인시','남동구','A01',sysdate,'4.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('admin','1234','관리자','123-1234','admin@mail.com',
'123-123','용인시','남동구','A01',sysdate,'member.jpg','A');

--중복 아이디 검사 관련sql
--0:중복아님, 1:중복
select count(id)
from member
where id='user1';

select count(id) from member
where id='슬기다'
and passwd='123';

select count(id)as cnt
from member
where id='user1';

--이메일 중복 확인
select count(email) as cnt
from member
where email='email3@mail.com';

--user1회원 정보 보기
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member  
WHERE id='user1'; 

--회원이미지 수정
update member
set fname=''
where id = 'user1';

--패스워드 변경
update member
set passwd='1234'
where id ='';

select id, mname, passwd
from member
order by id desc;

--회원정보 수정
update member
set passwd='TEST',tel='123-123',
email='email10',zipcode='TEST',
address1='수원',address2='팔달구',job='TEST'
where id = 'user3';

--user회원 삭제
delete from member where id='qweqffef';
select * from member;

--로그인 관련 sql
select count(id) as cnt
from member
where id = 'user1' and passwd = '1234';

--list
select id, mname, tel, email, zipcode, address1, address2, 
fname ,r
from(
	select id, mname, tel, email, zipcode, address1, address2, 
	fname, rownum r
	from(
		select id, mname, tel, email, zipcode, address1, 
		address2, fname
		from member
		where mname like '%홍%'
		order by mdate desc 
	)
)where r >=1 and r<=5

--