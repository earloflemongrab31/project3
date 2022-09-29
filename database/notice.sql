create table notice(
admin_id references customer(customer_id) on delete set null, 
notice_no number primary key, 
notice_title varchar2(100) not null,
notice_date date default sysdate,
notice_update date,
notice_read number default 0,
notice_content varchar2(4000) not null, 
notice_head varchar2(9) check(notice_head in('긴급','이벤트'))
);

create sequence notice_seq;
