package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CompanyDto;

public interface CompanyDao {

	//등록
	void insert(CompanyDto companyDto);
	
	//상세
	CompanyDto selectOne(int companyNo);
	
	//목록
	List<CompanyDto> selectList();
	
}
