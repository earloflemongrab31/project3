--메인페이지 수정할 때 쓰는 테이블

CREATE TABLE main_edit(
main_no number PRIMARY key,
main_editor REFERENCES admin(admin_id) ON DELETE SET NULL,
main_content varchar2(4000), 
main_time DATE DEFAULT sysdate
);

--삭제용
drop table main_edit;


--메인페이지 이미지에 링크 걸 때 쓰는 테이블

CREATE taBLE main_image(
main_no REFERENCES main_edit(main_no) ON DELETE cascade,
image_no REFERENCES image(image_no) ON DELETE CASCADE,
image_path varchar2(4000) DEFAULT 'http://localhost:8888/' NOT null
);

--삭제용
drop table main_image;
