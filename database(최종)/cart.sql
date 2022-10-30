drop table cart;

create table cart(
cart_no number primary key,
customer_id references customer(customer_id) on delete cascade not null,
item_no references item(item_no) on delete cascade not null,
item_total_cnt number default 0 check(item_total_cnt >= 0),
item_name varchar2(30) not null,
item_color varchar2(100),
item_size varchar2(100),
item_cnt number default 0 check(item_cnt >=0),
cart_date date default sysdate,
item_price number not null check(item_price >=0),
delivery_fee number default 3000,
cart_price number default 0 check(cart_price >=0)
);


select * from cart;

drop sequence cart_seq;

create sequence cart_seq;