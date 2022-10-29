package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;

public interface BuyDao {
	
	//구매내역 삽입
	void insert(BuyDto buyDto);
	
	//구매 목록 회원
	List<BuyDto> selectList(String loginId);
	List<BuyDto> selectList(String loginId, String type, String keyword);
	
	//구매 목록 관리자용
	List<BuyDto> selectListAll();
	BuyDto selectOne(int buyNo);
	
	boolean update(int buyNo, String deliveryStatus);
}
