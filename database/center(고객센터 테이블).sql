drop table center;

create table center(
center_no number primary key,
customer_id references customer(customer_id),
center_content varchar2(100) not null,
center_qna varchar2(100) not null,
center_date date default sysdate,
center_title varchar2(30) not null

);
