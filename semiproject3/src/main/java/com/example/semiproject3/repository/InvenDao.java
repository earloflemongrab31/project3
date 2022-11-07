package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.vo.InvenListSearchVO;

public interface InvenDao {
	
	//등록
	void insert(InvenDto invenDto);
	//전체선택
	List<InvenDto> selectList();
	
	//총입고수량
	void invenIn(int quantity,int itemNo);
	//총출고수량
	void invenOut(int quantity,int itemNo);
	//검색 선택
	List<InvenDto> selectList(String type, String keyword);
	
	
	List<InvenDto> selectList(InvenListSearchVO vo);
	List<InvenDto> list(InvenListSearchVO vo);
	List<InvenDto> search(InvenListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(InvenListSearchVO vo);
	int searchCount(InvenListSearchVO vo);
	int listCount(InvenListSearchVO vo);
	
}
