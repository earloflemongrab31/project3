CREATE TABLE orders(
orders_no NUMBER PRIMARY KEY,
customer_id REFERENCES customer(customer_id) ON DELETE SET NULL,
item_no REFERENCES item(item_no) ON DELETE SET NULL,
address_name varchar2(21),
address_phone varchar2(11),
address_post varchar2(6),
address_host varchar2(150),
address_detail_host varchar2(150),
pay_money NUMBER,
delivery_fee NUMBER check(delivery_fee >= 0),
image_no NUMBER,
item_name varchar2(100),
item_price NUMBER,
item_size varchar2(100),
item_color varchar2(100),
item_cnt NUMBER,
orders_time date
);

DROP TABLE orders;

CREATE SEQUENCE orders_seq;

DROP SEQUENCE orders_seq;
