package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.vo.BuyListSearchVO;
import com.example.semiproject3.vo.BuyListVO;
import com.example.semiproject3.vo.InvenListSearchVO;
import com.example.semiproject3.vo.ItemListSearchVO;
import com.example.semiproject3.vo.ItemListVO;

public interface ItemDao {
	//번호 생성
	int sequence();
	
	//상품 등록
	void insert(ItemDto itemDto);
	
	//상품 목록 및 검색
	List<BuyListVO> selectList();
	List<ItemDto> selectList(String type, String keyword);
	
	//상품 등록 목록 및 검색
	List<ItemDto> selectList(ItemListSearchVO vo);
	List<ItemDto> list(ItemListSearchVO vo);
	List<ItemDto> search(ItemListSearchVO vo);
	
	//전체 상품 현황 리스트
	List<ItemListVO> selectItemList(ItemListSearchVO vo);
	List<ItemListVO> Itemlist(ItemListSearchVO vo);
	List<ItemListVO> Itemsearch(ItemListSearchVO vo);
	
	List<ItemDto> selectList(InvenListSearchVO vo);
	List<ItemDto> list(InvenListSearchVO vo);
	List<ItemDto> search(InvenListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	//상품 등록 데이터 개수
	int count(ItemListSearchVO vo);
	int searchCount(ItemListSearchVO vo);
	int listCount(ItemListSearchVO vo);
	
	//전체 상품 현황 데이터개수
	int itemCount(ItemListSearchVO vo);
	int itemSearchCount(ItemListSearchVO vo);
	int itemListCount(ItemListSearchVO vo);
	
	int count(InvenListSearchVO vo);
	int searchCount(InvenListSearchVO vo);
	int listCount(InvenListSearchVO vo);
	
	//상품 정보
	ItemDto selectOne(int itemCnt);
	
	//상품 수정
	boolean update(ItemDto itemDto);
	
	//상품 삭제
	boolean delete(int itemNo);
	
	//좋아요 구현
	boolean like(int itemNo);
	
	//아이템과 이미지 연결
	void connectImage(int itemNo, int imageNo);
	
	//상품 검색+목록(회원용)
	List<BuyListVO> selectBuyList(BuyListSearchVO vo);
	List<BuyListVO> buyList(BuyListSearchVO vo);
	List<BuyListVO> buySearch(BuyListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int buyCount(BuyListSearchVO vo);
	int buyListCount(BuyListSearchVO vo);
	int buySearchCount(BuyListSearchVO vo);
		
	//상품 구매(회원용)
	List<BuyListVO> selectBuyList(int itemNo);
	BuyListVO selectBuyOne(int itemNo);
	
	//상품 옵션
	List<ItemListVO> selectItemList(int itemNo);
	ItemListVO selectItemOne(ItemListVO itemLitsVO);
	
	//한 개 상품 사진 하나 확인용
	ItemListVO selectItemOne(int itemNo);
	
	
}
