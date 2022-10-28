package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;

public interface BuyDao {
	
	//구매내역 삽입
	void insert(BuyDto buyDto);
	
	//구매 목록
	List<BuyDto> selectList();
	List<BuyDto> selectList(String type, String keyword);
	
	//구매 정보
	BuyDto selectOne(int buyNo);
	
}
