package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ReviewDto;

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
	
	//아이템하나에 관한리뷰목록
	List<ReviewDto> selectList2(int itemNo);
}
