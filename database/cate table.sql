create table cate(
cate_code char(6) primary key, 
cate_tier char(1) not null check(cate_tier in('1', '2')), 
cate_name varchar2(30) not null, 
cate_parent references cate(cate_code)
);
