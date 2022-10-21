package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.InvenDto;

public interface InvenDao {
	
	//등록
	void insert(InvenDto invenDto);
	//전체선택
	List<InvenDto> selectList();
	//입고완료 상태일때만 재고 업데이트 
	void plus(int itemNo);
	
	
}
