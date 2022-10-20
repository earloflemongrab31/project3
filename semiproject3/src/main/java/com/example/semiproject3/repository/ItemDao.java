package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.vo.BuyListVO;

public interface ItemDao {
	//번호 생성
	int sequence();
	
	//상품 등록
	void insert(ItemDto itemDto);
	
	//상품 목록 및 검색
	List<ItemDto> selectList();
	List<ItemDto> selectList(String type, String keyword);
	
	//상품 정보
	ItemDto selectOne(int itemNo);
	
	//상품 수정
	boolean update(ItemDto itemDto);
	
	//상품 삭제
	boolean delete(int itemNo);
	
	//좋아요 구현
	boolean like(int itemNo);
	
	//아이템과 이미지 연결
	void connectImage(int itemNo, int imageNo);
	
	//상품 목록(회원용)
	List<BuyListVO> selectBuyList();
	
	//상품 구매(회원용)
	BuyListVO selectBuyOne(int itemNo);
}
