drop table review;
create table review(
review_no number primary key,
customer_id references customer(customer_id),
item_no references item(item_no),
review_name varchar2(30) not null,
review_content varchar2(100) not null,
review_star number not null,
review_date date default sysdate
);
