package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ItemDto;

public interface ItemDao {
	//번호 생성
	int sequence();
	
	//상품 등록
	void add(ItemDto itemDto);
	
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
}
