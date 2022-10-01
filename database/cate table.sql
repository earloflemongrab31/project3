create table cate(
cate_tier char(1) check(cate_tier in('1', '2')), 
cate_name varchar2(30) not null,
cate_code char(6) primary key,  
cate_parent references cate(cate_code)
);

insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'outer',100,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'자켓',101,100);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'코트',102,100);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'가디건',103,100);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'패딩',104,100);
insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'top',200,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'민소매',201,200);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'티셔츠',202,200);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'맨투맨',203,200);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'니트',204,200);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'블라우스',205,200);
insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'pants',300,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'청바지',301,300);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'면바지',302,300);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'슬랙스',303,300);
insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'skirt',400,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'숏기장',401,400);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'롱기장',402,400);
insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'dress',500,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'원피스',501,500);
insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'acc',600,null);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'쥬얼리',601,600);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'모자',602,600);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'가방',603,600);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'신발',604,600);
	insert into cate(cate_tier, cate_name, cate_code,cate_parent) values (1,'양말',605,600);
        
		cate_tier.		cate_name.	cate_code.	cate_parent.
-- 대분류		1			outer		100		null
-- 대분류		1			top		200		null
-- 대분류		1			pants		300		null
-- 대분류		1			skirt		400		null
-- 대분류		1			dress		500		null
-- 대분류		1			acc		600		null
		
		cate_tier.		cate_name.	cate_code.	cate_parent.
-- 중분류		2			자켓		101		100(대분류/outer)
-- 중분류		2			코트		102		100(대분류/outer)
-- 중분류		2			가디건		103		100(대분류/outer)
-- 중분류		2			패딩		104		100(대분류/outer)

-- 중분류		2			민소매		201		200(대분류/top)
-- 중분류		2			티셔츠		202		200(대분류/top)
-- 중분류		2			맨투맨		203		200(대분류/top)
-- 중분류		2			니트		204		200(대분류/top)
-- 중분류		2			블라우스		205		200(대분류/top)

-- 중분류		2			청바지		301		300(대분류/pants)
-- 중분류		2			면바지		302		300(대분류/pants)
-- 중분류		2			슬랙스		303		300(대분류/pants)

-- 중분류		2			숏기장		401		400(대분류/skirt)
-- 중분류		2			롱기장		402		400(대분류/skirt)

-- 중분류		2			원피스		501		500(대분류/dress)
		
-- 중분류		2			쥬얼리		601		600(대분류/acc)
-- 중분류		2			모자		602		600(대분류/acc)
-- 중분류		2			가방		603		600(대분류/acc)
-- 중분류		2			신발		604		600(대분류/acc)
-- 중분류		2			양말		605		600(대분류/acc)

-- 원피스는 종류가 하나만 있는 것 같아서 일단 하나만 넣었어요. 이게 되면 치마도 그냥 하나로 해버리는 건 어떨지 고민해봐야할 것 같아요~!
