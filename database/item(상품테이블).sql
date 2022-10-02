drop sequence item_seq;
create sequence item_seq;

drop table item;

create table item (
item_no number primary key,
cate_code references cate(cate_code) on delete cascade, 
item_name varchar2(30) not null, 
item_memo varchar2(100) not null, 
item_content varchar2(4000) not null, 
item_price number not null,
item_color varchar2(10) not null,
item_size varchar2(30) not null,
item_total_cnt number default 0,
item_like_cnt number default 0,    
item_basket_cnt number default 0,
item_date date default sysdate
);


-- item_color 범위 s,m,l,xl,xxl 해서 varchar2(3)으로 바꿔도 될 것 같아요.
-- size랑 color 컬럼을 아예 여러개를 추가해서 ex)size1/size2/size3...
-- 각 컬럼 중에 1은 not null이고 나머지는 선택으로 해가지고 저장하는 건 어떨까용?
