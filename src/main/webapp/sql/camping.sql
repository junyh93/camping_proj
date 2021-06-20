drop table member purge;

create table member (
seq 	number primary key,
id 		varchar2(20),
pswd1 	varchar2(20),
name 	varchar2(20),
email 	varchar2(30),
mobile 	varchar2(30)
);

select * from member;

insert into member values(1,'admin','admin','¥Î«•','junyh93@gmail.com','01012345678');
delete from member where seq = 2;
