create table cate(
cate_code char(6) primary key, 
cate_tier char(1) not null check(cate_tier in('1', '2')), 
cate_name varchar2(30) not null, 
cate_parent references cate(cate_code)
);
        cate_tier.    cate_name.  cate_code.  cate_parent.
-- 대분류     1           outer         100         null
-- 대분류     1            top          200         null
-- 대분류     1           pants         300         null
-- 대분류     1            acc          400         null

        cate_tier.    cate_name.  cate_code.  cate_parent.
-- 중분류     2            가디건         101         100(대분류/outer)
-- 중분류     2            자켓          102         100(대분류/outer)
-- 중분류     2            코드          103         100(대분류/outer)
-- 증분류     2            점퍼          104         100(대분류/outer)
-- 증분류     2            드레스         201         200(대분류/top)
-- 증분류     2            블라우스       202         200(대분류/top)
-- 증분류     2            반바지         301         300(대분류/pants)
-- 증분류     2            데님          302         300(대분류/pants)
-- 증분류     2            안경          401         400(대분류/acc)
-- 증분류     2            장갑          402         400(대분류/acc)

