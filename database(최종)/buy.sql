create table buy(
order_no references orders(orders_no) on delete set null,
customer_id references customer(customer_id) on delete cascade,
item_no references item(item_no) on delete set null,
buy_date date default sysdate not null,
delivery_fee number(4) not null check(delivery_fee >= 0),
item_name varchar2(100) not null,
item_size varchar2(100) not null,
item_color varchar2(100) not null,
item_cnt number not null check(item_cnt >= 1),
delivery_status varchar2(30) default '결제완료' check(delivery_status in('결제완료', '배송준비중', '배송중', '배송완료')),
item_total_price number check(item_total_price >= 0),
delivery_name varchar2(21) not null,
delivery_phone varchar2(11) not null,
delivery_post varchar2(6) not null,
delivery_host varchar2(150) not null,
delivery_detail_host varchar2(150) not null
)

drop table buy;
