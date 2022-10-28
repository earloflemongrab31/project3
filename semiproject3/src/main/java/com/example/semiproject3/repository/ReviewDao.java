package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.vo.ReviewListSearchVO;

public interface ReviewDao {

	//시퀀스 번호 생성
	int sequence();
	//리뷰작성 
	void insert(ReviewDto reviewDto);
	
	//itemNo에 달린 리뷰글 
	List<ReviewDto> selectList(int itemNo);
	
	//하나의관한 리뷰 
	ReviewDto selectOne(int reviewNo);
	
	//리뷰이미지 연결
	void connectAttachment(int reviewNo, int imageNo);
	
	//review_real
	List<ReviewDto> selectList2(int itemNo);
	
	//통합 메소드(검색+목록)
	List<ReviewDto> selectList(ReviewListSearchVO vo);
	List<ReviewDto> list(ReviewListSearchVO vo);
	List<ReviewDto> search(ReviewListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(ReviewListSearchVO vo);
	int searchCount(ReviewListSearchVO vo);
	int listCount(ReviewListSearchVO vo);
}
