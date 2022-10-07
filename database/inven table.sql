create table inven(
item_no REFERENCES item(item_no) on delete cascade, 
item_cnt number default 0 not null check(item_cnt >=0), 
item_in date default sysdate, 
item_out date,
item_size varchar2(6),
item_color varchar2(10)
);
