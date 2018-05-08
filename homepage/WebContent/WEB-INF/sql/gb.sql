drop table gb;

create table gb(
	gbno		number(6)		not null,
	mname		varchar(30)		not null,
	content		varchar(4000)	not null,
	wdate		date			not null,
	fname		varchar(20)		default 'member.jpg',
	primary key(gbno)
)

--create
insert into gb(gbno, mname, content, wdate, fname)
values((select nvl(max(gbno),0)+1 as gbno from gb), 
'홍길동','내용',sysdate, 'guest.jpg')
insert into gb(gbno, mname, content, wdate, fname)
values((select nvl(max(gbno),0)+1 as gbno from gb), 
'이길동','내용22',sysdate, 'guest.jpg')
insert into gb(gbno, mname, content, wdate, fname)
values((select nvl(max(gbno),0)+1 as gbno from gb), 
'나길동','내용333',sysdate, 'guest.jpg')

select*from gb

--read
select* from gb
where gbno=1

--update
update gb
set content	='내용입니다.',
where gbno=1

--delete
delete from gb
where gbno>=16 and gbno<=30

--list(paging)
select gbno, mname, content, wdate, fname , r
from(
	select gbno, mname, content, wdate, fname, rownum r
	from(
		select gbno, mname, content, wdate, fname 
		from gb
	)
)
where r>=1 and r<=5