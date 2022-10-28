package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.vo.CartListVO;

public interface CartDao {

	//카트 입력
	void insert(CartDto cartDto);
	//카트 삭제 
	void delete(CartDto cartDto);
}