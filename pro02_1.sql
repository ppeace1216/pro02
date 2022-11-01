create database myshop;
commit;
use myshop;
create table customer( cusId varchar(16) primary key, cusPw varchar(100) not null, cusName varchar(50) not null, address varchar(100) not null, tel varchar(15) not null, 
regDate datetime default now(), point int default 0, level int default 0, visited int default 0
);
desc customer;

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

