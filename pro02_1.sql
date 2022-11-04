create database myshop;
commit;

use myshop;
create table customer( cusId varchar(16) primary key, cusPw varchar(100) not null, cusName varchar(50) not null, address varchar(100) not null, tel varchar(15) not null, 
regDate datetime default now(), point int default 0, level int default 0, visited int default 0
);
desc customer;
alter table customer modify cusPw varchar(200);							
select * from customer;

create table notice (
	notiNo int primary key auto_increment, title varchar(50), content varchar(1000), author varchar(16), resdate datetime default now()
    );
desc notice;


insert into notice (title, content, author) values("제목1", "내용 1 입니다. 테스트중입니다.", "admin");
insert into notice (title, content, author) values("제목2", "내용 2 입니다. 테스트중입니다.", "admin");
insert into notice (title, content, author) values("제목3", "내용 3 입니다. 테스트중입니다.", "admin");
insert into notice (title, content, author) values("제목4", "내용 4 입니다. 테스트중입니다.", "admin");
insert into notice (title, content, author) values("제목5", "내용 5 입니다. 테스트중입니다.", "admin");

select * from notice;
select * from notice order by notino desc;
commit;

create table product (proNo int primary key auto_increment, cateNo int, proName varchar(50), proSpec varchar(100), proPrice varchar(20), proPic varchar(100));

create table category (cateNo int primary key auto_increment, cateName varchar(50));
insert into category (cateName) values ("mattress");
insert into category (cateName) values ("motionmatt");
insert into category (cateName) values ("frame");
insert into category (cateName) values ("pillow");
insert into category (cateName) values ("bedding");
select * from category;