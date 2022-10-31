package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.vo.BuyListSearchVO;
import com.example.semiproject3.vo.BuyListSearchVO;

public interface BuyDao {
	
	//구매내역 삽입
	void insert(BuyDto buyDto);
	
	//구매 목록
	List<BuyDto> selectList(String loginId);
	List<BuyDto> selectList(String loginId, String type, String keyword);
	
	//구매 정보

	//	BuyDto selectOne(int buyNo);
	
	//페이징 구현
	//통합 메소드(검색+목록)
	List<BuyDto> selectList(BuyListSearchVO vo);
	List<BuyDto> list(BuyListSearchVO vo);
	List<BuyDto> search(BuyListSearchVO vo);
				
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(BuyListSearchVO vo);
	int searchCount(BuyListSearchVO vo);
	int listCount(BuyListSearchVO vo);
	
}
