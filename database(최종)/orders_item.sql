CREATE TABLE orders_item(
customer_id REFERENCES customer(customer_id) ON DELETE CASCADE,
item_no REFERENCES item(item_no) ON DELETE CASCADE,
item_name varchar2(30) NOT null,
item_size varchar2(100) NOT NULL,
item_color varchar2(100) NOT NULL,
item_cnt NUMBER NOT NULL check(item_cnt >= 1),
item_price NUMBER NOT NULL check(item_price >= 0)
)

drop table orders_item;
