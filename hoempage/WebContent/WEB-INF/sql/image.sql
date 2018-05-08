drop table image;


create table image(
ino 	number	 not null,
title 	varchar(100) not null,
fname 	varchar(100) not null,
content 	varchar(300) not null,
passwd 	varchar(100) not null,
mname 	varchar(100) not null,
wdate 	DATE 	 not null,
primary key(ino)
)

SELECT * FROM 
  ( 
     select   
         lag(imgno,2)     over (order by imgno ) pre_imgno2,  --이미지의 전전꺼(lag로 뽑아올 수 있음), over와 함께씀
         lag(imgno,1)     over (order by imgno ) pre_imgno1,  --이미지의 전꺼
         imgno,
         lead(imgno,1)    over (order by imgno ) nex_imgno1,  --read는 뒤에 
         lead(imgno,2)    over (order by imgno ) nex_imgno2,  --2뒤 
         lag(filename,2)  over (order by imgno ) pre_file2,   
         lag(filename,1)  over (order by imgno ) pre_file1,
         filename, 
         lead(filename,1) over (order by imgno ) nex_file1,
         lead(filename,2) over (order by imgno ) nex_file2 
         from ( 
              SELECT imgno, filename  
              FROM img
              ORDER BY imgno desc
         ) 
  ) 
  WHERE imgno = 3



alter table image
add(grpno  number  default 0,
	indent number  default 0,
	ansnum number  default 0
);


CREATE SEQUENCE image_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 


SELECT ino, title, fname, content, passwd, mname, wdate, r
from(
	SELECT ino, title, fname, content, passwd, mname, wdate, rownum r
	from(
		SELECT ino, title, fname, content, passwd, mname, wdate
		FROM image
		where title like '%aa%'
		order by wdate desc
	)
)
where r>=1 and r<=5



SELECT ino, title, fname, content, passwd, mname, wdate
FROM image;

select * from image;

INSERT INTO image(ino, title, fname, content, passwd, mname, wdate)
VALUES(gust_seq.nextval,'aa','mam.jpg','내용','1234','r3',sysdate);

INSERT INTO image(ino, title, fname, content, passwd, mname, wdate)
VALUES(gust_seq.nextval,'bb','mam.jpg','내용','1234','r3',sysdate);

--pwCheck
select count(*) as cnt
from image
where ino=1 and passwd='123';

--total
select count(*) as cnt
from image
WHERE "+col+" like '%'||?||'%';
