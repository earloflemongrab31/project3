drop sequence item_seq;
create sequence item_seq;

drop table item;

create table item (
item_no number primary key,
cate_code references cate(cate_code) on delete cascade, 
item_name varchar2(30) not null, 
item_memo varchar2(100) not null, 
item_content varchar2(4000) not null, 
item_price number not null,
item_color varchar2(10) not null,
item_size varchar2(30) not null,
item_total_cnt number default 0,
item_like_cnt number default 0 not null check(item_like_cnt >= 0),
item_date date default sysdate
);
