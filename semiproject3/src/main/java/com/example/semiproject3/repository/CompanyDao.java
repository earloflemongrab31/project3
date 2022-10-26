package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.vo.CompanyListSearchVO;

public interface CompanyDao {

	//번호 생성
	int sequence();
	// 입력 
	void insert(CompanyDto companyDto);
	//전체목록
	List<CompanyDto> selectList();
	//디테일목록 
	CompanyDto selectOne(int companyNo);
	//삭제
	boolean delete(int companyNo);
	//수정
	boolean update(CompanyDto companyDto);
	
	//통합 메소드(검색+목록)
	List<CompanyDto> selectList(CompanyListSearchVO vo);
	List<CompanyDto> list(CompanyListSearchVO vo);
	List<CompanyDto> search(CompanyListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(CompanyListSearchVO vo);
	int searchCount(CompanyListSearchVO vo);
	int listCount(CompanyListSearchVO vo);
	
	
	
	
}