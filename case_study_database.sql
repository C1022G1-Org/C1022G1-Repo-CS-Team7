create database casestudy;
use casestudy;

create table category(
	id int primary key,
	name_category varchar(50)
);

create table user(
id int primary key auto_increment,
name varchar(50),
username varchar(50),
password varchar(50),
role int
);

create table borrow(
id int primary key auto_increment,
book_id int,
id_user int,
foreign key (book_id) references book(id),
foreign key (id_user) references user(id)  
);


create table book (
 id int primary key auto_increment,
 name varchar(50),
 page_size int,
 cost double,
 name_author varchar(50),
 id_category int,
 foreign key(id_category) references category(id)
 );
 
 insert into category (id,name_category) values (1,'Truyện tranh trong nước'), (2,'Truyện tranh nước ngoài');
 insert into book (name,page_size,cost,name_author,id_category) values('Bảy viên Ngọc Rồng',20,20000,'Toriyama Akira ',2),
 ('Thần đồng đất việt',20,20000,'Fujiko Fujio',1),
('Đoraemon',20,20000,'Fujiko Fujio',1),
('Connan',20,20000,' Gosho Aoyama',2);

insert into book (name, page_size, cost, name_author, id_category) values ('Bảy viên ',20,1111,'acv Akira ',2);
select b.id ,b.name,b.page_size,b.cost,b.name_author,c.name_category from book b
join category c on b.id_category = c.id;
select * from book;

