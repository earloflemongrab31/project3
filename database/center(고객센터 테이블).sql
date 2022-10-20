drop table center;

create table center(
center_no number primary key,
customer_id references customer(customer_id) on delete set null ,
admin_id references admin(admin_id) on delete cascade,
center_title varchar2(30),
customer_content varchar2(4000),
admin_content varchar2(4000),
customer_date date default sysdate,
admin_date date default sysdate
);

commit;
