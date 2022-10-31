package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ResearchDto;

public interface ResearchDao {
	
	//insert 	
	void insert(ResearchDto researchDto);
	//리서치 아이디중복방지
	int overlapId(String customerId);
	
	List<ResearchDto> selectList();

}
