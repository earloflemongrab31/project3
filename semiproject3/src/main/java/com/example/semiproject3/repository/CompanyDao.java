package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.vo.CompanyUniteVO;

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
	List<CompanyDto> selectList(CompanyUniteVO vo);
	List<CompanyDto> list(CompanyUniteVO vo);
	List<CompanyDto> search(CompanyUniteVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(CompanyUniteVO vo);
	int searchCount(CompanyUniteVO vo);
	int listCount(CompanyUniteVO vo);
	
	// 회사 
	void connectAttachment(int companyNo, int imageNo);
	
	//통합메소드2 +아이템번호추가
	List<CompanyDto> selectList2();
	
	
	
}