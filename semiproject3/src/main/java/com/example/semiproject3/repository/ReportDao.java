package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ReportDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.vo.ReviewListSearchVO;

public interface ReportDao {

	//입력
	void insert(ReportDto roportDto);
	
	//목록
	List<ReportDto> selectList();
	
	//타입 키워드
	List<ReportDto> selectList(String type, String keyword);
	
	//통합 메소드(검색+목록)
	List<ReportDto> selectList(ReviewListSearchVO vo);
	List<ReportDto> list(ReviewListSearchVO vo);
	List<ReportDto> search(ReviewListSearchVO vo);
			
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(ReviewListSearchVO vo);
	int searchCount(ReviewListSearchVO vo);
	int listCount(ReviewListSearchVO vo);
}
