create table review(
customer_id varchar2(30) foreign key,
item_no number foreign key,
review_name varchar2(30) not null,
review_content varchar2(100) not null,
review_star number not null,
review_date date default sysdate
);
