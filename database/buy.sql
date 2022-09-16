create table buy(
buy_no number primary key,
customer_id varchar2(30) foreign key,
item_no number foreign key,
item_name varchar2(30) foreign key,
item_type varchar2(30) foreign key,
item_price number foreign key,
item_color varchar2(10) foreign key,
item_size number foreign key,
item_cnt number foreign key,
item_img varchar2(30) foreign key,
buy_date date default sydate,
buy_fee number not null

);
