create table center(
customer_id varchar2(30) primary key,
center_notice varchar2(50) not null,
center_no number not null,
center_content varchar2(50) not null,
center_qna varchar2(100) not null,
center_date date default sysdate


);
