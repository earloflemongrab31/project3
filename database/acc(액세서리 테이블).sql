create table acc(
item_no REFERENCES item(item_no),
acc_earring varchar2(30) not null,
acc_ring varchar2(30) not null,
acc_hairclip varchar2(30) not null,
acc_socks varchar2(30) not null,
acc_cap varchar2(30) not null,
acc_muffler varchar2(30) not null

);
