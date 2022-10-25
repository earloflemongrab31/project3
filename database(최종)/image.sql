-- 이미지 테이블
drop table image;

create table image(
image_no number primary key,
image_name varchar2(256) not null,
image_type varchar2(30) not null,
image_size number not null check(image_size >= 0),
image_time date default sysdate not null,
image_main char(1) default 0 check(image_main in ('0','1'))
);

-- 이미지 시퀀스
drop sequence image_seq;

create sequence image_seq;

-- 상품 이미지 테이블
drop table item_image;

create table item_image(
item_no references item(item_no) on delete cascade not null,
image_no references image(image_no) on delete cascade not null,
primary key(item_no, image_no)
);

-- item_image_view(아이템 이미지 뷰)
drop view item_image_view;

create view item_image_view as
select B.item_no, A.* from item_image B inner join image A on B.image_no = A.image_no;

-- buy_list_view(상품 리스트 뷰)
drop view buy_list_view;

create view buy_list_view as
select B.*, A.image_no, A.image_main from item B inner join item_image_view A on B.item_no = A.item_no;

-- cart_list_view(카트 리스트 뷰)
drop view cart_list_view;

create view cart_list_view as
select B.*, A.image_no, A.image_main from cart B inner join item_image_view A on B.item_no = A.item_no;
