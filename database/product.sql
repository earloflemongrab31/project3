
create table item (
item_no number primary key,
item_name varchar2(30) not null,
item_memo varchar2(16) not null,
item_type varchar2(16) not null,
item_price number not null,
item_color varchar2(10) not null,
item_size number not null,
item_cnt number not null,
item_img varchar2(30) not null,
item_date date default sysdate,
);
