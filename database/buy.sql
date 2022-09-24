create table buy(
buy_no number primary key,
customer_id references customer(customer_id),
item_no references item(item_no),
item_name references item(item_name),
item_type references item(item_type),
item_price references item(item_price),
item_color references item(item_color),
item_size references item(item_size),
item_cnt references item(item_cnt),
item_img references item(item_img),
buy_date date default sydate,
buy_fee number not null
);
