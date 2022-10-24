package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CompanyDto;

public interface CompanyDao {

	//번호 생성
	int sequence();
	// 입력 
	void insert(CompanyDto companyDto);
	//전체목록
	List<CompanyDto> selectList();
	//디테일목록 
	CompanyDto selectOne(int companyNo);
	
}
