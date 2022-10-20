package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.InvenDto;

public interface InvenDao {
	
	//재고 등록
	void insert(InvenDto invenDto);
	
	//재고 목록
	List<InvenDto> selectList();
	List<InvenDto> selectList(String type, String keyword);
	
	//재고 정보
	InvenDto selectOne(int itemNo);
	
	//재고 수정,삭제
	boolean update(InvenDto invenDto);
	boolean delete(int itemNo);
	
	
	
}
