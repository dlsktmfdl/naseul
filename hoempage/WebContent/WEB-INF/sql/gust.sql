DROP TABLE gust;

DELETE FROM gust;

DROP TABLE gust PURGE;

CREATE TABLE gust(
gustno NUMBER(6)	NOT NULL,
title VARCHAR(100) NOT NULL,
content VARCHAR(4000) NOT NULL,
wdate DATE NOT NULL,
fname   VARCHAR(20)  default 'member.jpg',  
viewcnt NUMBER(5) DEFAULT 0,
PRIMARY KEY(gustno)
);


alter table gust
add(grpno  number  default 0,
	indent number  default 0,
	ansnum number  default 0
);

alter table gust
add(grpno  number  default 0,
	indent number  default 0,
	ansnum number  default 0
);


select * from gust;


alter table gust
add(refnum number  default 0
);

DROP SEQUENCE memo_seq;

CREATE SEQUENCE gust_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

SELECT gust_seq.nextval FROM dual;

SELECT gust_seq.currval FROM dual;

INSERT INTO gust(gustno, title, content, fname, wdate)
VALUES(gust_seq.nextval, '오늘의 메모','이번주 토익 시험 준비','mam.jpg',sysdate);

--자주읽는 메모 출력
SELECT gustno, title, wdate, fname, viewcnt, grpno, indent, ansnum, r
from(
	SELECT gustno, title, wdate, fname,viewcnt, grpno, indent, ansnum, rownum r
	from(
		SELECT gustno, title, wdate, fname,viewcnt, grpno, indent, ansnum
		FROM gust
		ORDER BY grpno desc, ansnum 
	)
)
where r>=1 and r<=5
--답변 read(memono, grpno, indent, ansnum, title)

select gustno, grpno, indent, ansnum, title
from gust
where gustno =701;

--답변 ansnum증가(grpno=2 and ansnum >0 )

update gust 
set ansnum = ansnum + 1
where grpno=602 
and ansnum >0;

--답변 create

INSERT INTO gust(gustno, title, content, fname,wdate, grpno, indent, ansnum)
VALUES(gust_seq.nextval, '읽을 도서', '가메출판사 오라클 11g', 'dkfe.jpg',sysdate,2,1,1);

--답변 추가시 create
INSERT INTO gust(gustno, title, content, wdate, grpno) 
VALUES(gust_seq.nextval, '저녁약속', '프로젝트 관련', sysdate,
(select nvl(max(grpno),0) +1 from gust)
);
--grp최대값을 가져와봐 널이면 0으로 바꾸고 1추가  아니면 그냥 1추가해  

select * from gust;


INSERT INTO gust(gustno, title, content, wdate)
VALUES(memo_seq.nextval, '읽을 도서', '가메출판사 오라클 11g', sysdate);

INSERT INTO gust(gustno, title, content, wdate) 
VALUES(memo_seq.nextval, '수업 복습', '메모 제작', sysdate); 

INSERT INTO gust
VALUES(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0);

delete from gust
where gustno=405;

delete from gust;


DROP TABLE news;

CREATE TABLE news(
newsno INT  NOT NULL,
title VARCHAR(100) NOT NULL,
media VARCHAR(50) NOT NULL,
author VARCHAR(30) NOT NULL,
rdate DATE NOT NULL,
PRIMARY KEY(newsno)
);

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 IE브라우저 지우너 중단', 'ZDNet', '가길동', sysdate);

SELECT newsno, title, media, author, rdate FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(4, 'MS, 2016년 구형  ''IE'' 브라우저 지원 중단','ZDNET','가길동',sysdate);

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(3, 'MS,2016년 구형 "IE" 브라우저 지원 중단','ZDNET','가길동',sysdate);
