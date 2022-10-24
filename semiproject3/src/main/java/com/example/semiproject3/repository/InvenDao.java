package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.InvenDto;

public interface InvenDao {
	
	//등록
	void insert(InvenDto invenDto);
	//전체선택
	List<InvenDto> selectList();
	//입고완료 상태일때만 아이템 총수량 업데이트 
	void plus(int quantity, int itemNo);
	//출고완료 상태일때만 아이템 총수량 업데이트
	void minus(int quantity, int itemNo);
	
	//총입고수량
	void invenIn(int quantity,int itemNo);
	//총출고수량
	void invenOut(int quantity,int itemNo);
	//검색 선택
	List<InvenDto> selectList(String type, String keyword);
	
}
