create table buy(
buy_no number primary key,
customer_id varchar2(30) foreign key,
product_no number foreign key,
product_name varchar2(30) foreign key,
product_type varchar2(30) foreign key,
product_price number foreign key,
product_color varchar2(10) foreign key,
product_size number foreign key,
product_cnt number foreign key,
product_img varchar2(30) foreign key,
buy_date date default sydate,
buy_fee number not null

);
