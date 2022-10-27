package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CenterDto;
import com.example.semiproject3.vo.CenterListSearchVO;

public interface CenterDao {

	//번호생성
	int sequence();
	
	//등록
	void insert(CenterDto centerDto);
	
	//목록 & 타입키워드 목록 -> 필요 없지 않나용?	
//	List<CenterDto> selectList();
//	List<CenterDto> selectList(String type, String keyword);

	//페이징
	int count(CenterListSearchVO vo);
	int searchCount(CenterListSearchVO vo);
	int listCount(CenterListSearchVO vo);
	
	//통합 검색 메소드(목록+검색)
	List<CenterDto> selectList(CenterListSearchVO vo);
	List<CenterDto> list(CenterListSearchVO vo);
	List<CenterDto> search(CenterListSearchVO vo);
	
	//셀렉트원
	CenterDto selectOne(int centerNo);
	
	//수정,삭제
	boolean update(CenterDto centerDto);
	boolean delete(int centerNo);
	
}
