package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CenterDto;

public interface CenterDao {

	//번호생성
	int sequence();
	
	//등록
	void insert(CenterDto centerDto);
	
	//목록 & 타입키워드 목록
	List<CenterDto> selectList();
	List<CenterDto> selectList(String type, String keyword);
	
	//셀렉트원
	CenterDto selectOne(int centerNo);
	
	//수정,삭제
	boolean update(CenterDto centerDto);
	boolean delete(int centerNo);
	
}
