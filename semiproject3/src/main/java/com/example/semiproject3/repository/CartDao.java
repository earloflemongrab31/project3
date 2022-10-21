package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.vo.CartListVO;

public interface CartDao {

	//카트 입력
	void insert(CartDto cartDto);
	//카트 삭제 
	void delete(CartDto cartDto);
	//카트 체크
	boolean check(CartDto cartDto);
	//회원이 장바구니에 담음 아이템 
	List<CartDto> selectList(String loginId);
	//회원이 선택한 총 장바구니갯수 구하기
	int selectCart(String loginId);
//	//상품 가격 더하기  
//	void plusItem(String loginId);
//	//상품 가격 빼기
//	void minusItem(String loginId);
	
	//장바구니 이미지 추가
	List<CartListVO> selectCartList(String loginId);
}
