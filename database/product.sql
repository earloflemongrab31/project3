
create table product (
product_no number primary key,
product_name varchar2(30) not null,
product_memo varchar2(16) not null,
product_type varchar2(16) not null,
product_price number not null,
product_color varchar2(10) not null,
product_size number not null,
product_cnt number not null,
product_img varchar2(30) not null,
product_date date default sysdate,

);
