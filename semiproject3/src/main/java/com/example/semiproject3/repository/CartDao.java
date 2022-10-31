package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;
import com.example.semiproject3.vo.CartListVO;

public interface CartDao {

	//카트 입력
	void insert(CartDto cartDto);
	
	//카트 목록
	List<CartListVO> selectList(String loginId);
	
	//카트 삭제 
	void delete(int cartNo);
	
	//장바구니 count
	int cartCount(String loginId);
	
	//장바구니에 있는 상품 수량 변경(중복인경우)
	void plus(CartDto cartDto);
	
	void minus(CartDto cartDto);
	
	//장바구니에 상품이 있는지 중복조회
	CartDto selectOne(CartDto cartDto);
	
	
}