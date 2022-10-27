CREATE TABLE orders(
orders_no NUMBER PRIMARY KEY,
customer_id REFERENCES customer(customer_id),
delivery_fee NUMBER DEFAULT 2500
)

drop table orders;

CREATE SEQUENCE orders_seq;

DROP SEQUENCE orders_seq;
