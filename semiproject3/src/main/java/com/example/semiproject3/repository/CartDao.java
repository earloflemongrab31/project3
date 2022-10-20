package com.example.semiproject3.repository;

import com.example.semiproject3.entity.CartDto;

public interface CartDao {

	//카트 입력
	void insert(CartDto cartDto);
	//카트 삭제 
	void delete(CartDto cartDto);
	//카트 체크
	boolean check(CartDto cartDto);
}
