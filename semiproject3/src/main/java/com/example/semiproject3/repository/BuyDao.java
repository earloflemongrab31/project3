package com.example.semiproject3.repository;

import com.example.semiproject3.entity.BuyDto;

public interface BuyDao {
	
	//구매 번호 생성
	int sequence();
	
	//구매
	void insert(BuyDto buyDto);
	
	//수정
	boolean update(int buyNo);
	
	
}
