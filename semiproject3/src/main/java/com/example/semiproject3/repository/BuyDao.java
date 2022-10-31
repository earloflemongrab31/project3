package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.vo.BuyListSearchVO;

public interface BuyDao {
	
	//구매내역 삽입
	void insert(BuyDto buyDto);
	
	//구매 목록 회원
	List<BuyDto> selectList(String loginId);
	List<BuyDto> selectList(String loginId, String type, String keyword);
	
	//구매 목록 관리자용 페이징
	List<BuyDto> selectAdminList(BuyListSearchVO vo);
	List<BuyDto> adminList(BuyListSearchVO vo);
	List<BuyDto> adminSearch(BuyListSearchVO vo);
	
	int count(BuyListSearchVO vo);
	int searchCount(BuyListSearchVO vo);
	int listCount(BuyListSearchVO vod);
	
	
	BuyDto selectOne(int buyNo);
	boolean update(int buyNo, String deliveryStatus);
	
	//구매후 상품 수량 감소
	void minus(BuyDto buyDto);
	
}