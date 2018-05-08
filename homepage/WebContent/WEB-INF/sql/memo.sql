drop table memo;

create table memo(
	memono	 number(6)		not null,
	title  	 varchar(100) 	not null,
	content	 varchar(4000) 	not null,
	wdate	 date			not null,
	viewcnt	 number(5)		default 0,
	primary key(memono)
);



alter table memo add (refnum number default 0)

select count(refnum) from MEMO
where refnum=1

alter table memo
add(grpno 		number		default 	0,
	indent		number		default		0,
	ansnum		number		default		0
);


-- SEQUENCE 객체 삭제 
drop sequence memo_seq;
-- SEQUENCE 객체 생성 
create sequence memo_seq
start with 1
increment by 1
minvalue 0
cache 100;

-- dual: 가상 테이블, SQL형식 맞출경우 임시 테이블 사용, 변경하면 안됨
SELECT memo_seq.nextval FROM dual;

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate);

select memono, title, wdate, viewcnt from memo order by memono asc;

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval, '읽을 도서', '가메출판사 오라클 11g', sysdate);

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval, '수업 복습', '메모 제작', sysdate);

insert into memo
values(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0);

--답변추가시 insert
insert into memo(memono, title, content, wdate, grpno)
values(memo_seq.nextval, '저녁약속', '프로젝트 관련', sysdate, 
(select nvl(max(grpno),0)+1 from memo)
);

select*from memo;

--select list, 자주 읽는 메모 먼저 출력
select memono, title, wdate, viewcnt, grpno, indent, ansnum, r
	from(
		select memono, title, wdate, viewcnt, grpno, indent, ansnum, rownum r
		from(
			select memono, title, wdate, viewcnt, grpno, indent, ansnum
			from memo
			order by grpno desc, ansnum
			)
		)
where r>=1 and r<=5

--답변 read(memono, grpno, indent, ansnum, title)
select memono, grpno, indent, ansnum, title
from memo
where memono=901;

--답변  ansnum 증가(grpno=2 and ansnum>0)
update 	MEMO
set 	ansnum=ansnum+1
where 	grpno=2 
and 	ansnum>0
;

--답변 create
insert into memo(memono, title, content, wdate, grpno, indent, ansnum)
values(memo_seq.nextval, '수업 복습', '메모 제작', sysdate,
2, 1, 1
);


delete from memo;

-------------------------------------------------------------------------

drop  table news;

create table news(
	newsno	int				not null,
	title	varchar(100)	not null,
	media	varchar(50)		not null,
	author	varchar(30)		not null,
	rdate	date			not null,
	primary key(newsno)
);

insert into news(newsno, title, media, author, rdate)
values(1, 'MS, 2016년 구형 IE 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

select newsno, title, media, author, rdate from news;

insert into news(newsno, title, media, author, rdate)
values(2, 'MS, 2016년 구형 "IE" 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

insert into news(newsno, title, media, author, rdate)
values(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"', '연합뉴스', '가길동', sysdate);

insert into news(newsno, title, media, author, rdate)
values(4, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

select*from news;



