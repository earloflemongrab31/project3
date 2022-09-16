create table customer(
customer_id varchar2(20) primary key check,
customer_pw varchar2,
customer_nick varchar2,
customer_name varchar2(21),
customer_post varchar2(6),
customer_host varchar2(150),
customer_detail_host varchar2(150),
customer_tel varchar2(11),
customer_phone varchar2(11),
customer_birth date,
customer_email varchar2,
customer_point number,
customer_grade varchar2(9),
customer_join date,
customer_login date
);
