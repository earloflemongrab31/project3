package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.vo.BuyListVO;
import com.example.semiproject3.vo.ItemListSearchVO;

public interface ItemDao {
	//번호 생성
	int sequence();
	
	//상품 등록
	void insert(ItemDto itemDto);
	
	//상품 목록 및 검색
	List<ItemDto> selectList();
	List<ItemDto> selectList(String type, String keyword);
	
	//통합 메소드(검색+목록)
	List<ItemDto> selectList(ItemListSearchVO vo);
	List<ItemDto> list(ItemListSearchVO vo);
	List<ItemDto> search(ItemListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(ItemListSearchVO vo);
	int searchCount(ItemListSearchVO vo);
	int listCount(ItemListSearchVO vo);
	
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
