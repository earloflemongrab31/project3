drop table customer;

create table customer(
customer_id varchar2(20) primary key check(regexp_like(customer_id,'^[a-z][a-z0-9_-]{4,19}$')),
customer_pw varchar2(16) not null check(regexp_like(customer_pw, '^[a-zA-Z0-9!@#$]{8,16}$')
  /*  and
    regexp_like(customer_pw, '[a-z]')
    and
    regexp_like(customer_pw, '[0-9]')
    and
    regexp_like(customer_pw, '[!@#$]') */
),
customer_pwcheck varchar2(16) not null check(regexp_like(customer_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
customer_nick varchar2(30) not null unique check(regexp_like(customer_nick, '^[가-힣][가-힣0-9]{0,9}$')),
customer_name varchar2(21) not null check(regexp_like(customer_name, '^[가-힣]{2,7}$')),
customer_post varchar2(6) not null check(regexp_like(customer_post, '^\d{5,6}$')),
customer_host varchar2(150) not null,
customer_detail_host varchar2(150),
customer_tel varchar2(11),
customer_phone varchar2(11) not null unique check(regexp_like(customer_phone,'^01[016789][1-9]\d{6,7}$')),
customer_birth date not null,
customer_email varchar2(100) check(regexp_like(customer_email,'@')),
customer_point number default 5000 check(customer_point >= 0),
customer_money number default 200000 check(customer_money >=0),
customer_grade varchar2(9) default '일반' not null check(customer_grade in('일반','VIP','관리자')),
customer_join date default sysdate,
customer_login date
);
