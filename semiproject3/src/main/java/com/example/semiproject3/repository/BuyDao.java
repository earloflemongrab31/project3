package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.vo.AddressUniteVO;
import com.example.semiproject3.vo.BuyListSearchVO;

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
	
	List<BuyDto> selectListAll(BuyListSearchVO vo);//관리자용 
	List<BuyDto> list(BuyListSearchVO vo);
	List<BuyDto> search(BuyListSearchVO vo);
			
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(BuyListSearchVO vo);
	int searchCount(BuyListSearchVO vo);
	int listCount(BuyListSearchVO vo);
}
