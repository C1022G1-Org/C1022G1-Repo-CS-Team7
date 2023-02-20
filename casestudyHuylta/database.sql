create database casestudy;
use casestudy;

create table author (
id int primary key auto_increment,
name_author varchar(50)
);
create table category (
id int primary key auto_increment,
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
id_author int,
cost int,
id_category int,
foreign key (id_author) references author(id),
foreign key (id_category) references category(id)  
);

insert into author(name_author) values('Huy Cận'),('Tố Hữu'),('William'),('Join');
insert into category(name_category) values ('Văn Học Trong Nước'),('Văn Học Nước Ngoài'),('Kịch Dài'),('Tiẻu Thuyết');
insert into book(name,page_size,id_author,cost,id_category) values('Đoàn Thuyền Đánh Cá',20,1,20000,1),('Chúa Tể Của Những Chiếc Nhẫn',402,3,500000,2)